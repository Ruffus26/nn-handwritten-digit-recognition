import json
from fxpmath import Fxp

dataWidth = 16
intWidth  = 4
fracWidth = 12

weightInputFile = "./trained_parameters/Weights.txt"
biasInputFile   = "./trained_parameters/Biases.txt"

outputDir = "./w_b/"


# Generate binary fixed point representation for weights and biases
def generateWeightsAndBiases(weights_input, biases_input):
    weightsFile = open(weights_input, "r")
    biasesFile  = open(biases_input, "r")
    weightData  = json.loads(weightsFile.read())
    biasData    = json.loads(biasesFile.read())
    myWeights   = weightData['weights']
    myBiases    = biasData['biases']

    # Create the fixed point object
    bfxp = Fxp(None, signed = True, n_word = dataWidth, n_frac = fracWidth)

    # Convert the weights into Fixed Point representation and write them into a memory initialization file
    for layer in range(0, len(myWeights)):
        for neuron in range(0, len(myWeights[layer])):
            file_name = 'w_' + str(layer + 1) + '_' + str(neuron) + '.mif'
            weight_file = open(outputDir + file_name, 'w+')
            for weight in range(0, len(myWeights[layer][neuron])):
                if 'e' in str(myWeights[layer][neuron][weight]):
                    weight_fxp = bfxp(0).bin()
                else:
                    weight_fxp = bfxp(myWeights[layer][neuron][weight]).bin()
                # Write to the weight file
                weight_file.write(weight_fxp + '\n')
            weight_file.close()

    # Convert the biases into Fixed Point representation and write them into a memory initialization file
    for layer in range(0, len(myBiases)):
        for neuron in range(0, len(myBiases[layer])):
            file_name = 'b_' + str(layer + 1) + '_' + str(neuron) + '.mif'
            bias_file = open(outputDir + file_name, 'w+')
            if 'e' in str(myBiases[layer][neuron][0]):
                bias_fxp = bfxp(0).bin()
            else:
                bias_fxp = bfxp(myBiases[layer][neuron][0]).bin()
            # Write to the weight file
            bias_file.write(bias_fxp)
            bias_file.close()


if __name__ == "__main__":
    generateWeightsAndBiases(weightInputFile, biasInputFile)