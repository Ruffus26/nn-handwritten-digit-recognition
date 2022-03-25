`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : Sigmoid Neuron RTL module

module neuron #(
    parameter layerNumber  = 0   ,
              neuronNumber = 0   ,
              weightSize   = 784 ,
              dataWidth    = 16  ,
              sigmoidSize  = 5   ,
              biasFile     = ""  ,
              weightFile   = ""  ,
              sigmoidFile  = ""
) (
    input clk,
    input rst,
    input                    neuron_in_valid  ,
    input  [dataWidth - 1:0] neuron_in        ,
    output reg               neuron_out_valid ,
    output [dataWidth - 1:0] neuron_out       ,
);
    
parameter addrWidth = $clog2(weightSize);

//// INTERNAL REGISTERS AND WIRES ////

// Store the bias value of the neuron
reg [dataWidth - 1:0] biasReg;
// Provide the double dataWidth value of bias
reg [2*dataWidth - 1:0] bias_value;
// Read address value from weight memory
reg [addrWidth:0] read_addr;
// Enable read from weight memory
wire ren;
// Delay for the neuron input
reg [dataWidth - 1:0] neuron_in_d;
// Valid on receiving the weight from memory
reg weight_valid;
// Valid for performing multiplication
reg mult_valid;
// Weight Memory output
wire wout;
// Store the result of multiplication between the weight and the neuron input
reg [2*dataWidth - 1:0] mult_res;
// Valid for driving data to sigmoid module
reg sigmoid_valid;
// Addition between previous neuron sum and (value * weight) multiplication
wire [2*dataWidth:0] add;
// Addition between bias and the final sum
wire [2*dataWidth:0] biasAdd;
// Store and accumulate the current sum for the neuron
reg[2*dataWidth - 1:0] sum;
// Valid for performing addition between products
reg sum_valid;

assign ren     = neuron_in_valid;
assign add     = mult_res + sum;
assign biasAdd = bias + sum;

// Initialize the bias memory
initial begin
    $readmemb(biasFile, biasReg)
end

// bias_value register deifiniton
always @(posedge clk) 
begin
    bias_value <= {{dataWidth{1'b0}}, biasReg[dataWidth - 1:0]};
end

// neuron_in_d register definition
always @(posedge clk)
begin
    if (rst)
        neuron_in_d <= 0;
    else
        neuron_in_d <= neuron_in;
end

// read_addr register definition
always @(posedge clk)
begin
    if (rst)
        read_addr <= 0;
    else if (neuron_out_valid)
        read_addr <= 0;
    else if (neuron_in_valid)
        read_addr <= read_addr + 1;
end

// weight_valid register definition
always @(posedge clk)
begin
    weight_valid <= neuron_in_valid;
end

// mult_valid register definition
always @(posedge clk)
begin
    mult_valid <= weight_valid;
end

// mult_res register definition
always @(posedge clk)
begin
    if (rst)
        mult_res <= 'b0;
    else
        if (weight_valid)
            mult_res <= $signed(neuron_in_d) * $signed(wout);
end

// sum_valid register definition
always @(posedge clk)
begin
    sum_valid <= mult_valid;
end

// A pulse indicating the last calculated sum
wire sum_valid_last;
assign sum_valid_last = sum_valid & !mult_valid; 

// sum register definition
always @(posedge clk)
begin
    if (rst)
        sum <= 'b0;
    else if (neuron_out_valid)
        sum <= 'b0;
    else if ((read_addr == weightSize) & sum_valid_last)
    begin
        //// the sum of products finished -> add Bias ////
        // if bias and previous sum are positive, and the sign bit of their addition is 1
        // then saturate the current sum with 1s and a 0 for the sign bit
        if (!bias[2*dataWidth - 1] & !sum[dataWidth - 1] & biasAdd[2*dataWidth - 1])
        begin
            sum[2*dataWidth - 1] <= 1'b0;
            sum[2*dataWidth - 2:0] <= {2*dataWidth-1{1'b1}};
        end
        // if bias and previous sum are negative, and the sign bit of their addition is 0
        // then saturate the current sum with 0s and a 1 for the sign bit
        else if (bias[2*dataWidth - 1] & sum[dataWidth - 1] & biasAdd[2*dataWidth - 1])
        begin
            sum[2*dataWidth - 1] <= 1'b1;
            sum[2*dataWidth - 2:0] <= {2*dataWidth-1{1'b0}};
        end
        else
            sum <= biasAdd;
    end
    else if (mult_valid)
    begin
        // if the result of multiplication is a positive number, 
        // so as the previous sum and if the sign bit of current add is 1, then saturate sum with 1s and a 0 for the sign bit
        if (!mult_res[2*dataWidth - 1] & !sum[2*dataWidth - 1] & add[2*dataWidth - 1])
        begin
            sum[2*dataWidth - 1] <= 1'b0;
            sum[2*dataWidth - 2:0] <= {2*dataWidth-1{1'b1}};
        end
        // if the result of multiplication is a negative number, 
        // so as the previous sum and if the sign bit of current add is 0, then saturate sum with 0s and a 1 for the sign bit
        else if (mult_res[2*dataWidth - 1] & sum[2*dataWidth - 1] & !add[2*dataWidth - 1])
        begin
            sum[2*dataWidth - 1] <= 1'b1;
            sum[2*dataWidth - 2:0] <= {2*dataWidth-1{1'b0}};
        end
        else
            sum <= add;
    end
end

// sigmoid_valid register definition
always @(posedge clk)
begin
    if (rst)
        sigmoid_valid <= 0;
    else 
        sigmoid_valid <= ((read_addr == weightSize) & sum_valid_last) ? 1'b1 : 1'b0;
end

// neuron_out_valid register definition
always @(posedge clk) 
begin
    if (rst)
        neuron_out_valid <= 0;
    else
        neuron_out_valid <= sigmoid_valid;
end

// Instantiate the Memory for Neuron Weights
weight_mem #(.memSize(weightSize), .addrWidth(addrWidth), .dataWidth(dataWidth), .weightFile(weightFile))
i_weight_mem (
    .clk   (clk       ),
    .ren   (ren       ),
    .raddr (read_addr ),
    .wout  (wout      )
);

// Instantiate the Memory for Sigmoid Mapping
sigmoid_rom #(.inWidth(sigmoidSize), .dataWidth(dataWidth), .sigmoidFile(sigmoidFile))
i_sigmoid_rom (
    .clk     (clk),
    .in_val  (sigmoid_valid),
    .sig_in  (sum[2*dataWidth - 1 - :sigmoidSize]),
    .sig_out (neuron_out)
);

endmodule