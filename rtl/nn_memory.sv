`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : Neural Network Input Memory module

module nn_memory #(
    parameter dataWidth = 16,
    parameter memWidth  = 784
) (
    input                        clk       ,
    input                        rst_n     ,
    input                        ren       ,
    output reg                   mem_valid ,
    output reg [dataWidth - 1:0] mem_data  ,
    output reg                   data_last 
);

// Memory array
reg [dataWidth - 1:0] mem [memWidth - 1:0];

// Memory parameters
localparam addrWidth = $clog2(memWidth);

initial begin
    // Read neural inputs from the memory initialization file
    $readmemb("input_nn.mem", mem);
end

// Memory address pointer
reg [addrWidth - 1:0] addr_counter;

// Memory definition
always @(posedge clk) begin
    if (~rst_n) begin
        mem_valid    <= 1'b0;
        mem_data     <= 'b0;
        addr_counter <= 0;
        data_last    <= 1'b0;
    end else if (ren && addr_counter < memWidth) begin
        mem_valid    <= 1'b1;
        mem_data     <= mem[addr_counter];
        if (addr_counter == memWidth - 1) 
            data_last <= 1'b1;
        addr_counter <= addr_counter + 1;
    end else begin
        mem_valid    <= 1'b0;
        addr_counter <= 0;
        data_last    <= 1'b0;
    end
end

endmodule