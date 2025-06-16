import numpy as np
from PIL import Image

# Run the image through grayscale filter and optionally save it to a separate file.
def preprocess(image_file, output_file=None):
    original = np.array(Image.open(image_file))
    grayscaled = np.dot(original[...,:3], [0.3, 0.59, 0.11]).astype(np.float32)
    if isinstance(output_file, str):
        Image.fromarray(grayscaled.astype(np.uint8)).save(output_file)
    return grayscaled

def convolution(image, kernel, output_file):
    image_height, image_width = image.shape
    kernel_height, kernel_width = kernel.shape

    # Add zero-padding around image to prevent indexing issues.
    pad_height, pad_width = kernel_height // 2, kernel_width // 2
    padded_image = np.pad(image, ((pad_height, pad_height), (pad_width, pad_width)), mode='constant')

    # Create an empty output image
    output = np.zeros_like(image)

    # Perform convolution.
    for i in range(image_height):
        for j in range(image_width):
            region = padded_image[i:i+kernel_height, j:j+kernel_width]
            output[i, j] = np.sum(region * kernel)

    # Clip values between 0 and 255.
    output = np.clip(output, 0, 255)
    # Cast values to unsigned 8-bit integers.
    output = output.astype(np.uint8)
    Image.fromarray(output).save(output_file)
    

grayscaled = preprocess("original.png", "grayscaled.png")

kernel = np.array([
    [0,  1, 0],
    [1, -4, 1],
    [0,  1, 0]
], dtype=np.float32)
convolution(grayscaled, kernel, "output.png")
