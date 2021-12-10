import mnist_loader
import network

def main():
    # Get data from MNIST dataset
    training_data, validation_data, test_data = mnist_loader.load_data_wrapper()

    # Create the Neural Network with 784 input neurons, 30 hidden neurons and 10 output neurons
    net = network.Network([784, 30, 10])

    # Use stochastic gradient descent to learn from the MNIST training_data over 30 epochs, with a mini-batch size of 10 and a learning rate of 3
    net.SGD(training_data, 30, 10, 3.0, test_data=test_data)

if __name__ == "__main__":
    main()