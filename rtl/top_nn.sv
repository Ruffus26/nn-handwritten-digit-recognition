`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : The top neural network module

module top_nn;

// Wires
wire   clk;
wire   rst_n;

// Generate a clock signal (with a frequency of 100 Mhz)
reg clock;
initial begin
    clock <= 1'b0;
    #10;
    forever #5 clock <= ~clock;
end

// Generate an active low reset signal
reg reset_n;
initial begin
    reset_n <= 1'b1;
    #40;
    reset_n <= 1'b0;
    #50;
    reset_n <= 1'b1;
end

// Assignmets
assign clk = clock;
assign rst_n = reset_n;

// Parameters
localparam dataWidth = 16;
localparam outData   = 10;
localparam outWidth  = $clog2(outData);

// Interconnection wires
wire                   read_en;
wire                   mem_valid ;
wire [dataWidth - 1:0] mem_data  ;
wire                   last      ;
wire                   net_valid ;
wire [outWidth - 1:0]  net_data  ;

// Generate a read enable signal
reg renable;
initial begin
    @(posedge clk);
    renable <= 1'b0;
    @(posedge rst_n);
    @(posedge clk);
    renable <= 1'b1;
    @(negedge last);
    renable <= 1'b0;
end

assign read_en = renable;

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

// Neural network output definition
always @(posedge clk) begin
    if (net_valid) begin
        $display("Recognized digit = %0d", net_data);
    end
end
    
endmodule