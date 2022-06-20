`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : The top neural network module (synthesizable)

module top_nn (
    input  clk    ,
    input  rst    ,
    input  enable ,
    output LED0   ,
    output LED1   ,
    output LED2   ,
    output LED3
);

// Parameters
localparam dataWidth       = 16;
localparam outData         = 10;
localparam outWidth        = $clog2(outData);

// Interconnection wires
wire                   rst_n     ;
wire                   mem_valid ;
wire [dataWidth - 1:0] mem_data  ;
wire                   last      ;
wire                   net_valid ;
wire [outWidth - 1:0]  net_data  ;

// Internal registers
reg  renable   ;
reg  last_done ;

// Assignmets
assign rst_n   = ~rst       ;
assign read_en = renable    ;
assign LED0    = net_data[0];
assign LED1    = net_data[1];
assign LED2    = net_data[2];
assign LED3    = net_data[3];

// Enable reading from memory
always @(posedge clk) begin
    if (~rst_n)
        renable <= 1'b0;
    else if (last)
        renable <= 1'b0;
    else if (enable & ~last_done)
        renable <= 1'b1;
end

always @(posedge clk) begin
    if (~rst_n)
        last_done <= 1'b0;
    else if (last)
        last_done <= 1'b1;
end

// Instantiate the neural network memory
nn_memory #(
    .dataWidth (dataWidth )
) i_nn_memory (
    .clk       (clk       ),
    .rst_n     (rst_n     ),
    .ren       (read_en   ),
    .mem_valid (mem_valid ),
    .mem_data  (mem_data  ),
    .data_last (last      )
);

// Instantiate the neural network core
net #(
    .dataWidth     (dataWidth ),
    .outData       (outData   ),
    .outWidth      (outWidth  )
) i_net (
    .clk           (clk       ),
    .rst_n         (rst_n     ),
    .net_valid     (mem_valid ),
    .net_data      (mem_data  ),
    .net_out_valid (net_valid ),
    .net_out_data  (net_data  )
);
    
endmodule