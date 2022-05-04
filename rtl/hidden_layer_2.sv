`timescale 1ns/1ps

// Author : Cernalevschi Cristian
// Project: NN handwritten digit recognition
// File   : Hidden layer 2 module

module hidden_layer_2 #(
    parameter neurons     = 30  ,
              dataWidth   = 16  ,
              weightSize  = 30  ,
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
    .biasFile    ("b_2_0.mif"   ),
    .weightFile  ("w_2_0.mif"   ),
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
    .biasFile    ("b_2_1.mif"   ),
    .weightFile  ("w_2_1.mif"   ),
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
    .biasFile    ("b_2_2.mif"   ),
    .weightFile  ("w_2_2.mif"   ),
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
    .biasFile    ("b_2_3.mif"   ),
    .weightFile  ("w_2_3.mif"   ),
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
    .biasFile    ("b_2_4.mif"   ),
    .weightFile  ("w_2_4.mif"   ),
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
    .biasFile    ("b_2_5.mif"   ),
    .weightFile  ("w_2_5.mif"   ),
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
    .biasFile    ("b_2_6.mif"   ),
    .weightFile  ("w_2_6.mif"   ),
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
    .biasFile    ("b_2_7.mif"   ),
    .weightFile  ("w_2_7.mif"   ),
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
    .biasFile    ("b_2_8.mif"   ),
    .weightFile  ("w_2_8.mif"   ),
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
    .biasFile    ("b_2_9.mif"   ),
    .weightFile  ("w_2_9.mif"   ),
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
    .biasFile    ("b_2_10.mif"  ),
    .weightFile  ("w_2_10.mif"  ),
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
    .biasFile    ("b_2_11.mif"  ),
    .weightFile  ("w_2_11.mif"  ),
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
    .biasFile    ("b_2_12.mif"  ),
    .weightFile  ("w_2_12.mif"  ),
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
    .biasFile    ("b_2_13.mif"  ),
    .weightFile  ("w_2_13.mif"  ),
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
    .biasFile    ("b_2_14.mif"  ),
    .weightFile  ("w_2_14.mif"  ),
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
    .biasFile    ("b_2_15.mif"  ),
    .weightFile  ("w_2_15.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_16.mif"  ),
    .weightFile  ("w_2_16.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_17.mif"  ),
    .weightFile  ("w_2_17.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_18.mif"  ),
    .weightFile  ("w_2_18.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_19.mif"  ),
    .weightFile  ("w_2_19.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_20.mif"  ),
    .weightFile  ("w_2_20.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_21.mif"  ),
    .weightFile  ("w_2_21.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_22.mif"  ),
    .weightFile  ("w_2_22.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_23.mif"  ),
    .weightFile  ("w_2_23.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .weightFile  ("w_2_24.mif"  ),
    .biasFile    ("b_2_24.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_25.mif"  ),
    .weightFile  ("w_2_25.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_26.mif"  ),
    .weightFile  ("w_2_26.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_27.mif"  ),
    .weightFile  ("w_2_27.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_28.mif"  ),
    .weightFile  ("w_2_28.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
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
    .sigmoidSize (sigmoidSize   ),
    .biasFile    ("b_2_29.mif"  ),
    .weightFile  ("w_2_29.mif"  ),
    .sigmoidFile ("sigmoid.mem" )
) n_29 (
    .clk              (clk                                     ),
    .rst_n            (rst_n                                   ),
    .neuron_in_valid  (layer_in_valid                          ),
    .neuron_in        (layer_in_data                           ),
    .neuron_out_valid (layer_out_valid[29]                     ),
    .neuron_out       (layer_out_data[29*dataWidth+:dataWidth] )
);

endmodule