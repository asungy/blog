+++
draft = false
title = '01 - Vectors in 2-Space and 3-Space'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Exercises

### Problem 1

Find the components of the vector \(\mathbf{v}\) with the initial point \(P\) and terminal point \(Q\):

\[
  P = (3.0, 4.0, 0.5), \quad Q = (5.5, 0, 1.2)
\]

{{<divider>}}

\[
  \mathbf{v} = Q - P = 
  \begin{bmatrix}
  5.5 - 3.0 \\
  0 - 4.0 \\
  1.2 - 0.5
  \end{bmatrix} =
  \begin{bmatrix}
  2.5 \\
  -4.0 \\
  0.7
  \end{bmatrix}
\]

### Problem 2

Find the terminal point \(Q\) of the vector \(\mathbf{v}\) with components given as the initial point \(P\). Find \(|\mathbf{v}|\).

\[
  \mathbf{v} = [\frac{1}{2}, 3, -\frac{1}{4}]; \quad P = (\frac{7}{2}, -3, \frac{3}{4})
\]

{{<divider>}}

To find \(Q\), we add the vector components to the initial point:

\[\begin{aligned}
Q &= P + \mathbf{v} \\
&= \left( \frac{7}{2} + \frac{1}{2},\ -3 + 3,\ \frac{3}{4} + \left(-\frac{1}{4}\right) \right) \\
&= \left( \frac{8}{2},\ 0,\ \frac{2}{4} \right) \\
&= (4,\ 0,\ \frac{1}{2})
\end{aligned}\]

Finding the magnitude of \(\mathbf{v}\):

\[\begin{aligned}
|\mathbf{v}| &= \sqrt{ \left( \frac{1}{2} \right)^2 + 3^2 + \left( -\frac{1}{4} \right)^2 }\\
&= \sqrt{ \frac{1}{4} + 9 + \frac{1}{16} } \\
&= \sqrt{ \frac{4}{16} + \frac{144}{16} + \frac{1}{16} } \\
&= \sqrt{ \frac{149}{16} } \\
&= \frac{\sqrt{149}}{4} \\
\end{aligned}\]

### Problem 3

Find the resultant in terms of components and its magnitude:

\[
  \mathbf{u} = [3, 1, -6], \quad
  \mathbf{v} = [0, 2, 5], \quad
  \mathbf{w} = [3, -1, -13]
\]

{{<divider>}}

Finding the resultant vector:

\[
\mathbf{u} + \mathbf{v} + \mathbf{w} = [3 + 0 + 3,\ 1 + 2 + (-1),\ -6 + 5 + (-13)] = [6,\ 2,\ -14]
\]

Find the magnitude of the resultant vector:

\[
\sqrt{6^2 + 2^2 + (-14)^2} = \sqrt{36 + 4 + 196} = \sqrt{236}
\]

### Problem 4

Find the forces in the system of two rods (truss) where \(|\mathbf{p}| = 1000 \text{ N}\).

{{<image src="./problem4-diagram.png" position="center" width="30%" height="30%">}}

{{<divider>}}

The forces between the rods are at equilbrium so:

\[
\mathbf{u} + \mathbf{v} + \mathbf{p} = \mathbf{0}
\]

From the diagram we get the following equation:

\[\begin{aligned}
  |\mathbf{u}|\begin{bmatrix}\text{cos}(180°) & \text{sin}(180°)\end{bmatrix} + |\mathbf{v}|\begin{bmatrix}\text{cos}(45°) & \text{sin}(45°)\end{bmatrix} + |\mathbf{p}|\begin{bmatrix}\text{cos}(270°) & \text{sin}(270°)\end{bmatrix} &= \mathbf{0} \\
  |\mathbf{u}|\begin{bmatrix}-1 & 0\end{bmatrix} + |\mathbf{v}|\begin{bmatrix}\frac{\sqrt{2}}{2} & \frac{\sqrt{2}}{2}\end{bmatrix} + 1000\begin{bmatrix}0 & -1\end{bmatrix} &= \mathbf{0} \\
  |\mathbf{u}|\begin{bmatrix}-1 & 0\end{bmatrix} + |\mathbf{v}|\begin{bmatrix}\frac{\sqrt{2}}{2} & \frac{\sqrt{2}}{2}\end{bmatrix} &= -1000\begin{bmatrix}0 & -1\end{bmatrix} \\
  \begin{bmatrix}-|\mathbf{u}| & 0\end{bmatrix} + \begin{bmatrix}\frac{|\mathbf{v}|\sqrt{2}}{2} & \frac{|\mathbf{v}|\sqrt{2}}{2} \end{bmatrix} &= -1000\begin{bmatrix}0 & -1\end{bmatrix} \\
\end{aligned}\]

Now we can form the following system:

\[\begin{aligned}
  -|\mathbf{u}| + \frac{|\mathbf{v}|\sqrt{2}}{2} = 0 \\
  \frac{|\mathbf{v}|\sqrt{2}}{2} = 1000
\end{aligned}\]

Solving for \(|\mathbf{u}|\) and \(|\mathbf{v}|\), we get:

\[\begin{aligned}
  |\mathbf{u}| &= 1000\\
  |\mathbf{v}| &= 1000\sqrt{2}\\
\end{aligned}\]
