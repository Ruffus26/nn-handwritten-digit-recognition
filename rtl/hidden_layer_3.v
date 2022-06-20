`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : Hidden layer 3 module

module hidden_layer_3 #(
    parameter neurons     = 10  ,
              dataWidth   = 16  ,
              weightSize  = 30  
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
    .biasFile    ("b_3_0.mif"   ),
    .weightFile  ("w_3_0.mif"   )
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
    .biasFile    ("b_3_1.mif"   ),
    .weightFile  ("w_3_1.mif"   )
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
    .biasFile    ("b_3_2.mif"   ),
    .weightFile  ("w_3_2.mif"   )
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
    .biasFile    ("b_3_3.mif"   ),
    .weightFile  ("w_3_3.mif"   )
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
    .biasFile    ("b_3_4.mif"   ),
    .weightFile  ("w_3_4.mif"   )
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
    .biasFile    ("b_3_5.mif"   ),
    .weightFile  ("w_3_5.mif"   )
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
    .biasFile    ("b_3_6.mif"   ),
    .weightFile  ("w_3_6.mif"   )
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
    .biasFile    ("b_3_7.mif"   ),
    .weightFile  ("w_3_7.mif"   )
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
    .biasFile    ("b_3_8.mif"   ),
    .weightFile  ("w_3_8.mif"   )
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
    .biasFile    ("b_3_9.mif"   ),
    .weightFile  ("w_3_9.mif"   )
) n_9 (
    .clk              (clk                                    ),
    .rst_n            (rst_n                                  ),
    .neuron_in_valid  (layer_in_valid                         ),
    .neuron_in        (layer_in_data                          ),
    .neuron_out_valid (layer_out_valid[9]                     ),
    .neuron_out       (layer_out_data[9*dataWidth+:dataWidth] )
);

endmodule