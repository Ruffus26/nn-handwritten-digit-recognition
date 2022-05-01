`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : Sigmoid mapped memory

module sigmoid_rom #(
    parameter inWidth     = 5  ,
              dataWidth   = 16 ,
              sigmoidFile = ""
) (
    input                    clk      ,
    input                    in_val   ,
    input  [inWidth - 1:0]   sig_in   ,
    output [dataWidth - 1:0] sig_out
);

// Sigmoid memory
reg [dataWidth - 1:0] mem [2**inWidth - 1:0];
reg [inWidth - 1:0]   out_index;

initial begin
    $readmemb(sigmoidFile, mem);
end

assign sig_out = mem[out_index];

always @(posedge clk)
begin
    if (in_val)
        if ($signed(sig_in) >= 0)
            out_index <= sig_in + (2**(inWidth - 1));
        else
            out_index <= sig_in - (2**(inWidth - 1)); 
end

endmodule