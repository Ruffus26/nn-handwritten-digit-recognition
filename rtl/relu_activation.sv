`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : ReLu activation function

module relu_activation #(
    parameter dataWidth = 16,
    parameter intPart   = 4
) (
    input                               clk        ,
    input                               rst_n      ,
    input                               relu_valid ,
    input signed [2*dataWidth - 1:0]    relu_in    ,
    output reg signed [dataWidth - 1:0] relu_out
);

localparam minusonetenth = 1.0**-1.0;

always @(posedge clk) begin
    if (~rst_n)
        relu_out <= 0;
    else if (relu_valid)
        if ($signed(relu_in) >= 0)
            relu_out <= relu_in[2*dataWidth-1-intPart-:dataWidth];
        else
            relu_out <= 0;
end

endmodule