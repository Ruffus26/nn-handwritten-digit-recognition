import mnist_loader
import numpy as np
from fxpmath import Fxp

outputPath = "./test_data/"


def generate_test_data_files (nr_of_tests, dataWidth, fracWidth):
    # Create the fixed point objects
    bfxp    = Fxp(None, signed = False, n_word = dataWidth, n_frac = fracWidth)
    exp_fxp = Fxp(None, signed = False, n_word = dataWidth, n_frac = 0)

    # Load test data from MNIST
    tr_d, va_d, te_d = mnist_loader.load_data()
    test_inputs = [np.reshape(x, (1, 784)) for x in te_d[0]]
    test_input_len = len(test_inputs[0][0])

    for i in range(nr_of_tests):
        if i < 10:
            ext = "000" + str(i)
        elif i < 100:
            ext = "00" + str(i)
        elif i < 1000:
            ext = "0" + str(i)
        else:
            ext = str(i)
        
        # Create the file and open it for writing
        fileName = 'test_data_' + ext + '.mif'
        f = open(outputPath + fileName, 'w')

        for j in range(0, test_input_len):
            in_fxp = bfxp(test_inputs[i][0][j]).bin()
            f.write(in_fxp + '\n')

        f.write(exp_fxp(te_d[1][i]).bin())
        f.close()


if __name__ == "__main__":
    generate_test_data_files(1000, 16, 15)