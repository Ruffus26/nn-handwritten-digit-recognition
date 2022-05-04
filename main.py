import mnist_loader
import network


def main():
    # Get data from MNIST dataset
    training_data, validation_data, test_data = mnist_loader.load_data_wrapper()

    # Create the Neural Network
    net = network.Network([784, 30, 30, 10, 10])

    # Use stochastic gradient descent to learn from the MNIST training_data
    net.SGD(training_data, 50, 100, 1.0, test_data=test_data)

    # Save data from trained network
    net.save("Weights.txt", "Biases.txt")


if __name__ == "__main__":
    main()
