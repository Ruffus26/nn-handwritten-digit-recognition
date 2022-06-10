# Load the MNIST image data

import pickle
import gzip
import numpy as np


def load_data():
    # Return the MNIST data as a tuple containing the training data, the validation data and the test data

    # The "training data" is returned as a tuple with two entries. The first entry contains the actual training
    # images, a numpy ndarray with 50000 entries. Each entry is, in turn, a numpy ndarray with 784 values,
    # representing the 28*28 = 784 pixels in a single MNIST image. The second entry is a ndarray containing 50000
    # entries, the digit values (0..9) for the corresponding images contained in the first entry

    # The validation data and test data contains only 10000 images

    f = gzip.open("./data/mnist.pkl.gz", "rb")
    u = pickle._Unpickler(f)
    u.encoding = 'latin1'
    training_data, validation_data, test_data = u.load()
    f.close()

    return training_data, validation_data, test_data


def load_data_wrapper():
    # Return a more convenient tuple for use in NN

    # The "training_data" should consist of 2 tuples
    # One is a 784-dimensional ndarray containing the input image
    # The second is a 10-dimensional ndarray representing the unit vector corresponding to the correct digit

    # Validation and test data should also consist of 2 tuples
    # One is a 784-dimensional ndarray containing the input image
    # The second is the corresponding classification, the digit values corresponding to first tuple

    tr_data, va_data, te_data = load_data()
    training_inputs = [np.reshape(x, (784, 1)) for x in tr_data[0]]
    training_results = [vectorized_result(y) for y in tr_data[1]]
    training_data = list(zip(training_inputs, training_results))
    validation_inputs = [np.reshape(x, (784, 1)) for x in va_data[0]]
    validation_data = list(zip(validation_inputs, va_data[1]))
    test_inputs = [np.reshape(x, (784, 1)) for x in te_data[0]]
    test_data = list(zip(test_inputs, te_data[1]))

    return training_data, validation_data, test_data


def vectorized_result(j):
    # Return a 10-dimensional unit vector with a 1 in the jth position and 0 elsewhere
    v = np.zeros((10, 1))
    v[j] = 1.0
    return v
