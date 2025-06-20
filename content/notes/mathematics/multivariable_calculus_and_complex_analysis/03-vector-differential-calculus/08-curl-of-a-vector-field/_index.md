+++
draft = false
title = '08 (STARTED) - Curl of a Vector Field'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Exercises

### Problem 1

Find \(\text{curl }\mathbf{v}\) for \(\mathbf{v}\) given with respect to right-handed Cartesian coordinates.

\[
  \mathbf{v} = xyz\left[x,y,z\right]
\]

{{<divider>}}

Let's rewrite \(\mathbf{v}\) to be:

\[
  \mathbf{v} = \left[x^2yz,\,xy^2z,\,xyz^2\right]
\]

Using the curl formula on \(\mathbf{v}\), we have:

\[
  \nabla \times \mathbf{v} = \begin{vmatrix}
    \mathbf{i}                  & \mathbf{j}                  & \mathbf{k} \\
    \frac{\partial}{\partial x} & \frac{\partial}{\partial y} & \frac{\partial}{\partial z} \\
    x^2yz                       & xy^2z                       & xyz^2 \\
  \end{vmatrix}
\]

Solving for the \(\mathbf{i}\) component:

\[
  \frac{\partial}{\partial y}(xyz^2) - \frac{\partial}{\partial z}(xy^2z) = xz^2 - xy^2
\]

Solving for the \(\mathbf{j}\) component:

\[
  -\left( \frac{\partial}{\partial x}(xyz^2) - \frac{\partial}{\partial z}(x^2yz) \right) = - \left( yz^2 - x^2y \right) = x^2y - yz^2
\]

Solving for the \(\mathbf{k}\) component:

\[
  \frac{\partial}{\partial x}(xy^2z) - \frac{\partial}{\partial y}(x^2yz) = y^2z - x^2z
\]

So,

\[
  \nabla \times \mathbf{v} = \left[xz^2 - xy^2, \; x^2y - yz^2, \; y^2z - x^2z \right]
\]

### Problem 2

Find \(\text{curl }\mathbf{v}\) for \(\mathbf{v}\) given with respect to right-handed Cartesian coordinates.

\[
  \mathbf{v} = \left[0,\, 0,\, e^{-x},\, \sin{y}\right]
\]

{{<divider>}}

Using the curl formula, we have:

\[
\nabla \times \mathbf{v} = \begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
\frac{\partial}{\partial x} & \frac{\partial}{\partial y} & \frac{\partial}{\partial z} \\
0 & 0 & e^{-x} \sin y
\end{vmatrix}
\]

Solving for the \(\mathbf{i}\) component:

\[
  \frac{\partial}{\partial y}(e^{-x} \sin y) - \frac{\partial}{\partial z}(0) = e^{-x} \cos y
\]

Solving for the \(\mathbf{j}\) component:

\[
  -\left( \frac{\partial}{\partial x}(e^{-x} \sin y) - \frac{\partial}{\partial z}(0) \right) = - ( -e^{-x} \sin y ) = e^{-x} \sin y
\]

Solving for the \(\mathbf{k}\) component:

\[
  \frac{\partial}{\partial x}(0) - \frac{\partial}{\partial y}(0) = 0
\]

So,

\[
  \nabla \times \mathbf{v} = \left[ e^{-x} \cos y, \; e^{-x} \sin y, \; 0 \right]
\]

### Problem 3

Let \(\mathbf{v}\) be a velocity vector
