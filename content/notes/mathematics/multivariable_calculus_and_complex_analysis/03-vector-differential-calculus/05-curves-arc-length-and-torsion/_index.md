+++
draft = false
title = '05 - Curves, Arc Length, Curvature, and Torsion'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Exercises

### Problem 1

What curves are represented by the following:

\[
  \left[\cos{t}, \sin{2t}, 0\right]
\]

{{<divider>}}

Let:

- \(x(t) = \cos t\)
- \(y(t) = \sin(2t)\)
- \(z(t) = 0\)

Eliminate the parameter \(t\) to find a relationship between \(x\) and \(y\).

We use the identity:

\[
\sin(2t) = 2\sin t \cos t
\]

So:

\[
y = 2\sin t \cos t
\]

From \(x = \cos t\), we can solve for \(\cos t = x\), and then use the identity:

\[
\sin^2 t = 1 - \cos^2 t = 1 - x^2
\Rightarrow \sin t = \pm\sqrt{1 - x^2}
\]

Substituting into the expression for \(y\):

\[
y = 2x \cdot \sin t = \pm 2x \sqrt{1 - x^2}
\]

This is the equation of a **figure-eight** shaped curve (also known as a **lemniscate**-like shape) lying in the \(xy\)-plane.

### Problem 2

Find the parametric representation for a straight line through \((2,1,3)\) in the direction of \(\mathbf{i}+2\mathbf{j}\).

{{<divider>}}

The general form of a line through point \(\vec{r}_0 = (x_0, y_0, z_0)\) with direction vector \(\vec{v} = \left[a, b, c \right]\) is:

\[
\vec{r}(t) = \vec{r}_0 + t \vec{v}
\]

Applying the values:

- \(\vec{r}_0 = \langle 2, 1, 3 \rangle\)
- \(\vec{v} = \langle 1, 2, 0 \rangle\)

So the parametric representation is:

\[
\vec{r}(t) = \langle 2 + t, \; 1 + 2t, \; 3 \rangle
\]

### Problem 3

Given a curve \(C: \mathbf{r}(t)\), find a tangent vector \(\mathbf{r}'(t)\), a unit tangent vector \(\mathbf{u}'(t)\) and the tangent of \(C\) at \(P\).

\[
  \mathbf{r}(t) = \left[t, \frac{1}{t}, 0\right],\quad P:\,\left(2, \frac{1}{2}, 0\right)
\]

{{<divider>}}

Differentiate each component of \(\vec{r}(t)\):

\[
\vec{r}'(t) = \left[ \frac{d}{dt}(t), \frac{d}{dt}\left(\frac{1}{t}\right), \frac{d}{dt}(0) \right] = \left[ 1, -\frac{1}{t^2}, 0 \right]
\]

\[
|\vec{r}'(t)| = \sqrt{1^2 + \left(-\frac{1}{t^2}\right)^2 + 0^2} = \sqrt{1 + \frac{1}{t^4}}
\]

\[
\vec{u}(t) = \frac{\vec{r}'(t)}{|\vec{r}'(t)|} = \frac{1}{\sqrt{1 + \frac{1}{t^4}}} \cdot \left[ 1, -\frac{1}{t^2}, 0 \right]
\]

We first solve for \(t\) such that:

\[
\vec{r}(t) = \left(t, \frac{1}{t}, 0\right) = \left(2, \frac{1}{2}, 0\right)
\Rightarrow t = 2
\]

Now evaluate \(\vec{r}'(2)\):

\[
\vec{r}'(2) = \left[1, -\frac{1}{4}, 0\right]
\]

So the tangent line at \(P\) is:

\[
\vec{T}(s) = \vec{r}(2) + s \cdot \vec{r}'(2) = \left(2, \frac{1}{2}, 0\right) + s \cdot \left(1, -\frac{1}{4}, 0\right)
\]

### Problem 4

Find the length of the following:

\[
  \mathbf{r}(t) = \left[a\cos{t}, a\sin{t}\right]
\]

from \((a,0)\) to \((0,a)\)

{{<divider>}}

Determine parameter bounds.

We are going from \((a, 0)\) to \((0, a)\):

- At \(t = 0\):

  \[
  \vec{r}(0) = [a\cos(0), a\sin(0)] = [a, 0]
  \]
- At \(t = \frac{\pi}{2}\):

  \[
  \vec{r}\left(\frac{\pi}{2}\right) = [a\cos(\frac{\pi}{2}), a\sin(\frac{\pi}{2})] = [0, a]
  \]

So the interval is \(t \in [0, \frac{\pi}{2}]\)

The arc length of a vector-valued function \(\vec{r}(t)\) from \(t = a\) to \(t = b\) is:

\[
L = \int_a^b \left| \vec{r}'(t) \right| \, dt
\]

Differentiate \(\vec{r}(t)\):

\[
\vec{r}'(t) = [-a\sin t,\; a\cos t]
\]

Magnitude:

\[
|\vec{r}'(t)| = \sqrt{(-a\sin t)^2 + (a\cos t)^2} = \sqrt{a^2 \sin^2 t + a^2 \cos^2 t} = \sqrt{a^2(\sin^2 t + \cos^2 t)} = \sqrt{a^2} = a
\]

\[
L = \int_0^{\frac{\pi}{2}} a \, dt = a \cdot \left[\frac{\pi}{2} - 0\right] = \boxed{a\frac{\pi}{2}}
\]

### Problem 5

Find the tangential and normal acceleration in the following parabola:

\[
  \mathbf{r}(t) = \left[t,t^2,0\right]
\]

{{<divider>}}

We are given the position vector:

\[
\vec{r}(t) = [t,\ t^2,\ 0]
\]

We are to find:

- **Tangential acceleration** \(a_T\)
- **Normal acceleration** \(a_N\)

\[
\vec{v}(t) = \vec{r}'(t) = [1,\ 2t,\ 0]
\]

\[
\vec{a}(t) = \vec{v}'(t) = \vec{r}''(t) = [0,\ 2,\ 0]
\]

Velocity magnitude:

\[
|\vec{v}(t)| = \sqrt{1^2 + (2t)^2} = \sqrt{1 + 4t^2}
\]

- **Tangential acceleration** is the rate of change of speed:

\[
a_T = \frac{d}{dt}|\vec{v}(t)| = \frac{d}{dt} \sqrt{1 + 4t^2} = \frac{1}{2}(1 + 4t^2)^{-1/2} \cdot 8t = \frac{4t}{\sqrt{1 + 4t^2}}
\]

- **Normal acceleration** comes from:

\[
a_N = \sqrt{|\vec{a}|^2 - a_T^2}
\]

First:

\[
|\vec{a}(t)| = \sqrt{0^2 + 2^2 + 0^2} = 2
\]

Then:

\[
a_N = \sqrt{2^2 - \left(\frac{4t}{\sqrt{1 + 4t^2}}\right)^2}
= \sqrt{4 - \frac{16t^2}{1 + 4t^2}}
= \sqrt{\frac{4(1 + 4t^2) - 16t^2}{1 + 4t^2}}
= \sqrt{\frac{4}{1 + 4t^2}}
\]

### Problem 6

Show that a circle of radius \(a\) has curvature \(\frac{1}{a}\).

{{<divider>}}

We are asked to **show that the curvature** \(\kappa\) of a **circle of radius \(a\)** is:

\[
\boxed{\kappa = \frac{1}{a}}
\]

Let’s parameterize the circle of radius \(a\) centered at the origin:

\[
\vec{r}(t) = [a\cos t,\ a\sin t]
\]

\[
\vec{r}'(t) = [-a\sin t,\ a\cos t]
\]

\[
\vec{r}''(t) = [-a\cos t,\ -a\sin t]
\]

The curvature \(\kappa\) for a plane curve is:

\[
\kappa = \frac{|\vec{r}'(t) \times \vec{r}''(t)|}{|\vec{r}'(t)|^3}
\]

First compute the magnitude of \(\vec{r}'(t)\):

\[
|\vec{r}'(t)| = \sqrt{(-a\sin t)^2 + (a\cos t)^2} = \sqrt{a^2(\sin^2 t + \cos^2 t)} = \sqrt{a^2} = a
\]

Now compute the cross product \(\vec{r}'(t) \times \vec{r}''(t)\). Since this is in 2D, treat vectors as 3D by adding 0 as the third component:

\[
\vec{r}'(t) = [-a\sin t, a\cos t, 0],\quad \vec{r}''(t) = [-a\cos t, -a\sin t, 0]
\]

The cross product in 3D is:

\[
\vec{r}'(t) \times \vec{r}''(t) = 
\begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
-a\sin t & a\cos t & 0 \\
-a\cos t & -a\sin t & 0
\end{vmatrix}
= [0, 0, a^2(\sin^2 t + \cos^2 t)] = [0, 0, a^2]
\]

So its magnitude is:

\[
|\vec{r}'(t) \times \vec{r}''(t)| = a^2
\]

Plug into curvature formula:

\[
\kappa = \frac{a^2}{a^3} = \boxed{\frac{1}{a}}
\]
