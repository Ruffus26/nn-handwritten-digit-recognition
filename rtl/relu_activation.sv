`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : ReLu activation function

module relu_activation #(
    parameter dataWidth = 16,
    parameter intWidth  = 4
) (
    input                         clk        ,
    input                         rst_n      ,
    input                         relu_valid ,
    input  [2*dataWidth - 1:0]    relu_in    ,
    output reg  [dataWidth - 1:0] relu_out
);

always @(posedge clk) begin
    if (~rst_n)
        relu_out <= 0;
    else if (relu_valid)
        if ($signed(relu_in) >= 0)
            if(|relu_in[2*dataWidth-1-:intWidth + 1])
                relu_out <= {1'b0, {(dataWidth - 1){1'b1}}};
            else
                relu_out <= relu_in[2*dataWidth-1-intWidth-:dataWidth];
        else
            relu_out <= 0;
end

endmodule