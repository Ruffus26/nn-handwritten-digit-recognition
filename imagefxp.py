import cv2
import sys
import numpy as np
from fxpmath import Fxp

# Output file for image binary data
img_bin_file_path = "./rtl/input_nn.mem"

# Read image
image_path = sys.argv[1]
img = cv2.imread(image_path, 0)

# Resize the image
# img = cv2.resize(img, (28, 28))

# Invert the pixel data (black <-> white)
img = cv2.bitwise_not(img)

# Normalize the image pixel values
n_img = img / 255

# Store the pixel values in an array
image_arr = np.asarray(n_img)

# Create the fixed point object
bfxp = Fxp(None, signed = False, n_word = 16, n_frac = 15)

# Open file for writing
img_file = open(img_bin_file_path, 'w+')

# Loop through all pixel values, convert them to FP and write them to a memory file
for line in range(0, len(image_arr)):
    for pixel in range (0, len(image_arr[line])):
        img_file.write(bfxp(image_arr[line][pixel]).bin() + '\n')

img_file.close()
