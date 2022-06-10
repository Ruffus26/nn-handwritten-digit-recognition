`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : Hidden layer 1 module

module hidden_layer_1 #(
    parameter neurons     = 30  ,
              dataWidth   = 16  ,
              weightSize  = 784 ,
              layerNo     = 1
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
    .biasFile    ("b_1_0.mif"   ),
    .weightFile  ("w_1_0.mif"   ) 
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
    .biasFile    ("b_1_1.mif"   ),
    .weightFile  ("w_1_1.mif"   )
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
    .biasFile    ("b_1_2.mif"   ),
    .weightFile  ("w_1_2.mif"   )
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
    .biasFile    ("b_1_3.mif"   ),
    .weightFile  ("w_1_3.mif"   )
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
    .biasFile    ("b_1_4.mif"   ),
    .weightFile  ("w_1_4.mif"   )
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
    .biasFile    ("b_1_5.mif"   ),
    .weightFile  ("w_1_5.mif"   )
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
    .biasFile    ("b_1_6.mif"   ),
    .weightFile  ("w_1_6.mif"   )
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
    .biasFile    ("b_1_7.mif"   ),
    .weightFile  ("w_1_7.mif"   )
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
    .biasFile    ("b_1_8.mif"   ),
    .weightFile  ("w_1_8.mif"   )
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
    .biasFile    ("b_1_9.mif"   ),
    .weightFile  ("w_1_9.mif"   )
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
    .biasFile    ("b_1_10.mif"  ),
    .weightFile  ("w_1_10.mif"  )
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
    .biasFile    ("b_1_11.mif"  ),
    .weightFile  ("w_1_11.mif"  )
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
    .biasFile    ("b_1_12.mif"  ),
    .weightFile  ("w_1_12.mif"  )
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
    .biasFile    ("b_1_13.mif"  ),
    .weightFile  ("w_1_13.mif"  )
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
    .biasFile    ("b_1_14.mif"  ),
    .weightFile  ("w_1_14.mif"  )
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
    .biasFile    ("b_1_15.mif"  ),
    .weightFile  ("w_1_15.mif"  )
) n_15 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[15]                     ),
    .neuron_out       (layer_out_data[15*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .biasFile    ("b_1_16.mif"  ),
    .weightFile  ("w_1_16.mif"  )
) n_16 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[16]                     ),
    .neuron_out       (layer_out_data[16*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .biasFile    ("b_1_17.mif"  ),
    .weightFile  ("w_1_17.mif"  )
) n_17 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[17]                     ),
    .neuron_out       (layer_out_data[17*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .biasFile    ("b_1_18.mif"  ),
    .weightFile  ("w_1_18.mif"  )
) n_18 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[18]                     ),
    .neuron_out       (layer_out_data[18*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .biasFile    ("b_1_19.mif"  ),
    .weightFile  ("w_1_19.mif"  )
) n_19 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[19]                     ),
    .neuron_out       (layer_out_data[19*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .biasFile    ("b_1_20.mif"  ),
    .weightFile  ("w_1_20.mif"  )
) n_20 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[20]                     ),
    .neuron_out       (layer_out_data[20*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .biasFile    ("b_1_21.mif"  ),
    .weightFile  ("w_1_21.mif"  )
) n_21 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[21]                     ),
    .neuron_out       (layer_out_data[21*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .biasFile    ("b_1_22.mif"  ),
    .weightFile  ("w_1_22.mif"  )
) n_22 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[22]                     ),
    .neuron_out       (layer_out_data[22*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .biasFile    ("b_1_23.mif"  ),
    .weightFile  ("w_1_23.mif"  )
) n_23 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[23]                     ),
    .neuron_out       (layer_out_data[23*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .weightFile  ("w_1_24.mif"  ),
    .biasFile    ("b_1_24.mif"  )
) n_24 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[24]                     ),
    .neuron_out       (layer_out_data[24*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .biasFile    ("b_1_25.mif"  ),
    .weightFile  ("w_1_25.mif"  )
) n_25 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[25]                     ),
    .neuron_out       (layer_out_data[25*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .biasFile    ("b_1_26.mif"  ),
    .weightFile  ("w_1_26.mif"  )
) n_26 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[26]                     ),
    .neuron_out       (layer_out_data[26*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .biasFile    ("b_1_27.mif"  ),
    .weightFile  ("w_1_27.mif"  )
) n_27 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[27]                     ),
    .neuron_out       (layer_out_data[27*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .biasFile    ("b_1_28.mif"  ),
    .weightFile  ("w_1_28.mif"  )
) n_28 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[28]                     ),
    .neuron_out       (layer_out_data[28*dataWidth+:dataWidth] )
);

neuron #(
    .weightSize  (weightSize    ),
    .dataWidth   (dataWidth     ),
    .biasFile    ("b_1_29.mif"  ),
    .weightFile  ("w_1_29.mif"  )
) n_29 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[29]                     ),
    .neuron_out       (layer_out_data[29*dataWidth+:dataWidth] )
);

endmodule