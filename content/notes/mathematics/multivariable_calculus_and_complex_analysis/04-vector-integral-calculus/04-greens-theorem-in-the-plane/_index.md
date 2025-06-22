+++
draft = false
title = "04 - Green's Theorem in the Plane"
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Exercises

### Problem 1

Evaluate \(\int_{C}\mathbf{F(r)}\cdot d\mathbf{r}\) counter-clockwise around the boundary \(C\) of the region \(R\) by Green's theorem, where

\[
  \mathbf{F} = \left[x^{2}e^{y},y^{2}e^{x}\right]
\]

where \(R\) is a rectangle with vertices \((0,0)\), \((2,0)\), \((2,3)\), and \((0,3)\).

{{<divider>}}

We are given:

- Vector field:
  \[
  \mathbf{F}(x, y) = \left[ x^2 e^y,\; y^2 e^x \right]
  \]

- Region \(R\) is a rectangle with vertices:
  \[
  (0,0),\; (2,0),\; (2,3),\; (0,3)
  \]

We are to evaluate the line integral around the **boundary \(C\)** of \(R\) counter-clockwise using **Green’s Theorem**.


According to Green's Theorem:

\[
\oint_C \mathbf{F} \cdot d\mathbf{r} = \iint_R \left( \frac{\partial F_2}{\partial x} - \frac{\partial F_1}{\partial y} \right) dA
\]

Let:
- \(F_1 = x^2 e^y\)
- \(F_2 = y^2 e^x\)

Compute the partial derivatives:

\[
\frac{\partial F_2}{\partial x} = \frac{\partial}{\partial x}(y^2 e^x) = y^2 e^x
\]

\[
\frac{\partial F_1}{\partial y} = \frac{\partial}{\partial y}(x^2 e^y) = x^2 e^y
\]

So the integrand becomes:

\[
\frac{\partial F_2}{\partial x} - \frac{\partial F_1}{\partial y}
= y^2 e^x - x^2 e^y
\]

Set up the double integral over the rectangle:

Rectangle bounds:
- \(x \in [0, 2]\)
- \(y \in [0, 3]\)

\[
\iint_R (y^2 e^x - x^2 e^y)\, dA
= \int_0^2 \int_0^3 (y^2 e^x - x^2 e^y) \, dy\, dx
\]

Evaluate the inner integral:

Break it up:

\[
\int_0^3 (y^2 e^x - x^2 e^y) \, dy
= e^x \int_0^3 y^2 \, dy - x^2 \int_0^3 e^y \, dy
= e^x \cdot \left[ \frac{y^3}{3} \right]_0^3 - x^2 \cdot \left[ e^y \right]_0^3
= e^x \cdot \frac{27}{3} - x^2 (e^3 - 1)
= 9e^x - x^2 (e^3 - 1)
\]

Now integrate this w.r.t. \(x\):

\[
\int_0^2 \left( 9e^x - x^2 (e^3 - 1) \right)\, dx
= 9 \int_0^2 e^x\, dx - (e^3 - 1) \int_0^2 x^2\, dx
\]

Evaluate both:

- \(\int_0^2 e^x\, dx = e^2 - 1\)
- \(\int_0^2 x^2\, dx = \left[ \frac{x^3}{3} \right]_0^2 = \frac{8}{3}\)

So:

\[
= 9(e^2 - 1) - (e^3 - 1)\cdot \frac{8}{3}
\]

Final Answer:

\[
\boxed{9(e^2 - 1) - \frac{8}{3}(e^3 - 1)}
\]

### Problem 2

Evaluate \(\int_{C}\mathbf{F(r)}\cdot d\mathbf{r}\) counter-clockwise around the boundary \(C\) of the region \(R\) by Green's theorem, where

\[
  \mathbf{F} = \left[e^{y/x}, e^{y}\ln{x}+2x\right],\quad R:\, 1 + x^4 \leq y \leq 2
\]

{{<divider>}}

We are given:

- Vector field:
  \[
  \mathbf{F}(x, y) = \left[ e^{y/x},\; e^y \ln x + 2x \right]
  \]

- Region:

  \[
  R = \left\{ (x, y) \in \mathbb{R}^2 \;\middle|\; 1 + x^4 \le y \le 2 \right\}
  \]

We are to compute:

\[
\oint_C \mathbf{F} \cdot d\mathbf{r}
\]

**counterclockwise** around the boundary \(C\) of region \(R\), using **Green’s Theorem**.

Green's theorem:

\[
\oint_C \mathbf{F} \cdot d\mathbf{r} = \iint_R \left( \frac{\partial F_2}{\partial x} - \frac{\partial F_1}{\partial y} \right) dA
\]

Let:

- \(F_1 = e^{y/x}\)
- \(F_2 = e^y \ln x + 2x\)

\[
\frac{\partial F_2}{\partial x} = \frac{\partial}{\partial x} \left( e^y \ln x + 2x \right)
= e^y \cdot \frac{1}{x} + 2
\]

\[
\frac{\partial F_1}{\partial y} = \frac{\partial}{\partial y} \left( e^{y/x} \right)
= \frac{1}{x} e^{y/x}
\]

\[
\frac{\partial F_2}{\partial x} - \frac{\partial F_1}{\partial y}
= \left( \frac{e^y}{x} + 2 \right) - \left( \frac{1}{x} e^{y/x} \right)
= \frac{1}{x} \left( e^y - e^{y/x} \right) + 2
\]

We are integrating over the region:

\[
R = \left\{ (x, y) \;\middle|\; x \in [-1, 1],\; y \in [1 + x^4, 2] \right\}
\]

Because the region is bounded between two curves in \(y\), for each \(x \in [-1, 1]\), we integrate \(y\) from \(1 + x^4\) up to 2.

So:

\[
\iint_R \left( \frac{1}{x}(e^y - e^{y/x}) + 2 \right) dy\,dx
\]

\[
\int_{x = -1}^{1} \int_{y = 1 + x^4}^{2} \left( \frac{1}{x}(e^y - e^{y/x}) + 2 \right) dy\, dx
\]

Split the integral:

\[
= \int_{-1}^1 \int_{1 + x^4}^{2} \left( \frac{1}{x}(e^y - e^{y/x}) \right) dy\, dx + \int_{-1}^1 \int_{1 + x^4}^{2} 2\, dy\, dx
\]

> Not sure how to evaluate the double integral of \(\left( \frac{1}{x}(e^y - e^{y/x}) \right)\).

### Problem 3

Using

\[
  \int_{R}\int \nabla^2\,w\,dx\,dy = \oint_{C} \frac{\partial w}{\partial n} ds
\]

find the value of \(\oint_{C} \frac{\partial w}{\partial n} ds\) taken counter-clockwise over the boundary \(C\) of the region \(R\).

\[
  w = x^3 - y^3,\quad 0 \leq y \leq x^2,\quad |x| \leq 2
\]

{{<divider>}}


We are given:

- A function \(w(x, y) = x^3 - y^3\)
- A region \(R\) defined by:
  \[
  R = \left\{ (x, y) \;\middle|\; |x| \le 2,\; 0 \le y \le x^2 \right\}
  \]

- The identity:
  \[
  \iint_R \nabla^2 w\, dx\,dy = \oint_C \frac{\partial w}{\partial n} \, ds
  \]

Our task is to compute \(\displaystyle \oint_C \frac{\partial w}{\partial n} \, ds\), the **normal derivative of \(w\)** integrated over the boundary \(C\), taken **counterclockwise**.

We are told:

\[
\oint_C \frac{\partial w}{\partial n} \, ds = \iint_R \nabla^2 w \, dx\,dy
\]

So all we need to do is:

1. Compute \(\nabla^2 w\)
2. Integrate it over the region \(R\)

Compute the Laplacian \(\nabla^2 w\)

Recall:

\[
\nabla^2 w = \frac{\partial^2 w}{\partial x^2} + \frac{\partial^2 w}{\partial y^2}
\]

Given: \(w = x^3 - y^3\)

So:

- \(\frac{\partial^2 w}{\partial x^2} = \frac{d^2}{dx^2}(x^3) = 6x\)
- \(\frac{\partial^2 w}{\partial y^2} = \frac{d^2}{dy^2}(-y^3) = -6y\)

Thus:

\[
\nabla^2 w = 6x - 6y = 6(x - y)
\]

We now compute:

\[
\iint_R 6(x - y)\, dx\,dy
\]

Region \(R\): bounded between \(y = 0\) and \(y = x^2\), for \(x \in [-2, 2]\)

So the limits are:

- \(x \in [-2, 2]\)
- \(y \in [0, x^2]\)

So:

\[
\int_{x = -2}^{2} \int_{y = 0}^{x^2} 6(x - y)\, dy\, dx
\]

Inner integral (with respect to \(y\)):

\[
\int_0^{x^2} 6(x - y)\, dy = 6 \int_0^{x^2} (x - y)\, dy
= 6 \left[ xy - \frac{1}{2} y^2 \right]_0^{x^2}
= 6 \left( x \cdot x^2 - \frac{1}{2} x^4 \right)
= 6 \left( x^3 - \frac{1}{2}x^4 \right)
\]

Now integrate over \(x \in [-2, 2]\):

\[
\int_{-2}^{2} 6 \left( x^3 - \frac{1}{2}x^4 \right)\, dx
= 6 \int_{-2}^{2} x^3 \, dx - 3 \int_{-2}^{2} x^4 \, dx
\]

Break it up:

- \(\int_{-2}^{2} x^3 \, dx = 0\) (odd function over symmetric interval)
- \(\int_{-2}^{2} x^4 \, dx = 2 \int_0^2 x^4 \, dx = 2 \cdot \frac{x^5}{5}\Big|_0^2 = 2 \cdot \frac{32}{5} = \frac{64}{5}\)

So:

\[
\text{Total} = 6 \cdot 0 - 3 \cdot \frac{64}{5} = -\frac{192}{5}
\]

Final Answer:

\[
\boxed{ -\frac{192}{5} }
\]

