+++
draft = false
title = '01 - Line Integrals'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Exercises

### Problem 1

Calculate \(\int_{C} \mathbf{F}(\mathbf{r}) \cdot d\mathbf{r}\) for the given data. If \(\mathbf{F}\) is a force, this gives the work done by the force in the displacement along \(C\).

\[
  \mathbf{F} = \left[y^2,\,-x^2\right],\; C:\,y = 4x^2\;\text{from (0, 0) to (1, 4)}
\]

{{<divider>}}

\[
  \int_C \mathbf{F}(\mathbf{r}) \cdot d\mathbf{r}
\]

Since \(y = 4x^2\), we can parameterize the path as:

\[
\mathbf{r}(t) = \langle t, 4t^2 \rangle, \quad \text{for } t \in [0, 1]
\]

Then:

\[
\mathbf{r}'(t) = \left\langle \frac{d}{dt}(t), \frac{d}{dt}(4t^2) \right\rangle = \langle 1, 8t \rangle
\]

Express \(\mathbf{F}(\mathbf{r}(t))\)

\[
\mathbf{F}(\mathbf{r}(t)) = \left\langle (4t^2)^2, -(t)^2 \right\rangle = \langle 16t^4, -t^2 \rangle
\]

Compute the dot product \(\mathbf{F}(\mathbf{r}(t)) \cdot \mathbf{r}'(t)\)

\[
\mathbf{F}(\mathbf{r}(t)) \cdot \mathbf{r}'(t) = \langle 16t^4, -t^2 \rangle \cdot \langle 1, 8t \rangle = 16t^4 \cdot 1 + (-t^2)(8t) = 16t^4 - 8t^3
\]

\[
\int_0^1 (16t^4 - 8t^3) \, dt = \int_0^1 16t^4 \, dt - \int_0^1 8t^3 \, dt
\]

\[
= \left[ \frac{16}{5}t^5 \right]_0^1 - \left[ 2t^4 \right]_0^1 = \frac{16}{5} - 2 = \frac{6}{5}
\]

### Problem 2

Calculate \(\int_{C} \mathbf{F}(\mathbf{r}) \cdot d\mathbf{r}\) for the given data. If \(\mathbf{F}\) is a force, this gives the work done by the force in the displacement along \(C\).

\[
  \mathbf{F} = \left[xy,x^2,y^2\right],\; \text{C the quarter-circle from (2,0) to (0,2) with center (0,0)}
\]

{{<divider>}}

Parameterize the path \(C\).

Since the path is a **quarter-circle** of radius 2, from \((2, 0)\) to \((0, 2)\), we can use the standard polar/circular parameterization:

\[
\mathbf{r}(\theta) = \langle 2\cos\theta, 2\sin\theta \rangle \quad \text{for } \theta \in [0, \frac{\pi}{2}]
\]

Compute \(d\mathbf{r}\).

\[
\frac{d\mathbf{r}}{d\theta} = \langle -2\sin\theta, 2\cos\theta \rangle
\]

Express \(\mathbf{F}(\mathbf{r}(\theta))\).

We substitute \(x = 2\cos\theta\), \(y = 2\sin\theta\) into \(\mathbf{F}(x, y)\):

\[
\mathbf{F}(\theta) = \left\langle (2\cos\theta)(2\sin\theta), (2\cos\theta)^2, (2\sin\theta)^2 \right\rangle = \langle 4\sin\theta\cos\theta, 4\cos^2\theta, 4\sin^2\theta \rangle
\]

Compute the dot product \(\mathbf{F} \cdot \frac{d\mathbf{r}}{d\theta}\)

\[
\mathbf{F} \cdot \frac{d\mathbf{r}}{d\theta} = \langle 4\sin\theta\cos\theta, 4\cos^2\theta \rangle \cdot \langle -2\sin\theta, 2\cos\theta \rangle
\]

Wait — we actually have a **3D vector field** and a **2D path** — so one of the vector components is **not** along the path. This seems like a mismatch unless we're considering motion in 3D, but from the path description, this is a **2D curve** in the \(xy\)-plane.

That suggests the correct **vector field** is:

\[
\mathbf{F}(x, y) = \langle xy, x^2 \rangle
\]

(i.e. a **2D vector field**, most likely a typo in the problem statement — otherwise the path is ill-defined in 3D.)

Assuming this, let's proceed using:

\[
\mathbf{F}(x, y) = \langle xy, x^2 \rangle
\]

Then:

\[
\mathbf{F}(\theta) = \langle (2\cos\theta)(2\sin\theta), (2\cos\theta)^2 \rangle = \langle 4\sin\theta\cos\theta, 4\cos^2\theta \rangle
\]

Now compute the dot product:

\[
\mathbf{F} \cdot \frac{d\mathbf{r}}{d\theta} = \langle 4\sin\theta\cos\theta, 4\cos^2\theta \rangle \cdot \langle -2\sin\theta, 2\cos\theta \rangle
\]

\[
= 4\sin\theta\cos\theta(-2\sin\theta) + 4\cos^2\theta(2\cos\theta) = -8\sin^2\theta\cos\theta + 8\cos^3\theta
\]

Integrate from \(\theta = 0\) to \(\theta = \frac{\pi}{2}\).

\[
\int_0^{\frac{\pi}{2}} \left(-8\sin^2\theta\cos\theta + 8\cos^3\theta \right) d\theta
= 8\int_0^{\frac{\pi}{2}} \left(\cos^3\theta - \sin^2\theta\cos\theta\right) d\theta
\]

We can integrate term by term.

First Term: \(\int_0^{\frac{\pi}{2}} \cos^3\theta \, d\theta\)

Use the identity:

\[
\cos^3\theta = \cos\theta (1 - \sin^2\theta)
\]

Let \(u = \sin\theta\), \(du = \cos\theta \, d\theta\), then bounds: \(u = 0 \to 1\)

\[
\int_0^{\frac{\pi}{2}} \cos^3\theta \, d\theta = \int_0^1 (1 - u^2) \, du = \left[u - \frac{u^3}{3}\right]_0^1 = 1 - \frac{1}{3} = \frac{2}{3}
\]

Second Term: \(\int_0^{\frac{\pi}{2}} \sin^2\theta\cos\theta \, d\theta\)

Let \(u = \sin\theta\), \(du = \cos\theta \, d\theta\), bounds: \(u = 0 \to 1\)

\[
\int_0^{\frac{\pi}{2}} \sin^2\theta\cos\theta \, d\theta = \int_0^1 u^2 \, du = \left[\frac{u^3}{3}\right]_0^1 = \frac{1}{3}
\]

Final Answer:

\[
8\left( \frac{2}{3} - \frac{1}{3} \right) = 8 \cdot \frac{1}{3} = \boxed{\frac{8}{3}}
\]

### Problem 3

Calculate \(\int_{C} \mathbf{F}(\mathbf{r}) \cdot d\mathbf{r}\) for the given data. If \(\mathbf{F}\) is a force, this gives the work done by the force in the displacement along \(C\).

\[
  \mathbf{F} = \left[x+y, y+z, z+x\right],\quad C:\,\mathbf{r}=\left[2t,5t,t\right]\,\text{from t = 0 to 1 and from t = -1 to 1}
\]

{{<divider>}}

Compute \(\mathbf{F}(\mathbf{r}(t))\).

Given \(x = 2t,\ y = 5t,\ z = t\), plug into \(\mathbf{F}\):

\[
\mathbf{F}(t) = \langle x + y,\ y + z,\ z + x \rangle = \langle 2t + 5t,\ 5t + t,\ t + 2t \rangle = \langle 7t,\ 6t,\ 3t \rangle
\]


Compute \(\frac{d\mathbf{r}}{dt}\).

\[
\mathbf{r}'(t) = \frac{d}{dt} \langle 2t, 5t, t \rangle = \langle 2, 5, 1 \rangle
\]


Compute dot product \(\mathbf{F}(t) \cdot \mathbf{r}'(t)\).

\[
\langle 7t, 6t, 3t \rangle \cdot \langle 2, 5, 1 \rangle = 7t \cdot 2 + 6t \cdot 5 + 3t \cdot 1 = 14t + 30t + 3t = 47t
\]

Integrate from 0 to 1.

\[
\int_0^1 47t\, dt = \left[\frac{47}{2}t^2\right]_0^1 = \frac{47}{2}
\]

Use the same expression \(\mathbf{F}(t) \cdot \mathbf{r}'(t) = 47t\).

Now integrate:

\[
\int_{-1}^1 47t \, dt = 47 \int_{-1}^1 t\, dt = 47 \cdot 0 = 0
\]

(Since \(t\) is an odd function over a symmetric interval)

Final Answers:

- From \(t = 0\) to \(t = 1\): \(\boxed{\frac{47}{2}}\)
- From \(t = -1\) to \(t = 1\): \(\boxed{0}\)

### Problem 4

Evaluate the line integral where

\[
  f = xyz,\quad C:\mathbf{r}=\left[4t,3t^2,12t\right],\quad -2 \leq t \leq 2
\]

{{<divider>}}

\[
  f = (4t)(3t^2)(12t) = 144t^4
\]

\[
  \int_{-2}^{2} 144t^4 = \left[\frac{144}{5}t^5\right]_{-2}^{2} = \frac{144}{5} \left(2^5-(-2)^5\right) = \frac{144}{5}(64) = 1843.2
\]
