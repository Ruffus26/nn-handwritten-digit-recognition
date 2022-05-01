import json

dataWidth       = 16
weightIntWidth  = 4
weightFracWidth = 12
biasIntWidth    = 4
biasFracWidth   = 12

weightInputFile = "Weights.txt"
biasInputFile   = "Biases.txt"

outputDir = "./w_b/"


# Convert into two's complement format
def D2Comp(n, data_width, frac_bits):
    if n >= 0:
        n = n * (2 ** frac_bits)
        res = int(n)
    else:
        n = -n
        n = n * (2 ** frac_bits)
        n = int(n)
        if n == 0:
            res = 0
        else:
            res = 2 ** data_width - n

    return res


# Generate 16-bit values of wights and biases
def generateWeightsAndBiases(weights_input, biases_input):
    weightsFile = open(weights_input, "r")
    biasesFile  = open(biases_input, "r")
    weightData  = json.loads(weightsFile.read())
    biasData    = json.loads(biasesFile.read())
    myWeights   = weightData['weights']
    myBiases    = biasData['biases']

    # Convert the weights into Fixed Point 16 binary and write them into a memory initialization file
    for layer in range(0, len(myWeights)):
        for neuron in range(0, len(myWeights[layer])):
            file_name = 'w_' + str(layer+1) + '_' + str(neuron) + '.mem'
            weight_file = open(outputDir + file_name, 'w+')
            for weight in range(0, len(myWeights[layer][neuron])):
                if 'e' in str(myWeights[layer][neuron][weight]):
                    bin_w = '0'
                else:
                    if myWeights[layer][neuron][weight] > 2**(weightIntWidth - 1):
                        myWeights[layer][neuron][weight] = 2**(weightIntWidth - 1) - 2**(-weightFracWidth)
                    elif myWeights[layer][neuron][weight] < -2**(weightIntWidth - 1):
                        myWeights[layer][neuron][weight] = -2**(weightIntWidth - 1)

                    weight_2comp = D2Comp(myWeights[layer][neuron][weight], dataWidth, weightFracWidth)
                    bin_w = bin(weight_2comp)[2:]

                weight_file.write(bin_w + '\n')
            weight_file.close()

    # Convert the biases into Fixed Point 16 binary and write them into a memory initialization file
    for layer in range(0, len(myBiases)):
        for neuron in range(0, len(myBiases[layer])):
            file_name = 'b_' + str(layer + 1) + '_' + str(neuron) + '.mem'
            bias_file = open(outputDir + file_name, 'w+')
            if 'e' in str(myBiases[layer][neuron][0]):
                bin_b = '0'
            else:
                if myBiases[layer][neuron][0] > 2**(biasIntWidth - 1):
                    myBiases[layer][neuron][0] = 2**(biasIntWidth - 1) - 2**(-biasIntWidth)
                elif myBiases[layer][neuron][0] < -2**(biasIntWidth - 1):
                    myBiases[layer][neuron][0] = -2**(biasIntWidth - 1)
                bias_2comp = D2Comp(myBiases[layer][neuron][0], dataWidth, biasFracWidth)
                bin_b = bin(bias_2comp)[2:]
            bias_file.write(bin_b)
            bias_file.close()


if __name__ == "__main__":
    generateWeightsAndBiases(weightInputFile, biasInputFile)