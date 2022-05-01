`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : Max find module

module max_find #(
    parameter inData    = 10,
    parameter dataWidth = 16,
    parameter outWidth  = $clog2(inData)
) (
    input                              clk       ,
    input                              rst_n     ,
    input                              in_valid  ,
    input [(inData * dataWidth) - 1:0] in_data   ,
    output reg                         out_valid ,
    output reg [outWidth - 1:0]        out_data
);

// Internal registers
reg [dataWidth - 1:0]            max_value      ;
reg [(inData * dataWidth) - 1:0] in_data_buffer ;
reg [outWidth - 1:0]             counter        ;

always @(posedge clk) begin
    if (~rst_n) begin
        out_valid <= 1'b0;
        out_data  <= 'b0; 
    end
    else if (in_valid) begin
        max_value      <= in_data[dataWidth - 1:0];
        counter        <= 1;
        in_data_buffer <= in_data;
        out_data       <= 0;
    end
    else if (counter == inData) begin
        counter   <= 0;
        out_valid <= 1'b1;
    end
    else if (counter != 0) begin
        counter <= counter + 1;
        if (in_data_buffer[counter*dataWidth+:dataWidth] > max_value) begin
            max_value <= in_data_buffer[counter*dataWidth+:dataWidth];
            out_data  <= counter;
        end
    end else
        out_valid <= 1'b0;
end

endmodule