+++
draft = false
title = '07 - Divergence of a Vector Field'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Exercises

### Problem 1

Find div \(\mathbf{v}\) and its value at \(P\).

\[
  \mathbf{v} = \left[x^2, 4y^2, 9z^2\right],\quad P: \left(-1, 0, \frac{1}{2}\right)
\]

{{<divider>}}

The divergence of a vector field is defined as:

\[
  \text{div} \, \mathbf{v} = \frac{\partial v_1}{\partial x} + \frac{\partial v_2}{\partial y} + \frac{\partial v_3}{\partial z}.
\]

So,

\[
  \text{div} \, \mathbf{v} = 2x + 8y + 18z
\]
\[
  \text{div} \, \mathbf{v} \big|_{P = (-1, 0, \frac{1}{2})} = 2(-1) + 8(0) + 18(\frac{1}{2}) = 7
\]

### Problem 2

Find div \(\mathbf{v}\) and its value at \(P\).

\[
  \mathbf{v} = x^2 y^2 z^2 \left[x,y,z\right],\quad P: \left(3, -1, 4\right)
\]

{{<divider>}}

\[
\mathbf{v} = x^2 y^2 z^2 \cdot [x, y, z] = 
\begin{bmatrix}
x^3 y^2 z^2 \\
x^2 y^3 z^2 \\
x^2 y^2 z^3
\end{bmatrix}
\]

So,

\[\begin{aligned}
  \text{div} \, \mathbf{v} &= \frac{\partial}{\partial x}(x^3 y^2 z^2) + \frac{\partial}{\partial y}(x^2 y^3 z^2) + \frac{\partial}{\partial z}(x^2 y^2 z^3) \\
  &= (3x^2 y^2 z^2) + (x^2 3y^2 z^2) + (x^2 y^2 3z^2)\\
  &= 9x^2 y^2 z^2
\end{aligned}\]

If we evaluate \(\text{div}\,\mathbf{v}\) at \(\left(3, -1, 4\right)\), then

\[
  \text{div} \, \mathbf{v} \big|_{(3, -1, 4)} = 9(3)^2 (-1)^2 (4)^2 = 1296
\]

### Problem 3

Calculate \(\nabla^2f\) by the Laplacian.

\[
  f = \text{cos}^2x + \text{sin}^2y
\]

{{<divider>}}

The Laplacian is defined by:

\[
  \text{div}(\text{grad}\,f) = \nabla^2\,f
\]

In terms of a 2-dimensional function, this is:

\[
  \nabla^2 f = \frac{\partial^2 f}{\partial x^2} + \frac{\partial^2 f}{\partial y^2}
\]


For \(\frac{d^2}{dx^2}(\cos^2 x)\),

\[\frac{d}{dx}(\cos^2 x) = 2\cos x(-\sin x) = -2\sin x \cos x\]
\[\frac{d^2}{dx^2}(\cos^2 x) = \frac{d}{dx}(-2\sin x \cos x) = -2[(\cos x)(\cos x) + (\sin x)(-\sin x)] = -2[\cos^2 x - \sin^2 x]\]

For \(\frac{d^2}{dy^2}(\sin^2 y)\),

\[\frac{d}{dy}(\sin^2 y) = 2\sin y \cos y\]
\[\frac{d^2}{dy^2}(\sin^2 y) = \frac{d}{dx}(2\sin y \cos y)= 2[(\cos y)^2 + (\sin y)(- \sin y)] = 2[\cos^2 y - \sin^2 y]\]

So,

\[
  \nabla^2\,f=-2[\cos^2 x - \sin^2 x] + 2[\cos^2 y - \sin^2 y]
\]
