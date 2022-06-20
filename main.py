import mnist_loader
import network


def main():
    # Get data from MNIST dataset
    train_data, val_data, test_data = mnist_loader.load_data_wrapper()

    # Create the Neural Network
    net = network.Network([784, 30, 30, 10, 10])

    # Start the learning process for the neural network
    net.SGD(train_data, 30, 100, 1.0, test_data=test_data)

    # Save data from trained network
    net.save("Weights.txt", "Biases.txt")


if __name__ == "__main__":
    main()
