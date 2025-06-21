+++
draft = false
title = '03 - Vector Product (Cross Product)'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Exercises

### Problem 1

A wheel is rotating about the y-axis with an angular speed of \(\omega = 20\,\text{sec}^{-1}\). The rotation appears clockwise if one looks from the orgiin in the positive y-direction. Find the velocity and speed at the point \(\left[8,6,0\right]\).

{{<divider>}}

We are given:

* A wheel rotates about the **\(y\)-axis** with **angular speed** \(\omega = 20\, \text{sec}^{-1}\)
* Rotation appears **clockwise when viewed from the origin looking in the \(+y\) direction** — this means the angular velocity vector points in the **negative \(y\)-direction**:

  $$
  \boldsymbol{\omega} = [0, -20, 0]
  $$
* We are to find the **velocity** and **speed** at the point:

  $$
  \mathbf{r} = [8, 6, 0]
  $$

---

Use the cross product formula.

Velocity of a point on a rotating object is:

\[
\mathbf{v} = \boldsymbol{\omega} \times \mathbf{r}
\]

Compute:

\[
\boldsymbol{\omega} \times \mathbf{r} = 
\begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
0 & -20 & 0 \\
8 & 6 & 0
\end{vmatrix}
= \mathbf{i}( -20 \cdot 0 - 0 \cdot 6 ) - \mathbf{j}( 0 \cdot 0 - 0 \cdot 8 ) + \mathbf{k}( 0 \cdot 6 - (-20) \cdot 8 )
\]

\[
= \mathbf{i}(0) - \mathbf{j}(0) + \mathbf{k}(160)
= [0, 0, 160]
\]

* **Velocity vector** at the point is:

  $$
  \boxed{\mathbf{v} = [0, 0, 160]}
  $$

* **Speed** is the magnitude of the velocity:

  $$
  \boxed{|\mathbf{v}| = 160}
  $$

### Problem 2

With respect to right-handed Cartesian coordinates, let:

\[\begin{aligned}
  \mathbf{a} &= \left[-3,2,0\right]\\
  \mathbf{b} &= \left[1,4,-2\right]
\end{aligned}\]

Find

\[
  4\mathbf{a} \times 3\mathbf{b},\quad 12|\mathbf{a} \times \mathbf{b}|,\quad 12|\mathbf{b} \times \mathbf{a}|
\]

{{<divider>}}

Compute \(\mathbf{a} \times \mathbf{b}\).

Use the determinant method:

\[
\mathbf{a} \times \mathbf{b} =
\begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
-3 & 2 & 0 \\
1 & 4 & -2
\end{vmatrix}
= \mathbf{i}(2 \cdot (-2) - 0 \cdot 4) - \mathbf{j}(-3 \cdot (-2) - 0 \cdot 1) + \mathbf{k}(-3 \cdot 4 - 2 \cdot 1)
\]

\[
= \mathbf{i}(-4) - \mathbf{j}(6) + \mathbf{k}(-12 - 2) = [-4, -6, -14]
\]

Use scalar multiplication for \(4\mathbf{a} \times 3\mathbf{b}\)

Use the rule:

\[
k\mathbf{u} \times m\mathbf{v} = km(\mathbf{u} \times \mathbf{v})
\Rightarrow 4\mathbf{a} \times 3\mathbf{b} = 12(\mathbf{a} \times \mathbf{b}) = 12[-4, -6, -14] = [-48, -72, -168]
\]

Compute \(12|\mathbf{a} \times \mathbf{b}|\).

\[
|\mathbf{a} \times \mathbf{b}| = \sqrt{(-4)^2 + (-6)^2 + (-14)^2} = \sqrt{16 + 36 + 196} = \sqrt{248}
= \sqrt{4 \cdot 62} = 2\sqrt{62}
\]

\[
12|\mathbf{a} \times \mathbf{b}| = 12 \cdot 2\sqrt{62} = 24\sqrt{62}
\]

Use identity \(\mathbf{b} \times \mathbf{a} = -(\mathbf{a} \times \mathbf{b})\)

Therefore:

\[
|\mathbf{b} \times \mathbf{a}| = |\mathbf{a} \times \mathbf{b}| = \sqrt{248}
\quad \Rightarrow \quad 12|\mathbf{b} \times \mathbf{a}| = 24\sqrt{62}
\]

### Problem 3

Find the moment vector \(\mathbf{m}\) and \(m\) of \(\mathbf{p} = \left[2,3,0\right]\) about \(Q:\,\left(2,1,0\right)\) acting on a line through \(A:\,\left(0,3,0\right)\).

{{<divider>}}

The moment vector of a force \(\mathbf{p}\) about point \(Q\) is given by:

\[
\mathbf{m} = \mathbf{r} \times \mathbf{p}
\]

where \(\mathbf{r}\) is the vector from \(Q\) to the point of application of \(\mathbf{p}\). Since the force acts on a line through point \(A = (0, 3, 0)\), we take:

\[
\mathbf{r} = \overrightarrow{QA} = A - Q = [0 - 2,\ 3 - 1,\ 0 - 0] = [-2, 2, 0]
\]

Now compute the cross product:

\[
\mathbf{m} = [-2, 2, 0] \times [2, 3, 0]
\]

Use the determinant:

\[
\mathbf{m} =
\begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
-2 & 2 & 0 \\
2 & 3 & 0
\end{vmatrix}
= \mathbf{i}(2 \cdot 0 - 0 \cdot 3) - \mathbf{j}(-2 \cdot 0 - 0 \cdot 2) + \mathbf{k}(-2 \cdot 3 - 2 \cdot 2)
= [0,\ 0,\ -6 - 4] = [0,\ 0,\ -10]
\]

So the moment vector is:

\[
\boxed{\mathbf{m} = [0,\ 0,\ -10]}
\]

The scalar moment \(m\) about a line through \(A\) in the direction of the force is the projection of \(\mathbf{m}\) onto the line's direction.

Let’s find the direction vector \(\mathbf{d}\) of the line. Since the force acts **along** the line, we take:

\[
\mathbf{d} = \mathbf{p} = [2, 3, 0]
\]

The scalar moment is:

\[
m = \frac{\mathbf{m} \cdot \mathbf{d}}{|\mathbf{d}|}
\]

Compute the dot product:

\[
\mathbf{m} \cdot \mathbf{d} = [0, 0, -10] \cdot [2, 3, 0] = 0
\]

So:

\[
\boxed{m = 0}
\]

- **Moment vector**: \(\boxed{\mathbf{m} = [0,\ 0,\ -10]}\)
- **Scalar moment** about the line: \(\boxed{m = 0}\)

This means the force creates a moment (torque) about point \(Q\), but **no twisting effect** about the given line.

### Problem 4

> TODO: Revisit. LLM-generated.

Find the volume if the vertices are \(\left(1,1,1\right)\), \(\left(5,-7,3\right)\), \(\left(7,4,8\right)\), and \(\left(10,7,4\right)\).

{{<divider>}}

Proof for \(V = \frac{1}{6} \left| (\vec{AB} \times \vec{AC}) \cdot \vec{AD} \right|\):

Given three vectors \(\vec{u}, \vec{v}, \vec{w}\), the **volume of the parallelepiped** they span is:

\[
V_{\text{parallelepiped}} = \left| \vec{u} \cdot (\vec{v} \times \vec{w}) \right|
\]

This is called the **scalar triple product**, and it measures the signed volume of the 3D box defined by those vectors.

So if we construct vectors:

* \(\vec{AB} = \vec{u}\)
* \(\vec{AC} = \vec{v}\)
* \(\vec{AD} = \vec{w}\)

then the **volume of the parallelepiped** defined by these vectors is:

\[
|\vec{AB} \cdot (\vec{AC} \times \vec{AD})|
= |(\vec{AB} \times \vec{AC}) \cdot \vec{AD}|
\]

The tetrahedron is 1/6 of the parallelepiped. Why 1/6?

* A **parallelepiped** can be divided into **6 tetrahedra** of equal volume.
* Each tetrahedron shares one vertex with the parallelepiped and spans the three edges from that vertex.

So the **volume of the tetrahedron** defined by \(A, B, C, D\) is:

\[
V = \frac{1}{6} \left| (\vec{AB} \times \vec{AC}) \cdot \vec{AD} \right|
\]

Geometric meaning:

* \(\vec{AB} \times \vec{AC}\) gives a vector **normal to the base triangle** \(ABC\), with magnitude equal to **area of the parallelogram** spanned by \(\vec{AB}, \vec{AC}\)
* Dotting this with \(\vec{AD}\) projects the height of the tetrahedron relative to the base \(ABC\)
* Taking absolute value ensures a **positive volume**, regardless of orientation

{{<divider width="30%">}}

We are given four points:

\[
A = (1, 1, 1), \quad B = (5, -7, 3), \quad C = (7, 4, 8), \quad D = (10, 7, 4)
\]

To find the **volume** of the **tetrahedron** formed by these points, we use the formula:

\[
V = \frac{1}{6} \left| (\vec{AB} \times \vec{AC}) \cdot \vec{AD} \right|
\]

\[
\vec{AB} = B - A = [5 - 1, -7 - 1, 3 - 1] = [4, -8, 2]
\]

\[
\vec{AC} = C - A = [7 - 1, 4 - 1, 8 - 1] = [6, 3, 7]
\]

\[
\vec{AD} = D - A = [10 - 1, 7 - 1, 4 - 1] = [9, 6, 3]
\]


Compute $\vec{AB} \times \vec{AC}$.

\[
\vec{AB} \times \vec{AC} =
\begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
4 & -8 & 2 \\
6 & 3 & 7
\end{vmatrix}
= \mathbf{i}((-8)(7) - (2)(3)) - \mathbf{j}((4)(7) - (2)(6)) + \mathbf{k}((4)(3) - (-8)(6))
\]

\[
= \mathbf{i}(-56 - 6) - \mathbf{j}(28 - 12) + \mathbf{k}(12 + 48)
= \mathbf{i}(-62) - \mathbf{j}(16) + \mathbf{k}(60)
\Rightarrow [-62,\ -16,\ 60]
\]

Compute the scalar triple product.

\[
(\vec{AB} \times \vec{AC}) \cdot \vec{AD}
= [-62, -16, 60] \cdot [9, 6, 3]
= (-62)(9) + (-16)(6) + (60)(3)
= -558 - 96 + 180 = -474
\]

Compute the volume.

\[
V = \frac{1}{6} | -474 | = \frac{474}{6} = 79
\]
