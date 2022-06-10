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
localparam hidden_layer_1_nn = 30;
localparam hidden_layer_2_nn = 30;
localparam hidden_layer_3_nn = 10;
localparam out_layer_nn      = 10;
localparam sigmoid_size      = 5;

// Hidden layer 1 registers and connection wires
wire [hidden_layer_1_nn - 1:0]           hidden_layer_1_out_valid   ;
wire [hidden_layer_1_nn*dataWidth - 1:0] hidden_layer_1_out_data    ;
reg  [hidden_layer_1_nn*dataWidth - 1:0] hidden_layer_1_data_buffer ;
reg                                      hlayer_1_out_valid         ;
reg  [dataWidth - 1:0]                   hlayer_1_out_data          ;

hidden_layer_1 #(
    .dataWidth       (dataWidth                ),
    .neurons         (hidden_layer_1_nn        )
) i_hidden_layer_1 (
    .clk             (clk                      ),
    .rst_n           (rst_n                    ),
    .layer_in_valid  (net_valid                ),
    .layer_in_data   (net_data                 ),
    .layer_out_valid (hidden_layer_1_out_valid ),
    .layer_out_data  (hidden_layer_1_out_data  )
);

// Hidden layer 1 FSM definition
reg       h1_state   ;
reg [5:0] h1_counter ;

always @(posedge clk) begin
    if (~rst_n) begin
        h1_state           <= IDLE;
        h1_counter         <= 0;
        hlayer_1_out_valid <= 0;
    end else begin
        case (h1_state)
            IDLE: begin
                h1_counter         <= 0;
                hlayer_1_out_valid <= 0;
                if (hidden_layer_1_out_valid[0]) begin
                    h1_state                   <= SEND;
                    hidden_layer_1_data_buffer <= hidden_layer_1_out_data;
                    h1_counter                 <= h1_counter + 1;
                    hlayer_1_out_valid         <= 1'b1;
                    hlayer_1_out_data          <= hidden_layer_1_out_data[dataWidth - 1:0];
                end
            end
            SEND: begin
                hlayer_1_out_valid <= 1'b1;
                hlayer_1_out_data  <= hidden_layer_1_data_buffer[h1_counter*dataWidth+:dataWidth];
                h1_counter         <= h1_counter + 1;
                if (h1_counter == hidden_layer_1_nn) begin
                    h1_state           <= IDLE;
                    hlayer_1_out_valid <= 0;
                end
            end
        endcase
    end
end

// Hidden layer 2 registers and connection wires
wire [hidden_layer_2_nn - 1:0]           hidden_layer_2_out_valid   ;
wire [hidden_layer_2_nn*dataWidth - 1:0] hidden_layer_2_out_data    ;
reg  [hidden_layer_2_nn*dataWidth - 1:0] hidden_layer_2_data_buffer ;
reg                                      hlayer_2_out_valid         ;
reg  [dataWidth - 1:0]                   hlayer_2_out_data          ;

hidden_layer_2 #(
    .dataWidth       (dataWidth                ),
    .neurons         (hidden_layer_2_nn        )
) i_hidden_layer_2 (
    .clk             (clk                      ),
    .rst_n           (rst_n                    ),
    .layer_in_valid  (hlayer_1_out_valid       ),
    .layer_in_data   (hlayer_1_out_data        ),
    .layer_out_valid (hidden_layer_2_out_valid ),
    .layer_out_data  (hidden_layer_2_out_data  )
);

// Hidden layer 2 FSM definition
reg       h2_state   ;
reg [4:0] h2_counter ;

always @(posedge clk) begin
    if (~rst_n) begin
        h2_state           <= IDLE;
        h2_counter         <= 0;
        hlayer_2_out_valid <= 0;
    end else begin
        case (h2_state)
            IDLE: begin
                h2_counter         <= 0;
                hlayer_2_out_valid <= 0;
                if (hidden_layer_2_out_valid[0]) begin
                    h2_state                   <= SEND;
                    hidden_layer_2_data_buffer <= hidden_layer_2_out_data;
                    h2_counter                 <= h2_counter + 1;
                    hlayer_2_out_valid         <= 1'b1;
                    hlayer_2_out_data          <= hidden_layer_2_out_data[dataWidth - 1:0];
                end
            end
            SEND: begin
                hlayer_2_out_valid <= 1'b1;
                hlayer_2_out_data  <= hidden_layer_2_data_buffer[h2_counter*dataWidth+:dataWidth];
                h2_counter         <= h2_counter + 1;
                if (h2_counter == hidden_layer_2_nn) begin
                    h2_state           <= IDLE;
                    hlayer_2_out_valid <= 0;
                end
            end
        endcase
    end
end

// Hidden layer 3 registers and connection wires
wire [hidden_layer_3_nn - 1:0]           hidden_layer_3_out_valid   ;
wire [hidden_layer_3_nn*dataWidth - 1:0] hidden_layer_3_out_data    ;
reg  [hidden_layer_3_nn*dataWidth - 1:0] hidden_layer_3_data_buffer ;
reg                                      hlayer_3_out_valid         ;
reg  [dataWidth - 1:0]                   hlayer_3_out_data          ;

hidden_layer_3 #(
    .dataWidth       (dataWidth                ),
    .neurons         (hidden_layer_3_nn        )
) i_hidden_layer_3 (
    .clk             (clk                      ),
    .rst_n           (rst_n                    ),
    .layer_in_valid  (hlayer_2_out_valid       ),
    .layer_in_data   (hlayer_2_out_data        ),
    .layer_out_valid (hidden_layer_3_out_valid ),
    .layer_out_data  (hidden_layer_3_out_data  )
);

// Hidden layer 3 FSM definition
reg       h3_state   ;
reg [4:0] h3_counter ;

always @(posedge clk) begin
    if (~rst_n) begin
        h3_state           <= IDLE;
        h3_counter         <= 0;
        hlayer_3_out_valid <= 0;
    end else begin
        case (h3_state)
            IDLE: begin
                h3_counter         <= 0;
                hlayer_3_out_valid <= 0;
                if (hidden_layer_3_out_valid[0]) begin
                    h3_state                   <= SEND;
                    hidden_layer_3_data_buffer <= hidden_layer_3_out_data;
                    h3_counter                 <= h3_counter + 1;
                    hlayer_3_out_valid         <= 1'b1;
                    hlayer_3_out_data          <= hidden_layer_3_out_data[dataWidth - 1:0];
                end
            end
            SEND: begin
                hlayer_3_out_valid <= 1'b1;
                hlayer_3_out_data  <= hidden_layer_3_data_buffer[h3_counter*dataWidth+:dataWidth];
                h3_counter         <= h3_counter + 1;
                if (h3_counter == hidden_layer_3_nn) begin
                    h3_state           <= IDLE;
                    hlayer_3_out_valid <= 0;
                end
            end
        endcase
    end
end

// Output layer connection wires
wire                                output_layer_valid ;
wire [out_layer_nn*dataWidth - 1:0] output_layer_data  ;

output_layer #(
    .dataWidth           (dataWidth          ),
    .neurons             (out_layer_nn       )
) i_output_layer (
    .clk                 (clk                ),
    .rst_n               (rst_n              ),
    .out_layer_in_valid  (hlayer_3_out_valid ),
    .out_layer_in_data   (hlayer_3_out_data  ),
    .out_layer_out_valid (output_layer_valid ),
    .out_layer_out_data  (output_layer_data  )
);

//// Max finder instantiation ////

max_find #(
    .dataWidth (dataWidth          ),
    .inData    (out_layer_nn       )
) i_max_find (
    .clk       (clk                ),
    .rst_n     (rst_n              ),
    .in_valid  (output_layer_valid ),
    .in_data   (output_layer_data  ),
    .out_valid (net_out_valid      ),
    .out_data  (net_out_data       )
);

endmodule