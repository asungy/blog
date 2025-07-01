+++
title = "Playing with the Laplacian"
# Run the following command to generate the current date: `date -u +"%Y-%m-%dT%H:%M:%SZ"`
date = "2025-06-15T19:02:35Z"
description = "Trying to understand how the Laplacian operator works."
showFullContent = false
readingTime = true
hideComments = false
ToC = false
math = true
+++

After reading that the Laplacian operator is used in medical imaging to make the outlines in images more defined, I was curious what this actually looked like in practice. It turns out there's this thing called a [_Laplacian matrix_](https://en.wikipedia.org/wiki/Discrete_Laplace_operator) that is used on discrete values and approximates the values as if it were a continuous function. So instead of differentiating continuous functions, we could use a matrix to somehow approximate this differentiation. At this point of my findings, I'm even more curious how this could even be possible.

Well, there's this idea of [finite differences](https://en.wikipedia.org/wiki/Finite_difference#Higher-order_differences) that is used to approximate derivatives. Recall that for a function \(f(x,y)\), the Laplacian is:

\[
  \nabla f = \frac{\partial^2 f}{\partial x^2} + \frac{\partial^2 f}{\partial y^2} 
\]

The approximation for the second order derivative of a function \(f\) using finite differences is:

\[
  f'' \approx \frac{f(x+1)-2f(x)+f(x-1)}{h^2}
\]

where \(h\) is some constant (usually \(1\)) the defines the spacing between points (I'm guessing this is analogous to \(h\) in the [definition for a derivative](https://en.wikipedia.org/wiki/Derivative#Definition), but is discrete in this context). This approximation formula comes from the Taylor expansion series of \(f(x+h)+f(x-h)\) (which I won't prove here) and it's effectively saying at each point: "_take the points on either side of me and subtract twice me twice from their sum_". Note the similarities and differences here with the definition of the derivative:

\[
  f' = \lim_{h \to 0} \frac{f(x+h)-f(x)}{h}
\]

Anyway, in terms of a pixel on a 2D image where \(i\) specifies its row location and \(j\) specifies its column location, we can say:

\[\begin{aligned}
  \frac{\partial^2 f}{\partial x^2} &\approx f(i+1,j) - 2f(i,j) + f(i-1,j) \\
  \frac{\partial^2 f}{\partial y^2} &\approx f(i, j+1) -2f(i,j) + f(i,j-1)
\end{aligned}\]

So sticking this into our Laplacian formula, we get:

\[\begin{aligned}
  \nabla f &\approx f(i+1,j) - 2f(i,j) + f(i-1,j) + f(i, j+1) - 2f(i,j) + f(i,j-1)\\
  &\approx f(i-1,j) + f(i+1,j) + f(i,j-1) + f(i,j+1) - 4f(i,j)
\end{aligned}\]

So what is this saying? This is saying at each point: "_Take all of the neighbors adjacent to me (excluding diagonal neighbors), sum them and subtract 4 times my value from that_".

Now, the interesting part is that we can turn this into a \(3 \times 3\) matrix that when used as a filter kernel in a convolution operation (that is, taking the filter kernel and overlaying it on top of the image, multiplying the respective pixel values with the filter values, and summing them), will result in this approximation of \(f''\)!

\[
  \nabla f \approx \begin{bmatrix}
    0 & 1  & 0\\
    1 & -4 & 1\\
    0 & 1  & 0\\
  \end{bmatrix} \star f
\]

> If the idea of a convolution operation is confusing, here's a visualization of what the calculation looks like:
> {{<image src="./2D_convolution_animation.gif" width="30%" height="30%">}}

Let's actually write a short Python script to see this in action. For this script, we'll only need the _numpy_ package for matrix operations and the _pillow_ package for image processing. Let's start by importing these packages:

```python
import numpy as np
from PIL import Image
```

First, we're going to take an image and perform some preprocessing on it. Specifically, we're going to take an image file, turn it into a _numpy_ array, perform a dot product operation that grayscales the image (via the [luminosity method](https://www.baeldung.com/cs/convert-rgb-to-grayscale#3-luminosity-method)), and return those pixels. We will also optionally save the grayscale image to a file so that you can view it.

```python
# Run the image through grayscale filter and optionally save it to a separate file.
def preprocess(image_file, output_file=None):
    original = np.array(Image.open(image_file))
    grayscaled = np.dot(original[...,:3], [0.3, 0.59, 0.11]).astype(np.float32)
    if isinstance(output_file, str):
        Image.fromarray(grayscaled.astype(np.uint8)).save(output_file)
    return grayscaled
```

Let's say I have the following image saved as _original.png_:

{{<image src="./original.png" width="30%" height="30%">}}

And we can run the `preprocess` function like so:

```python
grayscaled = preprocess("original.png", "grayscaled.png")
```

And we get the following:

{{<image src="./grayscaled.png" width="30%" height="30%">}}

Why do we need to grayscale the image?

Remember the purpose of using the Laplacian on an image is to detect edges. In particular, the Laplacian is able to detect edges by responding to rapidly changing areas in the image (hence, why the second-order derivative approximation is used). Edges in an image are places where the intensity changes from, say, very bright to very dark, or vice versa. We want to apply a grayscale filter to the image because we don't particularly care about the colors as much as the _intensity_ of each pixel (the whiter the pixel, the more intense it is).

Now, let's implement a function where we apply the Laplacian to our grayscaled image.

```python
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
 ```

Here, we take our image, apply some padding around it to avoid indexing errors, iterate over each pixel in the image and apply the filter kernel, then save the result to a separate buffer. After we apply the convolution, we clip all of the values to fit between 0 and 255 and save the pixel buffer to an image.

And now, we run the convolution step like so:

```python
kernel = np.array([
    [0,  1, 0],
    [1, -4, 1],
    [0,  1, 0]
], dtype=np.float32)
convolution(grayscaled, kernel, "output.png")
```

If we open up _output.png_, we get the following image:

{{<image src="./output1.png" width="30%" height="30%">}}

Pretty cool, huh? This image is a lot more friendly to use in a computer vision context because it strips away a lot of noise and leaves defined edges in the image (or at least it tries to).

We can play around with the filter kernel a little bit.

This one includes the diagonal neighbors in the kernel filter:

\[\text{Kernel filter}\,= \begin{bmatrix}
  1 & 1 & 1 \\
  1 & -8 & 1 \\
  1 & 1 & 1
\end{bmatrix}\]

{{<image src="./output2.png" width="30%" height="30%">}}

And this one uses a \(5 \times 5\) matrix and applies a Gaussian blur before applying the Laplacian:

\[\text{Kernel filter}\,= \begin{bmatrix}
    0  &  0  &  -1 &  0  &  0\\
    0  &  -1 &  -2 &  -1 &  0\\
    -1 &  -2 &  16 &  -2 &  -1\\
    0  &  -1 &  -2 &  -1 &  0\\
    0  &  0  &  -1 &  0  &  0\\
\end{bmatrix}\]

{{<image src="./output3.png" width="30%" height="30%">}}
