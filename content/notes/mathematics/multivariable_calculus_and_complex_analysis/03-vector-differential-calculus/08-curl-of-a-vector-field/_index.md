+++
draft = false
title = '08 - Curl of a Vector Field'
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

Let \(\mathbf{v}\) be a velocity vector of a steady fluid flow. Is the flow irrotational? Incompressible? Find the streamlines (the paths of the particles).

\[
  \mathbf{v} = \left[y,\,-2x,\,0\right]
\]

{{<divider>}}

To check if the flow is _irrotational_, we compute the curl of the vector field and see if it evaluates to a zero vector. If it evaluates to a zero vector, then the flow is irrotational.

\[
  \nabla \times \mathbf{v} =
  \begin{vmatrix}
  \mathbf{i} & \mathbf{j} & \mathbf{k} \\
  \partial_x & \partial_y & \partial_z \\
  y & -2x & 0
  \end{vmatrix}
\]

This gives:

* **i-component**: \(\frac{\partial}{\partial y}(0) - \frac{\partial}{\partial z}(-2x) = 0 - 0 = 0\)
* **j-component**: \(- \left( \frac{\partial}{\partial x}(0) - \frac{\partial}{\partial z}(y) \right) = - (0 - 0) = 0\)
* **k-component**: \(\frac{\partial}{\partial x}(-2x) - \frac{\partial}{\partial y}(y) = -2 - 1 = -3\)

So:

\[
\nabla \times \mathbf{v} = \left[0, 0, -3 \right]
\]

Thus, the flow is {{<rawhtml>}}<span><u>not irrotational</u>.</span>{{</rawhtml>}}

Now we need to find if the flow is _incompressible_, we need to check if the divergence is zero.

\[
\nabla \cdot \mathbf{v} = \frac{\partial}{\partial x}(y) + \frac{\partial}{\partial y}(-2x) + \frac{\partial}{\partial z}(0) = 0 + 0 + 0 = 0
\]

Thus the flow is {{<rawhtml>}}<span><u>incompressible</u>.</span>{{</rawhtml>}}

Lastly, we need to find the streamlines.

To find the streamlines we have to recognize that \(\mathbf{v}\) is the velocity vector field and we somehow need to eventually integrate to get the position vector.

So, we have:

\[
  \frac{dx}{dt} = y,\quad \frac{dy}{dt} = -2x,\quad \frac{dz}{dt} = 0
\]

One thing we can tell right away is that \(z\) is going to be a constant because its derivative with respect to time is \(0\).

If we solve for the first two equations in terms of \(dt\), we can set them equal to each other and then perform integration to get our \(x\) and \(y\) components of the position vector.

\[
  dt = \frac{dx}{y},\quad dt = \frac{dy}{-2x}
\]

\[\begin{aligned}
  \frac{dx}{y} &= \frac{dy}{-2x}\\
  -2x\,dx &= y\,dy\\
  2x\,dx+y\,dy &= 0
\end{aligned}\]

\[\begin{aligned}
  \int 2x\, dx + \int y\, dy = x^2 + \frac{1}{2}y^2 = C
\end{aligned}\]

So the streamline is:

\[
  x^2 + \frac{1}{2}y^2 = C
\]

with \(z\) as a constant, contributing to \(C\).

### Problem 4

With respect to right-hand coordinates, let:

\[\begin{aligned}
  \mathbf{u} &= \left[y,z,x\right]\\
  \mathbf{v} &= \left[yz,zx,xy\right]\\
\end{aligned}\]

Find the following:

- \(\text{curl }(\mathbf{u}+\mathbf{v})\)
- \(\text{curl }\mathbf{v}\)

{{<divider>}}

A key idea to note here is that the curl operation is linear and thus can be distributed like so:

\[
\nabla \times (\mathbf{u} + \mathbf{v}) = \nabla \times \mathbf{u} + \nabla \times \mathbf{v}
\]

Because of this, after solving for \(\text{curl }(\mathbf{u}+\mathbf{v})\), solving for \(\text{curl }\mathbf{v}\) becomes trivial.

Solving for \(\text{curl }\mathbf{u}\), we get:

\[
\nabla \times \mathbf{u} =
\begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
\partial_x & \partial_y & \partial_z \\
y & z & x
\end{vmatrix}
\]

* i: \(\partial_y(x) - \partial_z(z) = 0 - 1 = -1\)
* j: \(- ( \partial_x(x) - \partial_z(y) ) = - (1 - 0) = -1\)
* k: \(\partial_x(z) - \partial_y(y) = 0 - 1 = -1\)

\[
\nabla \times \mathbf{u} = \left[ -1, -1, -1 \right]
\]

Solving for \(\text{curl }\mathbf{v}\), we get:

\[
\nabla \times \mathbf{v} =
\begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
\partial_x & \partial_y & \partial_z \\
yz & xz & xy
\end{vmatrix}
\]

* i: \(\partial_y(xy) - \partial_z(xz) = x - x = 0\)
* j: \(- ( \partial_x(xy) - \partial_z(yz) ) = - (y - y) = 0\)
* k: \(\partial_x(xz) - \partial_y(yz) = z - z = 0\)

\[
\nabla \times \mathbf{v} = \langle 0, 0, 0 \rangle
\]
