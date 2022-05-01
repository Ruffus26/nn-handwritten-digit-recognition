`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : Hidden layer module

module hidden_layer #(
    parameter neurons     = 16  ,
              dataWidth   = 16  ,
              weightSize  = 784 ,
              sigmoidSize = 5
) (
    input                            clk             ,
    input                            rst_n           ,
    input                            layer_in_valid  ,
    input  [dataWidth - 1:0]         layer_in_data   ,
    output [neurons - 1:0]           layer_out_valid ,
    output [neurons*dataWidth - 1:0] layer_out_data  
);

// Layer's neurons instantiation
neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_0.mem"   ),
    .weightFile  ("w_1_0.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_0 (
    .clk              (clk                                    ),
    .rst_n            (rst_n                                  ),
    .neuron_in_valid  (layer_in_valid                         ),
    .neuron_in        (layer_in_data                          ),
    .neuron_out_valid (layer_out_valid[0]                     ),
    .neuron_out       (layer_out_data[0*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_1.mem"   ),
    .weightFile  ("w_1_1.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_1 (
    .clk              (clk                                    ),
    .rst_n            (rst_n                                  ),
    .neuron_in_valid  (layer_in_valid                         ),
    .neuron_in        (layer_in_data                          ),
    .neuron_out_valid (layer_out_valid[1]                     ),
    .neuron_out       (layer_out_data[1*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_2.mem"   ),
    .weightFile  ("w_1_2.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_2 (
    .clk              (clk                                    ),
    .rst_n            (rst_n                                  ),
    .neuron_in_valid  (layer_in_valid                         ),
    .neuron_in        (layer_in_data                          ),
    .neuron_out_valid (layer_out_valid[2]                     ),
    .neuron_out       (layer_out_data[2*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_3.mem"   ),
    .weightFile  ("w_1_3.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_3 (
    .clk              (clk                                    ),
    .rst_n            (rst_n                                  ),
    .neuron_in_valid  (layer_in_valid                         ),
    .neuron_in        (layer_in_data                          ),
    .neuron_out_valid (layer_out_valid[3]                     ),
    .neuron_out       (layer_out_data[3*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_4.mem"   ),
    .weightFile  ("w_1_4.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_4 (
    .clk              (clk                                    ),
    .rst_n            (rst_n                                  ),
    .neuron_in_valid  (layer_in_valid                         ),
    .neuron_in        (layer_in_data                          ),
    .neuron_out_valid (layer_out_valid[4]                     ),
    .neuron_out       (layer_out_data[4*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_5.mem"   ),
    .weightFile  ("w_1_5.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_5 (
    .clk              (clk                                    ),
    .rst_n            (rst_n                                  ),
    .neuron_in_valid  (layer_in_valid                         ),
    .neuron_in        (layer_in_data                          ),
    .neuron_out_valid (layer_out_valid[5]                     ),
    .neuron_out       (layer_out_data[5*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_6.mem"   ),
    .weightFile  ("w_1_6.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_6 (
    .clk              (clk                                    ),
    .rst_n            (rst_n                                  ),
    .neuron_in_valid  (layer_in_valid                         ),
    .neuron_in        (layer_in_data                          ),
    .neuron_out_valid (layer_out_valid[6]                     ),
    .neuron_out       (layer_out_data[6*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_7.mem"   ),
    .weightFile  ("w_1_7.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_7 (
    .clk              (clk                                    ),
    .rst_n            (rst_n                                  ),
    .neuron_in_valid  (layer_in_valid                         ),
    .neuron_in        (layer_in_data                          ),
    .neuron_out_valid (layer_out_valid[7]                     ),
    .neuron_out       (layer_out_data[7*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_8.mem"   ),
    .weightFile  ("w_1_8.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_8 (
    .clk              (clk                                    ),
    .rst_n            (rst_n                                  ),
    .neuron_in_valid  (layer_in_valid                         ),
    .neuron_in        (layer_in_data                          ),
    .neuron_out_valid (layer_out_valid[8]                     ),
    .neuron_out       (layer_out_data[8*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_9.mem"   ),
    .weightFile  ("w_1_9.mem"   ),
    .sigmoidFile ("sigmoid.mem" )
) n_9 (
    .clk              (clk                                    ),
    .rst_n            (rst_n                                  ),
    .neuron_in_valid  (layer_in_valid                         ),
    .neuron_in        (layer_in_data                          ),
    .neuron_out_valid (layer_out_valid[9]                     ),
    .neuron_out       (layer_out_data[9*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_10.mem"  ),
    .weightFile  ("w_1_10.mem"  ),
    .sigmoidFile ("sigmoid.mem" )
) n_10 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[10]                     ),
    .neuron_out       (layer_out_data[10*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_11.mem"  ),
    .weightFile  ("w_1_11.mem"  ),
    .sigmoidFile ("sigmoid.mem" )
) n_11 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[11]                     ),
    .neuron_out       (layer_out_data[11*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_12.mem"  ),
    .weightFile  ("w_1_12.mem"  ),
    .sigmoidFile ("sigmoid.mem" )
) n_12 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[12]                     ),
    .neuron_out       (layer_out_data[12*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_13.mem"  ),
    .weightFile  ("w_1_13.mem"  ),
    .sigmoidFile ("sigmoid.mem" )
) n_13 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[13]                     ),
    .neuron_out       (layer_out_data[13*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_14.mem"  ),
    .weightFile  ("w_1_14.mem"  ),
    .sigmoidFile ("sigmoid.mem" )
) n_14 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[14]                     ),
    .neuron_out       (layer_out_data[14*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_1_15.mem"  ),
    .weightFile  ("w_1_15.mem"  ),
    .sigmoidFile ("sigmoid.mem" )
) n_15 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[15]                     ),
    .neuron_out       (layer_out_data[15*dataWidth+:dataWidth] )
);

endmodule