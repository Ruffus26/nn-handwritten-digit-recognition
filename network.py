import numpy as np


# Return the output for sigmoid neuron layer
def sigmoid(z):
    return 1.0/(1.0 + np.exp(-z))


def sigmoid_prime(z):
    return sigmoid(z) * (1 - sigmoid(z))


# Define the quadratic cost function
class QuadraticCost(object):
    # Return the cost associated with an output a and desired output y
    @staticmethod
    def fn(a, y):
        return 0.5*np.linalg.norm(a - y)**2

    # Return the error delta from the output layer
    @staticmethod
    def delta(z, a, y):
        return (a - y) * sigmoid_prime(z)


# Define the cross-entropy cost function
class CrossEntropyCost(object):
    # Return the cost associated with an output a and desired output y
    @staticmethod
    def fn(a, y):
        return np.sum(np.nan_to_num(-y*np.log(a) - (1 - y)*np.log(1-a)))

    # Return the error delta from the output layer
    @staticmethod
    def delta(z, a, y):
        return a - y


class Network(object):

    # Constructor to initialize and create the neural network
    def __init__(self, sizes, cost=CrossEntropyCost):
        # Sizes is a list that contains the number of neurons in the layer indicated by the index of list
        self.num_layers = len(sizes)
        self.sizes = sizes
        # Initialize each weight and the biases using a Gaussian distribution
        self.weights = [np.random.randn(y, x) / np.sqrt(x) for x, y in zip(self.sizes[:-1], self.sizes[1:])]
        self.biases = [np.random.randn(y, 1) for y in self.sizes[1:]]
        self.cost = cost

    # Return the output of the network for an input a
    def feedforward(self, a):
        for b, w in zip(self.biases, self.weights):
            a = sigmoid(np.dot(w, a) + b)
        return a


