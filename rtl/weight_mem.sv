`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : Weight memory module

module weight_mem #(
    parameter memSize    = 784 , 
              addrWidth  = 10  ,
              dataWidth  = 16  ,
              weightFile = ""
) (
    input                        clk   ,
    input                        ren   ,
    input      [addrWidth - 1:0] raddr ,
    output reg [dataWidth - 1:0] wout
);

// Weight Memory array
reg [dataWidth - 1:0] mem [memSize - 1:0];

initial begin
    $readmemb(weightFile, mem);
end

always @(posedge clk) begin
    if (ren)
    begin
        wout <= mem[raddr];
    end
end

endmodule