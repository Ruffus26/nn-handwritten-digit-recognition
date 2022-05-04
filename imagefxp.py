import cv2
import sys
import numpy as np
from fxpmath import Fxp

def resize_to_28x28(img):
    img_h, img_w = img.shape
    dim_size_max = max(img.shape)

    if dim_size_max == img_w:
        im_h = (26 * img_h) // img_w
        if im_h <= 0 or img_w <= 0:
            print("Invalid Image Dimention: ", im_h, img_w, img_h)
        tmp_img = cv2.resize(img, (26,im_h),0,0,cv2.INTER_NEAREST)
    else:
        im_w = (26 * img_w) // img_h
        if im_w <= 0 or img_h <= 0:
            print("Invalid Image Dimention: ", im_w, img_w, img_h)
        tmp_img = cv2.resize(img, (im_w, 26),0,0,cv2.INTER_NEAREST)

    out_img = np.zeros((28, 28), dtype=np.ubyte)

    nb_h, nb_w = out_img.shape
    na_h, na_w = tmp_img.shape
    y_min = (nb_w) // 2 - (na_w // 2)
    y_max = y_min + na_w
    x_min = (nb_h) // 2 - (na_h // 2)
    x_max = x_min + na_h

    out_img[x_min:x_max, y_min:y_max] = tmp_img

    return out_img

# Output file for image binary data
img_bin_file_path = "./rtl/input_nn.mem"

# Read image
image_path = sys.argv[1]
img = cv2.imread(image_path, 0)

# Resize the image
# img = cv2.resize(img, (28, 28))
# img = resize_to_28x28(img)

# Invert the pixel data (black <-> white)
# img = cv2.bitwise_not(img)

# Normalize the image pixel values
img = img / 256

# Store the pixel values in an array
image_arr = np.asarray(img)

# Create the fixed point object
bfxp = Fxp(None, signed = False, n_word = 16, n_frac = 15)

# Open file for writing
img_file = open(img_bin_file_path, 'w+')

# Loop through all pixel values, convert them to FP and write them to a memory file
for line in range(0, len(image_arr)):
    for pixel in range (0, len(image_arr[line])):
        img_file.write(bfxp(image_arr[line][pixel]).bin() + '\n')

img_file.close()
