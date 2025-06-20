+++
title = "Understanding How Planimeters Work"
# Run the following command to generate the current date: `date -u +"%Y-%m-%dT%H:%M:%SZ"`
date = "2025-06-20T17:50:28Z"
description = "Trying to understand the math behind planimeters."
showFullContent = false
readingTime = true
hideComments = false
ToC = false
math = true

[build]
list = 'never'
render = 'never'
+++

I was reading [this post](https://people.math.harvard.edu/~knill/teaching/math21a2000/planimeter/index.html) on planimeters and need to work out some of the math for myself.

So a planimeter is a tool that measures the area of some arbitrary shape on a 2D plane by _just tracing around the shape_. Even after learning a bit about why this works, this still feels like magic to me. And the source of the magic comes from an idea known as [Green's Theorem](https://en.wikipedia.org/wiki/Green's_theorem), which states:

\[
  \oint_C (P \, dx + Q \, dy) = \iint_R \left( \frac{\partial Q}{\partial x} - \frac{\partial P}{\partial y} \right) dA
\]

This is basically saying that the summation of infinitesimally small vectors around the perimeter of a region equals the summations of all of the inner curls in the region multiplied by some infinitesimal area. It turns out this is so because all of the inner curls cancel out each other, leaving only the vectors of the curl on the outer perimeter of the region.

While a cool idea, this appears about as useful as saying an apple equals an apple-shaped thing that tastes like an apple.

What makes this theorem really useful is that if we some how use a vector \(v\) whose curl \(\nabla \times \mathbf{v} = 1\). Then, we are able to find the area inside of a region just by calculating the line integral around the region. And this is exactly how planimeters work (they can even do this mechanically)!

---

A planimeter consist of an anchor (at the origin), a pivot that connect two arms of equal length (at \((a,b)\)), and a wheel (at \((x,y)\)).

{{<image src="./planimeter-graph.png" width="40%" height="40%">}}

Let \(F(x,y) = (P(x,y), Q(x,y))\) be a vector field where
\(\mathbf{v} \in F\) is a unit vector that is orthogonal to the arm \(((x-a), (y-b))\) at \((x,y)\).

Note, that we can get an orthogonal vector at \((x,y)\) by applying a rotational transformation.

\[
 \mathbf{r}^\perp = \begin{bmatrix} 0 & -1 \\ 1 & 0 \end{bmatrix}
\begin{bmatrix} x - a(x,y) \\ y - b(x,y) \end{bmatrix} =
\begin{bmatrix} -(y - b(x,y)) \\ x - a(x,y) \end{bmatrix}
\]

If we normalize this, we get:

\[
  F(x,y) = (P(x,y), Q(x,y)) = \left(\frac{-(y - b(x,y))}{\|\mathbf{r}\|}, \frac{x - a(x,y)}{\|\mathbf{r}\|}\right)
\]

Referring back to Green's Theorem, we want to find \(\left(\frac{\partial Q}{\partial x} - \frac{\partial P}{\partial y} \right)\) which is also \(\text{curl }\mathbf{F}\). We want to do this because we want to see if we can somehow get \(\text{curl }\mathbf{F} = 1\), so that we can just find the line integral to calculate the area of a region.

So,

\[\begin{aligned}
  \text{curl }\mathbf{F} &= \frac{\partial Q}{\partial x} - \frac{\partial P}{\partial y}\\
  &= \frac{\partial}{\partial x} \cdot \frac{x - a(x,y)}{\|\mathbf{r}\|} - \frac{\partial}{\partial y}\cdot\frac{-(y - b(x,y))}{\|\mathbf{r}\|} \\
  &= \frac{1-\frac{\partial a}{\partial x}}{\|\mathbf{r}\|} - \frac{-1+\frac{\partial b}{\partial y}}{\|\mathbf{r}\|} \\
  &= \frac{2-\frac{\partial a}{\partial x}+\frac{\partial b}{\partial y}}{\|\mathbf{r}\|}
\end{aligned}\]

This leaves us with \(\frac{\partial a}{\partial x}\) and \(\frac{\partial b}{\partial y}\), so we need to solve for \(a\) and \(b\) in terms of \(x\) and \(y\) and differentiate them appropriately. The two equations we have to work with are:

\[(x-a(x,y))^2 + (y-b(x,y))^2 = r^2\]
\[a^2 + b^2 = r^2\]

The former describes the arm between the \((x,y)\) and \((a,b)\) and the latter describes the arm between the origin and \((a,b)\).

Let's expand the first equation:
> For brevity, I'm going to let \(a(x,y)=a\) and \(b(x,y)=b\).

\[\begin{aligned}
  (x-a)^2+(y-b)^2 = r^2\\
  x^2-2ax+a^2+y^2-2by+b^2 = r^2\\
  x^2-2ax+y^2-2by+(a^2+b^2) = r^2
\end{aligned}\]

Remember \(a^2 + b^2 = r^2\), so:

\[
  x^2-2ax+y^2-2by = 0
\]

Let's use the second equation and solve for \(a\) and \(b\):

\[\begin{aligned}
  a = \sqrt{r^2-b^2}\\
  b = \sqrt{r^2-a^2}\\
\end{aligned}\]

If we plug \(a\) and \(b\) into \(x^2-2ax+y^2-2by = 0\), we get:

\[\begin{aligned}
  x^2-2ax+y^2-2y\sqrt{r^2-a^2} = 0\\
  x^2-2x\sqrt{r^2-b^2}+y^2-2by = 0
\end{aligned}\]

> And I have no eff-ing idea what to do from here...
