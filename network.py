import numpy as np
import random


# Return the output for sigmoid neuron layer
def sigmoid(z):
    return 1.0 / (1.0 + np.exp(-z))


# Derivative of sigmoid function
def sigmoid_prime(z):
    return sigmoid(z) * (1 - sigmoid(z))


class Network(object):

    # Constructor to initialize and create the neural network
    def __init__(self, sizes):
        # Sizes is a list that contains the number of neurons in the layer indicated by the index of list
        self.num_layers = len(sizes)
        self.sizes = sizes
        # Initialize each weight and the biases using a Gaussian distribution
        self.weights = [np.random.randn(y, x) / np.sqrt(x) for x, y in zip(self.sizes[:-1], self.sizes[1:])]
        self.biases = [np.random.randn(y, 1) for y in self.sizes[1:]]

    # Return the output of the network for an input a
    def feedforward(self, a):
        for b, w in zip(self.biases, self.weights):
            a = sigmoid(np.dot(w, a) + b)
        return a

    # Train the neural network using mini-batch stochastic gradient descent
    def SGD(self, training_data, epochs, mini_batch_size, eta, test_data=None):
        # training_data -> is a list of tuples representing the training inputs and the corresponding desired outputs
        if test_data: n_test = len(test_data)
        n = len(training_data)
        for j in range(epochs):
            random.shuffle(training_data)
            mini_batches = [training_data[k:k + mini_batch_size] for k in range(0, n, mini_batch_size)]
            for mini_batch in mini_batches:
                self.update_mini_batch(mini_batch, eta)
            if test_data:
                print ("Epoch {0}: {1} / {2}".format(j, self.evaluate(test_data), n_test))
            else:
                print ("Epoch {0} complete".format(j))

    # Update the network's weights and biases by applying gradient descent using backpropagation to a single mini_batch
    def update_mini_batch(self, mini_batch, eta):
        # mini_batch -> list of tuples
        # eta -> learning rate
        # Declare the layer-by-layer list of biases and weights arrays
        lbl_b = [np.zeros(b.shape) for b in self.biases]
        lbl_w = [np.zeros(w.shape) for w in self.weights]
        for inp, desired_out in mini_batch:
            delta_lbl_b, delta_lbl_w = self.backpropagation(inp, desired_out)
            lbl_b = [lb + dlb for lb, dlb in zip(lbl_b, delta_lbl_b)]
            lbl_w = [lw + dlw for lw, dlw in zip(lbl_w, delta_lbl_w)]

        # Update biases and weights
        self.biases = [b - (eta / len(mini_batch)) * new_b for b, new_b in zip(self.biases, lbl_b)]
        self.weights = [w - (eta / len(mini_batch)) * new_w for w, new_w in zip(self.weights, lbl_w)]

    # Return a tuple representing the gradient for the cost function
    def backpropagation(self, inp, desired_out):
        # Declare the layer-by-layer list of biases and weights arrays
        lbl_b = [np.zeros(b.shape) for b in self.biases]
        lbl_w = [np.zeros(w.shape) for w in self.weights]
        # feedforward
        activation = inp
        # List to store all the activations, layer-by-layer
        activations = [inp]
        # List to store all the z vectors (x*w + ...) layer-by-layer
        zs = []
        for b, w in zip(self.biases, self.weights):
            z = np.dot(w, activation) + b
            zs.append(z)
            activation = sigmoid(z)
            activations.append(activation)
        # backpropagation
        delta = self.cost_derivative(activations[-1], desired_out) * sigmoid_prime(zs[-1])
        lbl_b[-1] = delta
        lbl_w[-1] = np.dot(delta, activations[-2].transpose())
        for l in range(2, self.num_layers):
            z = zs[-l]
            sp = sigmoid_prime(z)
            delta = np.dot(self.weights[-l + 1].transpose(), delta) * sp
            lbl_b[-l] = delta
            lbl_w[-l] = np.dot(delta, activations[-l - 1].transpose())
        return lbl_b, lbl_w

    # Return the number of test inputs for which the NN outputs the correct result
    # The NN output is the index of whichever neuron in the final layer has the highest activation
    def evaluate(self, test_data):
        test_results = [(np.argmax(self.feedforward(x)), y) for (x, y) in test_data]
        return sum(int(x == y) for (x, y) in test_results)

    # Return the vector of partial derivatives
    def cost_derivative(self, output_activations, y):
        return output_activations - y
