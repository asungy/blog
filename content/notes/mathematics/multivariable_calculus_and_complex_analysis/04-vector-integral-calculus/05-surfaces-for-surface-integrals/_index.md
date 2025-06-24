+++
draft = false
title = '05 - Surfaces for Surface Integrals'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Exercises

### Problem 1

Derive a parametric representation of the following surface by find the parameter curves (curves \(u = \text{const}\) and \(v = \text{const}\)), and find a normal vector \(\mathbf{N} = \mathbf{r}_u \times \mathbf{r}_v\) of the surface.

\[
  \text{Paraboloid of revolution}\,\mathbf{r}(u,v) = \left[u\cos{v},u\sin{v},u^2\right]
\]

{{<divider>}}

We are given the **parametric surface**:

\[
\mathbf{r}(u, v) = \begin{bmatrix} u \cos v \\ u \sin v \\ u^2 \end{bmatrix}
\]

This is a **paraboloid of revolution**.

- For \(u = \text{const}\):

  Let \(u = a\), a constant. Then:

  \[
  \mathbf{r}(a, v) = \begin{bmatrix} a \cos v \\ a \sin v \\ a^2 \end{bmatrix}
  \]

  This is a **circle** in the plane \(z = a^2\), of radius \(a\).

- For \(v = \text{const}\):

  Let \(v = b\), a constant. Then:

  \[
  \mathbf{r}(u, b) = \begin{bmatrix} u \cos b \\ u \sin b \\ u^2 \end{bmatrix}
  \]

  This is a **parabola** in a vertical plane through the z-axis.

We compute the tangent vectors:

- \(\mathbf{r}_u = \frac{\partial \mathbf{r}}{\partial u} = \begin{bmatrix} \cos v \\ \sin v \\ 2u \end{bmatrix}\)
- \(\mathbf{r}_v = \frac{\partial \mathbf{r}}{\partial v} = \begin{bmatrix} -u \sin v \\ u \cos v \\ 0 \end{bmatrix}\)

Now compute the **normal vector**:

\[
\mathbf{N} = \mathbf{r}_u \times \mathbf{r}_v = \begin{vmatrix} \mathbf{i} & \mathbf{j} & \mathbf{k} \\ \cos v & \sin v & 2u \\ - u \sin v & u \cos v & 0 \end{vmatrix}
\]

Expanding the determinant:

\[
\mathbf{N} = \mathbf{i} \left( \sin v \cdot 0 - 2u \cdot u \cos v \right) - \mathbf{j} \left( \cos v \cdot 0 - 2u \cdot (-u \sin v) \right) + \mathbf{k} \left( \cos v \cdot u \cos v + \sin v \cdot u \sin v \right)
\]

\[
\mathbf{N} = \begin{bmatrix}
-2u^2 \cos v \\
-2u^2 \sin v \\
u (\cos^2 v + \sin^2 v)
\end{bmatrix}
= \begin{bmatrix}
-2u^2 \cos v \\
-2u^2 \sin v \\
u
\end{bmatrix}
\]

- **Parameter curves:**

  - \(u = \text{const}\): circle at height \(z = u^2\)
  - \(v = \text{const}\): parabola in vertical plane

- **Normal vector:**

  - \( \mathbf{N}(u, v) = \begin{bmatrix} -2u^2 \cos v \\ -2u^2 \sin v \\ u \end{bmatrix} \)

### Problem 2

Find a normal vector of the following:

\[
  \text{Cylinder of revolution}\,(x-2)^2 + (y-1)^2 = 25
\]

{{<divider>}}

We are given the **equation of a cylinder** of revolution:

\[
(x - 2)^2 + (y - 1)^2 = 25
\]

This represents a **cylinder** with:

* **Axis** along the **z-axis**
* **Radius** \(r = 5\)
* **Center of base circle** at \((x, y) = (2, 1)\)

The cylinder is obtained by **extruding** a circle in the \(xy\)-plane along the **z-axis**. So the surface is **independent of \(z\)**.

We can define an **implicit function**:

\[
F(x, y, z) = (x - 2)^2 + (y - 1)^2 - 25
\]

The surface is the level surface \(F(x, y, z) = 0\).

The **normal vector** to a level surface \(F(x, y, z) = 0\) is the **gradient**:

\[
\nabla F = \left\langle \frac{\partial F}{\partial x}, \frac{\partial F}{\partial y}, \frac{\partial F}{\partial z} \right\rangle
= \langle 2(x - 2),\ 2(y - 1),\ 0 \rangle
\]

A normal vector to the cylinder is:

\[
\boxed{\mathbf{N} = \langle 2(x - 2),\ 2(y - 1),\ 0 \rangle}
\]

This vector lies in the \(xy\)-plane and points radially outward from the axis of the cylinder.
