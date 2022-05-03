import mnist_loader
import network


def main():
    # Get data from MNIST dataset
    training_data, validation_data, test_data = mnist_loader.load_data_wrapper()

    # Create the Neural Network with 784 input neurons, 16 hidden neurons and 10 output neurons
    net = network.Network([784, 16, 10])

    # Use stochastic gradient descent to learn from the MNIST training_data
    net.SGD(training_data, 30, 100, 1.5, test_data=test_data)

    # Save data from trained network
    net.save("Weights.txt", "Biases.txt")


if __name__ == "__main__":
    main()
