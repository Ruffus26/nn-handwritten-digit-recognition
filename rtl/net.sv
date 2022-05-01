`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : Neural network module

module net #(
    parameter dataWidth = 16,
    parameter outData   = 10,
    parameter outWidth  = $clog2(outData)
) (
    input                         clk           ,
    input                         rst_n         ,
    input                         net_valid     ,
    input       [dataWidth - 1:0] net_data      ,
    output wire                   net_out_valid ,
    output wire [outWidth - 1:0]  net_out_data
);

//// Layers instantiation ////

// FSM states definition
localparam IDLE = 0;
localparam SEND = 1;

// NN parameters
localparam hidden_layer_nn = 16;
localparam out_layer_nn    = 10;

// Hidden layer registers and connection wires
wire [hidden_layer_nn - 1:0]           hidden_layer_out_valid   ;
wire [hidden_layer_nn*dataWidth - 1:0] hidden_layer_out_data    ;
reg  [hidden_layer_nn*dataWidth - 1:0] hidden_layer_data_buffer ;
reg                                    hlayer_out_valid         ;
reg  [dataWidth - 1:0]                 hlayer_out_data          ;

hidden_layer #(
    .dataWidth       (dataWidth              )
) i_hidden_layer (
    .clk             (clk                    ),
    .rst_n           (rst_n                  ),
    .layer_in_valid  (net_valid              ),
    .layer_in_data   (net_data               ),
    .layer_out_valid (hidden_layer_out_valid ),
    .layer_out_data  (hidden_layer_out_data  )
);

// Hidden layer FSM definition
reg       h_state   ;
reg [4:0] h_counter ;

always @(posedge clk) begin
    if (~rst_n) begin
        h_state          <= IDLE;
        h_counter        <= 0;
        hlayer_out_valid <= 0;
    end else begin
        case (h_state)
            IDLE: begin
                h_counter        <= 0;
                hlayer_out_valid <= 0;
                if (hidden_layer_out_valid[0]) begin
                    h_state                  <= SEND;
                    hidden_layer_data_buffer <= hidden_layer_out_data;
                    h_counter                <= h_counter + 1;
                    hlayer_out_valid         <= 1'b1;
                    hlayer_out_data          <= hidden_layer_out_data[dataWidth - 1:0];
                end
            end
            SEND: begin
                hlayer_out_valid <= 1'b1;
                hlayer_out_data  <= hidden_layer_data_buffer[h_counter*dataWidth+:dataWidth];
                h_counter        <= h_counter + 1;
                if (h_counter == hidden_layer_nn) begin
                    h_state      <= IDLE;
                    hlayer_out_valid <= 0;
                end
            end
        endcase
    end
end

// Output layer connection wires
wire                                output_layer_valid ;
wire [out_layer_nn*dataWidth - 1:0] output_layer_data  ;

output_layer #(
    .dataWidth           (dataWidth          )
) i_output_layer (
    .clk                 (clk                ),
    .rst_n               (rst_n              ),
    .out_layer_in_valid  (hlayer_out_valid   ),
    .out_layer_in_data   (hlayer_out_data    ),
    .out_layer_out_valid (output_layer_valid ),
    .out_layer_out_data  (output_layer_data  )
);

//// Max finder instantiation ////

max_find #(
    .dataWidth (dataWidth          )
) i_max_find (
    .clk       (clk                ),
    .rst_n     (rst_n              ),
    .in_valid  (output_layer_valid ),
    .in_data   (output_layer_data  ),
    .out_valid (net_out_valid      ),
    .out_data  (net_out_data       )
);

endmodule