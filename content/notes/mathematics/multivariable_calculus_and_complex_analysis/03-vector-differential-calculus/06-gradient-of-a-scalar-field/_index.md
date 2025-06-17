+++
draft = false
title = '06 - Gradient of a Scalar Field'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Exercises

### Problem 1

Find \(\nabla{f}\).

\[
  f = \frac{y}{x}
\]

{{<divider>}}

The gradient of a scalar function \(f(x,y)\) is:

\[
\nabla f = \left( \frac{\partial f}{\partial x}, \frac{\partial f}{\partial y} \right)
\]

So, we need to compute the partial derivatives of \(f\):

\[
\frac{\partial f}{\partial x} = \frac{\partial}{\partial x} \left( \frac{y}{x} \right) = \frac{-y}{x^2}
\]
\[
\frac{\partial f}{\partial y} = \frac{\partial}{\partial y} \left( \frac{y}{x} \right) = \frac{1}{x}
\]

Thus,

\[
  \nabla f = \left( \frac{-y}{x^2}, \frac{1}{x} \right)
\]

### Problem 2

Find \(\nabla f\).

\[
  f = x^4 + y^4
\]

{{<divider>}}

\[
  \nabla f = \left(4x^3, 4y^3\right)
\]

### Problem 3

Find \(\nabla f\).

\[
  f = (x^2 + y^2 + z^2)^{\frac{-1}{2}}
\]

{{<divider>}}

We want to find:

\[
\nabla f = \left( \frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}, \frac{\partial f}{\partial z} \right)
\]

Let \(u = x^2 + y^2 + z^2\), so that

\[
f = u^{\frac{-1}{2}} \quad \Rightarrow \quad \frac{df}{du} = -\frac{1}{2} u^{\frac{-3}{2}}
\]

Then, using the chain rule...

\[\begin{aligned}
  \frac{\partial f}{\partial x} &= \frac{df}{du} \cdot \frac{\partial u}{\partial x} = -\frac{1}{2} (x^2 + y^2 + z^2)^{\frac{-3}{2}} \cdot 2x = -x (x^2 + y^2 + z^2)^{\frac{-3}{2}}\\
  \frac{\partial f}{\partial y} &= \frac{df}{du} \cdot \frac{\partial u}{\partial y} = -\frac{1}{2} (x^2 + y^2 + z^2)^{\frac{-3}{2}} \cdot 2y = -y (x^2 + y^2 + z^2)^{\frac{-3}{2}}\\
  \frac{\partial f}{\partial z} &= \frac{df}{du} \cdot \frac{\partial u}{\partial z} = -\frac{1}{2} (x^2 + y^2 + z^2)^{\frac{-3}{2}} \cdot 2z = -z (x^2 + y^2 + z^2)^{\frac{-3}{2}}\\
\end{aligned}\]

So,

\[
  \nabla f = -\frac{1}{\sqrt{x^2 + y^2 + z^2}} \cdot \left(x,y,z\right)
\]

### Problem 4

Find \(\nabla f\).

\[
  f = \frac{x^2-y^2}{x^2+y^2}
\]

{{<divider>}}

We want to find:

\[
\nabla f = \left( \frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}\right)
\]

Let,

\[\begin{aligned}
  u &= x^2 - y^2\\
  v &= x^2 + y^2\\
\end{aligned}\]

So,

\[
  f = \frac{x^2-y^2}{x^2+y^2} = \frac{u}{v} \Longrightarrow \nabla f = \frac{(\nabla u)(v) - (u) (\nabla v)}{v^2}
\]

Note:

\[\begin{aligned}
  \nabla u &= [2x,\ -2y] \\
  \nabla v &= [2x,\ 2y] \\
\end{aligned}\]

Now we need to evaluate:

\[
\nabla f = \frac{(x^2 + y^2)[2x,\ -2y] - (x^2 - y^2)[2x,\ 2y]}{(x^2 + y^2)^2}
\]

> Skipping computations

\[
\nabla f = \frac{1}{(x^2 + y^2)^2} [4xy^2,\ -4yx^2]
\]

### Problem 5

Prove \(\nabla(f^n) = nf^{n-1}\nabla f\).

{{<divider>}}

The gradient of a function \(f(x,y,z, \dots)\) is:

\[
\nabla f = \left( \frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}, \frac{\partial f}{\partial z}, \dots \right)
\]

So,

\[
  f^n = (f(x, y, z, \dots))^n
\]

If we find the partial derivative with respect to \(x\), we get:

\[
  \frac{\partial (f^n)}{\partial x} = n f^{n-1} \cdot \frac{\partial f}{\partial x}
\]

To find the full gradient, we would do the same for all variables:

\[
\nabla(f^n) = \left( \frac{\partial (f^n)}{\partial x}, \frac{\partial (f^n)}{\partial y}, \dots \right) = \left( n f^{n-1} \frac{\partial f}{\partial x}, n f^{n-1} \frac{\partial f}{\partial y}, \dots \right)
\]

Then we would just factor out \(n f^{n-1} \):

\[
  \nabla(f^n) = \left( n f^{n-1} \frac{\partial f}{\partial x}, n f^{n-1} \frac{\partial f}{\partial y}, \dots \right) = n f^{n-1} \left( \frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}, \dots \right) = n f^{n-1} \nabla f
\]

### Problem 6

Experiments show that in a temperature field, heat flows in a the direction of maximum decrease of temperature \(T\). Find this direction in general and at the given point \(P\).

\[
  T = \frac{z}{x^2+y^2}; \quad P: (0,1,2)
\]

{{<divider>}}

Note that heat flows in the direction of _maximum decrease_ of temperature, thus the gradient is negative:

\[
  \text{Direction of heat flow}\:= -\nabla T
\]

First we need to compute the partial derivatives:

\[
\frac{\partial T}{\partial x} = \frac{\partial}{\partial x} \left( \frac{z}{x^2 + y^2} \right) = z \cdot \frac{d}{dx} \left( \frac{1}{x^2 + y^2} \right) = z \cdot \left( \frac{-2x}{(x^2 + y^2)^2} \right) = \frac{-2xz}{(x^2 + y^2)^2}
\]
\[
\frac{\partial T}{\partial y} = \frac{\partial}{\partial y} \left( \frac{z}{x^2 + y^2} \right) = z \cdot \frac{d}{dy} \left( \frac{1}{x^2 + y^2} \right) = z \cdot \left( \frac{-2y}{(x^2 + y^2)^2} \right) = \frac{-2yz}{(x^2 + y^2)^2}
\]
\[
  \frac{\partial T}{\partial z} = \frac{1}{x^2 + y^2}
\]

Thus,

\[
  \nabla T = \left( \frac{-2xz}{(x^2 + y^2)^2}, \frac{-2yz}{(x^2 + y^2)^2}, \frac{1}{x^2 + y^2} \right)
\]

Now, we evaluate \(-\nabla T\) at \(P = (0,1,2)\):

\[\begin{aligned}
  -\frac{\partial T(0,1,2)}{\partial x} &= -\frac{-2 \cdot 0 \cdot 2}{1^2} = 0 \\
  -\frac{\partial T(0,1,2)}{\partial y} &= -\frac{-2 \cdot 1 \cdot 2}{1^2} = 4 \\
 -\frac{\partial T(0,1,2)}{\partial z} &= -\frac{1}{0^2 + 1^2} = -\frac{1}{1} = -1
\end{aligned}\]

So,

\[
  -\nabla T(0,1,2) = (0,4,-1)
\]

### Problem 7

The force in an electrostatic field given by \(f\) has the direction of the gradient. Find \(\nabla f\) and its value at \(P\).

\[
  f = ln(x^2 + y^2),\quad P: (8,6)
\]

{{<divider>}}

Compute the partial derivatives:

\[\begin{aligned}
  \frac{\partial f}{\partial x} = \frac{1}{x^2 + y^2} \cdot 2x = \frac{2x}{x^2 + y^2}\\
  \frac{\partial f}{\partial y} = \frac{1}{x^2 + y^2} \cdot 2y = \frac{2y}{x^2 + y^2}
\end{aligned}\]

Evaluate the gradient at \(P = (8,6)\):

\[\begin{aligned}
  \frac{\partial f(8,6)}{\partial x} = \frac{2(8)}{(8)^2 + (6)^2} = \frac{4}{25} \\
  \frac{\partial f(8,6)}{\partial y} = \frac{2(6)}{(8)^2 + (6)^2} = \frac{3}{25}
\end{aligned}\]

So,
\[
  \nabla f(8,6) = \left( \frac{4}{25},\ \frac{3}{25} \right)
\]

