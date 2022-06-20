import numpy as np
import random
import json


# Sigmoid activation function
def sigmoid(x):
    return 1.0 / (1.0 + np.exp(-x))


# Derivate of the activation function
def sigmoid_prime(x):
    return sigmoid(x) * (1 - sigmoid(x))


# Return partial derivatives
def cost_derivative(output, desired):
    return output - desired


class Network(object):

    # Initialize the neural network
    def __init__(self, size_vector):
        self.num_of_layers = len(size_vector)
        self.size_vector = size_vector
        # Initialize weights and biases using a Gaussian distribution
        self.weights = [np.random.randn(k, j) / np.sqrt(j) for j, k in zip(self.size_vector[:-1], self.size_vector[1:])]
        self.biases = [np.random.randn(i, 1) for i in self.size_vector[1:]]

    # Return the output of the network for an input
    def feedforward(self, n):
        for b, w in zip(self.biases, self.weights):
            n = sigmoid(np.dot(w, n) + b)
        return n

    # Train the neural network using mini-batch stochastic gradient descent
    def SGD(self, training_data, num_of_epochs, mini_batch_size, eta, test_data=None):
        # training_data ->  training inputs and the corresponding desired outputs
        if test_data:
            n_test = len(test_data)
        train_data_size = len(training_data)
        for k in range(num_of_epochs):
            random.shuffle(training_data)
            mini_batches = [training_data[j:j + mini_batch_size] for j in range(0, train_data_size, mini_batch_size)]
            for mini_batch in mini_batches:
                self.update_mini_batch(mini_batch, eta)
            if test_data:
                print("Epoch {0}: {1} / {2}".format(k, self.evaluate(test_data), n_test))
            else:
                print("Epoch {0} complete".format(k))

    # Update the network's weights and biases by applying gradient descent using backpropagation to a single mini_batch
    def update_mini_batch(self, mini_batch, eta):
        # mini_batch -> list of tuples
        # eta -> learning rate
        # Declare the layer-by-layer list of biases and weights arrays
        lbl_biases  = [np.zeros(bias.shape) for bias in self.biases]
        lbl_weights = [np.zeros(weight.shape) for weight in self.weights]
        for inp, desired_out in mini_batch:
            delta_lbl_b, delta_lbl_w = self.backpropagation(inp, desired_out)
            lbl_biases = [lb + dlb for lb, dlb in zip(lbl_biases, delta_lbl_b)]
            lbl_weights = [lw + dlw for lw, dlw in zip(lbl_weights, delta_lbl_w)]

        # Update biases and weights
        self.biases  = [bias - (eta / len(mini_batch)) * new_b for bias, new_b in zip(self.biases, lbl_biases)]
        self.weights = [weight - (eta / len(mini_batch)) * new_w for weight, new_w in zip(self.weights, lbl_weights)]

    # Return a tuple representing the gradient for the cost function
    def backpropagation(self, inp, desired_out):
        # Declare the layer-by-layer list of biases and weights arrays
        lbl_biases = [np.zeros(bias.shape) for bias in self.biases]
        lbl_weights = [np.zeros(weight.shape) for weight in self.weights]

        # Feedforward
        activation = inp
        # Store all the activation results, layer-by-layer
        activations = [inp]
        # Store all the z vectors (x*w + ...) layer-by-layer
        zs = []
        for bias, weights_vector in zip(self.biases, self.weights):
            z = np.dot(weights_vector, activation) + bias
            zs.append(z)
            activation = sigmoid(z)
            activations.append(activation)

        # Backpropagation
        delta = cost_derivative(activations[-1], desired_out) * sigmoid_prime(zs[-1])
        lbl_biases[-1] = delta
        lbl_weights[-1] = np.dot(delta, activations[-2].transpose())
        for k in range(2, self.num_of_layers):
            z = zs[-k]
            sp = sigmoid_prime(z)
            delta = np.dot(self.weights[-k + 1].transpose(), delta) * sp
            lbl_biases[-k] = delta
            lbl_weights[-k] = np.dot(delta, activations[-k - 1].transpose())
        return lbl_biases, lbl_weights

    # Return the accuracy of the Neural Network -> number of inputs for which neural network outputs the correct result
    # The NN output is the index of whichever neuron in the final layer has the highest activation
    def evaluate(self, test_data):
        test_results = [(np.argmax(self.feedforward(x)), y) for (x, y) in test_data]
        return sum(int(x == y) for (x, y) in test_results)

    # Save/extract weights and biases from the trained network
    def save(self, w_file, b_file):
        weights_data = {"weights": [weight.tolist() for weight in self.weights]}
        biases_data = {"biases": [bias.tolist() for bias in self.biases]}
        f = open(w_file, "w")
        json.dump(weights_data, f)
        f.close()
        f = open(b_file, "w")
        json.dump(biases_data, f)
        f.close()
