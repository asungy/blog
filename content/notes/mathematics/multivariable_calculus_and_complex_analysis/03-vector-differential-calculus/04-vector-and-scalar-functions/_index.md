+++
draft = false
title = '04 - Vector and Scalar Functions and Their Fields'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

> 9.4 – 3, 13, 19, 24

## Exercises

### Problem 1

Let the temperature \(T\) in a body be independent of \(z\) so that it is given by a scalar function \(T = T(x,t)\). Identity the isotherms \(T(x,y) = \text{const}\).

\[
  T = 3x-4y
\]

{{<divider>}}

We are asked to identify the **isotherms**, which are curves along which the temperature is constant. That means we set:

\[
T(x, y) = \text{const} = C
\]

Substituting the expression for \(T(x, y)\):

\[
3x - 4y = C
\]

This is the equation of a straight line in the \(xy\)-plane for each constant value \(C\). Therefore, the **isotherms are straight lines** of the form:

\[
y = \frac{3}{4}x - \frac{C}{4}
\]

Each line has slope \(\frac{3}{4}\), and the vertical position (intercept) depends on the value of the constant temperature \(C\).

### Problem 2

What kind of surfaces are the **level surfaces** \(f(x,y,z) = \text{const}\)?

\[
  f = z-(x^2+y^2)
\]

{{<divider>}}

We are to find the **level surfaces**, which are the sets of points \((x, y, z)\) where:

\[
f(x, y, z) = \text{const} = C
\]

So we solve:

\[
z - (x^2 + y^2) = C
\quad \Rightarrow \quad
z = x^2 + y^2 + C
\]

This is a family of **paraboloid surfaces** that open in the positive \(z\)-direction.

- Each level surface corresponds to a fixed value of \(C\), which just vertically shifts the paraboloid.
- The general shape is a **circular paraboloid** because the cross-section in \(x\) and \(y\) is circular (\(x^2 + y^2\)).

### Problem 3

Find the first partial derivatives of \(\mathbf{v}_1=\left[e^x\cos{y},\,e^x\sin{y}\right]\) \(\mathbf{v}_2 = \left[\cos{x}\cosh{y}, -\sin{x}\sinh{y}\right]\).

{{<divider>}}

\[
\mathbf{v}_1 = \begin{bmatrix} e^x \cos y \\ e^x \sin y \end{bmatrix}
\]

We compute the partial derivatives with respect to \(x\) and \(y\):

- \(\frac{\partial \mathbf{v}_1}{\partial x} = \begin{bmatrix} \frac{\partial}{\partial x}(e^x \cos y) \\ \frac{\partial}{\partial x}(e^x \sin y) \end{bmatrix} = \begin{bmatrix} e^x \cos y \\ e^x \sin y \end{bmatrix}\)

- \(\frac{\partial \mathbf{v}_1}{\partial y} = \begin{bmatrix} \frac{\partial}{\partial y}(e^x \cos y) \\ \frac{\partial}{\partial y}(e^x \sin y) \end{bmatrix} = \begin{bmatrix} -e^x \sin y \\ e^x \cos y \end{bmatrix}\)

\[
\mathbf{v}_2 = \begin{bmatrix} \cos x \cosh y \\ -\sin x \sinh y \end{bmatrix}
\]

- \(\frac{\partial \mathbf{v}_2}{\partial x} = \begin{bmatrix} \frac{\partial}{\partial x}(\cos x \cosh y) \\ \frac{\partial}{\partial x}(-\sin x \sinh y) \end{bmatrix} = \begin{bmatrix} -\sin x \cosh y \\ -\cos x \sinh y \end{bmatrix}\)

- \(\frac{\partial \mathbf{v}_2}{\partial y} = \begin{bmatrix} \frac{\partial}{\partial y}(\cos x \cosh y) \\ \frac{\partial}{\partial y}(-\sin x \sinh y) \end{bmatrix} = \begin{bmatrix} \cos x \sinh y \\ -\sin x \cosh y \end{bmatrix}\)

