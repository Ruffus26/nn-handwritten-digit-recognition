`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : Output layer module

module output_layer #(
    parameter neurons     = 10 ,
              dataWidth   = 16 ,
              weightSize  = 16 ,
              sigmoidSize = 5
) (
    input                            clk                 ,
    input                            rst_n               ,
    input                            out_layer_in_valid  ,
    input  [dataWidth - 1:0]         out_layer_in_data   ,
    output wire                      out_layer_out_valid ,
    output [neurons*dataWidth - 1:0] out_layer_out_data  
);

reg [neurons - 1:0]          out_layer_out_valid_reg;
assign out_layer_out_valid = out_layer_out_valid_reg[0];

// Layer's neurons instantiation
neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_0.mem"   ),
    .weightFile  ("w_2_0.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_0 (
    .clk              (clk                                        ),
    .rst_n            (rst_n                                      ),
    .neuron_in_valid  (out_layer_in_valid                         ),
    .neuron_in        (out_layer_in_data                          ),
    .neuron_out_valid (out_layer_out_valid_reg[0]                 ),
    .neuron_out       (out_layer_out_data[0*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_1.mem"   ),
    .weightFile  ("w_2_1.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_1 (
    .clk              (clk                                        ),
    .rst_n            (rst_n                                      ),
    .neuron_in_valid  (out_layer_in_valid                         ),
    .neuron_in        (out_layer_in_data                          ),
    .neuron_out_valid (out_layer_out_valid_reg[1]                 ),
    .neuron_out       (out_layer_out_data[1*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_2.mem"   ),
    .weightFile  ("w_2_2.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_2 (
    .clk              (clk                                        ),
    .rst_n            (rst_n                                      ),
    .neuron_in_valid  (out_layer_in_valid                         ),
    .neuron_in        (out_layer_in_data                          ),
    .neuron_out_valid (out_layer_out_valid_reg[2]                 ),
    .neuron_out       (out_layer_out_data[2*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_3.mem"   ),
    .weightFile  ("w_2_3.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_3 (
    .clk              (clk                                        ),
    .rst_n            (rst_n                                      ),
    .neuron_in_valid  (out_layer_in_valid                         ),
    .neuron_in        (out_layer_in_data                          ),
    .neuron_out_valid (out_layer_out_valid_reg[3]                 ),
    .neuron_out       (out_layer_out_data[3*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_4.mem"   ),
    .weightFile  ("w_2_4.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_4 (
    .clk              (clk                                        ),
    .rst_n            (rst_n                                      ),
    .neuron_in_valid  (out_layer_in_valid                         ),
    .neuron_in        (out_layer_in_data                          ),
    .neuron_out_valid (out_layer_out_valid_reg[4]                 ),
    .neuron_out       (out_layer_out_data[4*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_5.mem"   ),
    .weightFile  ("w_2_5.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_5 (
    .clk              (clk                                        ),
    .rst_n            (rst_n                                      ),
    .neuron_in_valid  (out_layer_in_valid                         ),
    .neuron_in        (out_layer_in_data                          ),
    .neuron_out_valid (out_layer_out_valid_reg[5]                 ),
    .neuron_out       (out_layer_out_data[5*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_6.mem"   ),
    .weightFile  ("w_2_6.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_6 (
    .clk              (clk                                        ),
    .rst_n            (rst_n                                      ),
    .neuron_in_valid  (out_layer_in_valid                         ),
    .neuron_in        (out_layer_in_data                          ),
    .neuron_out_valid (out_layer_out_valid_reg[6]                 ),
    .neuron_out       (out_layer_out_data[6*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_7.mem"   ),
    .weightFile  ("w_2_7.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_7 (
    .clk              (clk                                        ),
    .rst_n            (rst_n                                      ),
    .neuron_in_valid  (out_layer_in_valid                         ),
    .neuron_in        (out_layer_in_data                          ),
    .neuron_out_valid (out_layer_out_valid_reg[7]                 ),
    .neuron_out       (out_layer_out_data[7*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_8.mem"   ),
    .weightFile  ("w_2_8.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_8 (
    .clk              (clk                                        ),
    .rst_n            (rst_n                                      ),
    .neuron_in_valid  (out_layer_in_valid                         ),
    .neuron_in        (out_layer_in_data                          ),
    .neuron_out_valid (out_layer_out_valid_reg[8]                 ),
    .neuron_out       (out_layer_out_data[8*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_9.mem"   ),
    .weightFile  ("w_2_9.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_9 (
    .clk              (clk                                        ),
    .rst_n            (rst_n                                      ),
    .neuron_in_valid  (out_layer_in_valid                         ),
    .neuron_in        (out_layer_in_data                          ),
    .neuron_out_valid (out_layer_out_valid_reg[9]                 ),
    .neuron_out       (out_layer_out_data[9*dataWidth+:dataWidth] )
);

endmodule