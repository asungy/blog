+++
draft = false
title = 'Building Micrograd'
readingTime = false
math = true
ToC = true
layout = 'single'
+++

> Here are my notes for Andrej Karpathy's video titled {{<ablank href="https://youtu.be/VMj-3S1tku0" text="The spelled-out intro to neural networks and backpropagation: building micrograd">}}. I'm assuming that the reader is following along with their own Jupyter notebook.

{{<rawhtml>}}<br />{{</rawhtml>}}

> Run these import statements so we don't need to import anything later on:
> ```python
> from collections import deque
> from enum import Enum
> from graphviz import Digraph
> import json
> import math
> import matplotlib.pyplot as plt
> import numpy as np
> %matplotlib inline
> ```

## Derivatives

> Timestamp: {{<ablank href="https://www.youtube.com/watch?v=VMj-3S1tku0&t=488s" text="00:08:08">}}

Let's start simple. Consider the following function:

\[
  f(x) = 3x^2 - 4x + 5
\]

We can plot this function like so:

```python
f = lambda x: 3*x**2 - 4*x + 5
xs = np.arange(-5, 5, 0.25)
ys = f(xs)
plt.plot(xs, ys)
```
{{<image src="./images/001-function-plot.png" position="center">}}

Recall the formula to find the derivative of the function \(f(x)\):

\[
  f'(x) = \lim_{h \to 0} \frac{f(x+h)-f(x)}{h}
\]

If we wanted to computationally find the approximate derivative at any point along the function, we can use this formula to compute it.

```python
h = 0.000001 # Small h value as a substitute for h -> 0
x = 3.0
assert((f(x + h) - f(x)) / h, 14.000003002223593)
```
Here, we tried to approximate the derivative of \(f(3)\) and we get a value of `14.000003002223593`. Note that limits imply abstract infinitesimal values which cannot be fully represented in computers, so the best way we can represent \(\lim_{h \to 0}\) is to set `h` to a value that is really close to `0`, in this case, `0.000001`.

We can verify that this works by computing the derivative as if we were back doing high school calculus.

\[\begin{aligned}
  f(x) &= 3x^2-4x+5 \\
  f'(x) &= 6x-4 \\
  f'(x) &= 6(3.0)-4 \\
  f'(x) &= 14.0
\end{aligned}\]

The essence of the derivative is a bit abstract and requires more foundational knowledge to truly appreciate, but we can make do with the general description that the derivative of a function tells us by what factor that function changes at any given point.

## Partial Derivatives

> Timestamp: {{<ablank href="https://www.youtube.com/watch?v=VMj-3S1tku0&t=852s" text="00:14:12">}}

Previously, we examined the derivative of a function with respect to one variable. Now, we're going to study a function with multiple variables.

Let's consider the following function:

\[
  g(a,b,c) = ab + c
\]

We want to know how \(g\) changes with any changes made to the variables \(a\), \(b\), and \(c\).

Let's consider \(g\) at the point \(a=2.0, b=-3.0, c=10.0\) and let's determine how \(g\) changes with respect to \(a\):

```python
a, b, c = 2.0, -3.0, 10.0
g = lambda a, b, c: a * b + c
h = 0.000001
dgda = (g(a+h, b, c) - g(a, b, c))/h
assert(dgda == -3.000000000419334)
```
This tells us that at the point \(a=2.0, b=-3.0, c=10.0\), increasing \(a\) decreases \(g(a,b,c)\) by a factor of 3.

Here are the slopes for \(b\) and \(c\) at \(a=2.0, b=-3.0, c=10.0\):

```python
dgdb = (g(a, b+h, c) - g(a, b, c))/h
assert(dgdb == 2.000000000279556)

dgdc = (g(a, b, c+h) - g(a, b, c))/h
assert(dgdc == 0.9999999992515995)
```

Like before, we can validate these values by hand:

\[
  g(a,b,c) = ab+c
\]

\[
  \frac{\partial g}{\partial a} = b = -3 \hspace{1.5cm}
  \frac{\partial g}{\partial b} = a = 2  \hspace{1.5cm}
  \frac{\partial g}{\partial c} = 1
\]

## Implementing a `Value` class

> Timestamp: {{<ablank href="https://www.youtube.com/watch?v=VMj-3S1tku0&t=1149s" text="00:19:09">}}

