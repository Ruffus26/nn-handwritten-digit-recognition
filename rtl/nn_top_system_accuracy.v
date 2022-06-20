`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : The top neural network module (non-synthesizable) used only in simulation to calculate system accuracy 

module nn_top_system_accuracy;

// Global wires
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
assign clk     = clock   ;
assign rst_n   = reset_n ;

// Parameters
localparam nn_data_in_size = 784              ;
localparam dataWidth       = 16               ;
localparam outData         = 10               ;
localparam outWidth        = $clog2(outData)  ;
localparam testSamples     = 1000             ;

// Interconnection wires
wire                   mem_valid ;
wire [dataWidth - 1:0] mem_data  ;
wire                   last      ;

// Internal registers
reg                   in_valid ;
reg [dataWidth - 1:0] in_data  ;
reg [dataWidth - 1:0] in_mem [nn_data_in_size : 0];
reg [dataWidth - 1:0] expected        ;
reg [7:0]             testFile [17:0] ;

// Test wire assignments
assign mem_valid = in_valid ;
assign mem_data  = in_data  ;

// Convert digit to ASCII
function [7:0] to_ascii;
input integer a;

    return a + 48;
endfunction

// Initialize the test file with a default name
function void init_test_file();
    begin
        testFile[17] = "t";
        testFile[16] = "e";
        testFile[15] = "s";
        testFile[14] = "t";
        testFile[13] = "_";
        testFile[12] = "d";
        testFile[11] = "a";
        testFile[10] = "t";
        testFile[9]  = "a";
        testFile[8]  = "_";
        testFile[7]  = "0";
        testFile[6]  = "0";
        testFile[5]  = "0";
        testFile[4]  = "0";
        testFile[3]  = ".";
        testFile[2]  = "m";
        testFile[1]  = "i";
        testFile[0]  = "f";
    end
endfunction

// Send test data
task send_test_data();
integer index;

    begin
        $readmemb(testFile, in_mem);
        for (index = 0; index < nn_data_in_size; index = index + 1) begin
            in_valid <= 1'b1;
            in_data  <= in_mem[index];
            @(posedge clk);
        end
        in_valid <= 1'b0;
        expected <= in_mem[nn_data_in_size];
        @(posedge clk);
    end
endtask

// Count the matches between the expected data and the neural network result
integer match_count = 0;

// Init a test regression
task init_test_regression();
integer testCount;
integer tmpCount;
integer offset;

    begin
        init_test_file();
        for (testCount = 0; testCount < testSamples; testCount = testCount + 1) begin
            tmpCount = testCount;
            offset   = 0;
            while (tmpCount != 0) begin
                testFile[offset + 4] = to_ascii(tmpCount % 10);
                tmpCount             = tmpCount / 10;
                offset               = offset + 1;
            end

            // Send one sample of test data
            send_test_data();

            // Wait for neural network to generate a result
            @(posedge net_valid);

            // Go forward with 1 clock cycle
            repeat(1) @(posedge clk);

            // Get the neural network result and compare it to the expected value
            if (net_data == expected)
                match_count = match_count + 1;
        end

        // Display the accuracy
        $display("Accuracy: %f %% (%d / %d)", (match_count * 100 / testCount), match_count, testCount);
    end
endtask

// Top module entry point
initial begin
   // Wait for reset to end and synchronize to the clock posedge
   @(posedge clk);
   @(posedge rst_n);
   @(posedge clk);

   // Init a test regression
   init_test_regression();
end

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