+++
draft = false
title = '02 -  Path Independence of Line Integrals'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Notes

---

A line integral has **path independence** if the value of the integral depends only on the endpoints of some boundary \(C\) and not on the specific path taken between them.

In a simply connected domain, path independence and exactness imply each other.

---

An exact form is one that comes from the gradient of some function. That is, the form is the total differential of some scalar-valued function.

A **differential 1-form**

\[
\omega = M(x, y)\,dx + N(x, y)\,dy
\]

is said to be **exact** on a domain \(D \subseteq \mathbb{R}^2\) if there exists a **scalar function** \(f(x, y)\) (called a *potential function*) such that:

\[
\omega = df
\quad \text{which means} \quad 
M = \frac{\partial f}{\partial x}, \quad
N = \frac{\partial f}{\partial y}
\]

If \(\omega\) is exact, then:

\[
\int_\gamma \omega = f(\text{end}) - f(\text{start})
\]

That is, the **line integral depends only on the endpoints**, not the path — which is a huge simplification.

---

If the line integral

\[
  \int_{C}\mathbf{F(r)}\cdot d\mathbf{r} = \int_{C} \left(F_1 dx + F_2 dy + F_3 dz\right)
\]

is exact and simply connected then,

\[
  \frac{\partial F_3}{\partial y} = \frac{\partial F_2}{\partial z},\quad \frac{\partial F_1}{\partial z} = \frac{\partial F_3}{\partial x},\quad \frac{\partial F_2}{\partial x} = \frac{\partial F_1}{\partial y}
\]

and thus,

\[
  \text{curl}\,\mathbf{F} = \mathbf{0}
\]

---

Definition of **simply connected**:

A domain \(D\) is called simply connected if every closed curve in \(D\) can be continuously
shrunk to any point in \(D\) without leaving \(D\).

---

## Exercises

### Problem 1

Show that the form under the integral sign is exact in the plane and evaluate the integral.

\[
  \int_{(\pi/2,\pi)}^{(\pi,0)}\left(\frac{1}{2} \cos{\frac{1}{2}x}\,\cos{2y}\,dx - 2\sin{\frac{1}{2}x}\,\sin{2y}\,dy\right)
\]

{{<divider>}}

We are given a differential form:

\[
\omega = M(x, y)\,dx + N(x, y)\,dy
\]

where:

- \(M(x, y) = \frac{1}{2} \cos\left(\tfrac{1}{2}x\right)\cos(2y)\)
- \(N(x, y) = -2 \sin\left(\tfrac{1}{2}x\right)\sin(2y)\)

We check if the form is **exact** by verifying:

\[
\frac{\partial M}{\partial y} = \frac{\partial N}{\partial x}
\]

\[
\frac{\partial M}{\partial y} = \frac{1}{2} \cos\left(\tfrac{1}{2}x\right) \cdot (-2\sin(2y)) = -\cos\left(\tfrac{1}{2}x\right)\sin(2y)
\]

\[
\frac{\partial N}{\partial x} = -2 \cdot \cos\left(\tfrac{1}{2}x\right) \cdot \tfrac{1}{2} \cdot \sin(2y) = -\cos\left(\tfrac{1}{2}x\right)\sin(2y)
\]

So,

\[
\frac{\partial M}{\partial y} = \frac{\partial N}{\partial x}
\Rightarrow \text{Form is exact}
\]

Since the form is exact, there exists a potential function \(f(x, y)\) such that:

\[
df = \omega = M\,dx + N\,dy
\]

Integrate \(M(x, y)\) with respect to \(x\).

Let’s find \(f(x, y)\) such that:

\[
\frac{\partial f}{\partial x} = \frac{1}{2} \cos\left(\tfrac{1}{2}x\right)\cos(2y)
\]

Treating \(y\) as constant:

\[
f(x, y) = \int \frac{1}{2} \cos\left(\tfrac{1}{2}x\right)\cos(2y) \, dx = \cos(2y) \int \frac{1}{2} \cos\left(\tfrac{1}{2}x\right) dx
\]

Let’s integrate:

\[
\int \frac{1}{2} \cos\left(\tfrac{1}{2}x\right) dx = \sin\left(\tfrac{1}{2}x\right)
\]

So,

\[
f(x, y) = \cos(2y) \cdot \sin\left(\tfrac{1}{2}x\right) + C(y)
\]

Now compute \(\frac{\partial f}{\partial y}\) to find \(C(y)\):

\[
\frac{\partial f}{\partial y} = -2\sin(2y)\sin\left(\tfrac{1}{2}x\right) + C'(y)
\]

But from earlier, we also know:

\[
\frac{\partial f}{\partial y} = N(x, y) = -2\sin\left(\tfrac{1}{2}x\right)\sin(2y)
\]

So,

\[
C'(y) = 0 \Rightarrow C(y) = \text{constant}
\]

Thus, the potential function is:

\[
f(x, y) = \cos(2y)\sin\left(\tfrac{1}{2}x\right)
\]

Apply the Fundamental Theorem:

\[
\int_{\gamma} \omega = f(\pi, 0) - f\left(\tfrac{\pi}{2}, \pi\right)
\]

Evaluate:

- \(f(\pi, 0) = \cos(0)\cdot \sin\left(\tfrac{1}{2}\pi\right) = 1 \cdot 1 = 1\)
- \(f\left(\tfrac{\pi}{2}, \pi\right) = \cos(2\pi) \cdot \sin\left(\tfrac{1}{4}\pi\right) = 1 \cdot \frac{\sqrt{2}}{2} = \frac{\sqrt{2}}{2}\)

Final Answer:

\[
\int_{\gamma} \omega = 1 - \frac{\sqrt{2}}{2} = \boxed{1 - \frac{\sqrt{2}}{2}}
\]


### Problem 2

Show that the form under the integral sign is exact in space and evaluate the integral.

\[
  \int_{(0,0,\pi)}^{(2,1/2,\pi/2)} e^{xy}\left(y\sin{z}dx+x\sin{z}dy+\cos{z}dz\right)
\]

{{<divider>}}

First, show the differential form is exact.

Define the differential form:

\[
\omega = e^{xy} \left( y\sin z\, dx + x\sin z\, dy + \cos z\, dz \right)
\]

Let:

- \(F_1(x, y, z) = e^{xy} y \sin z\)
- \(F_2(x, y, z) = e^{xy} x \sin z\)
- \(F_3(x, y, z) = e^{xy} \cos z\)

We want to check whether \(\omega = F_1\,dx + F_2\,dy + F_3\,dz\) is **exact**, i.e., whether there exists a scalar function \(f(x, y, z)\) such that:

\[
\frac{\partial f}{\partial x} = F_1, \quad
\frac{\partial f}{\partial y} = F_2, \quad
\frac{\partial f}{\partial z} = F_3
\]

Check \(\partial F_1 / \partial y = \partial F_2 / \partial x\):

\[
\frac{\partial F_1}{\partial y} 
= \frac{\partial}{\partial y} \left( e^{xy} y \sin z \right) 
= e^{xy} \sin z + x y e^{xy} \sin z 
= e^{xy} \sin z (1 + xy)
\]

\[
\frac{\partial F_2}{\partial x} 
= \frac{\partial}{\partial x} \left( e^{xy} x \sin z \right) 
= e^{xy} \sin z + y x e^{xy} \sin z 
= e^{xy} \sin z (1 + xy)
\]

So they are equal.

Check \(\partial F_1 / \partial z = \partial F_3 / \partial x\):

\[
\frac{\partial F_1}{\partial z} = e^{xy} y \cos z
\quad\text{and}\quad
\frac{\partial F_3}{\partial x} = y e^{xy} \cos z
\]

Equal.

Check \(\partial F_2 / \partial z = \partial F_3 / \partial y\).

\[
\frac{\partial F_2}{\partial z} = e^{xy} x \cos z
\quad\text{and}\quad
\frac{\partial F_3}{\partial y} = x e^{xy} \cos z
\]

Equal.

Therefore, the form is **exact**.

Find potential function \(f(x, y, z)\):

We want a function \(f\) such that:

\[
\frac{\partial f}{\partial x} = e^{xy} y \sin z
\]

Integrate with respect to \(x\) (treat \(y, z\) as constants):

\[
f(x, y, z) = \int e^{xy} y \sin z\, dx = y \sin z \int e^{xy} dx
\]

Let's compute \(\int e^{xy} dx\):

Let \(u = xy \Rightarrow du = y dx \Rightarrow dx = \frac{du}{y}\)

Then:

\[
\int e^{xy} dx = \frac{1}{y} \int e^u du = \frac{1}{y} e^{xy} + C(y, z)
\]

So:

\[
f(x, y, z) = y \sin z \cdot \frac{1}{y} e^{xy} + C(y, z) = e^{xy} \sin z + C(y, z)
\]

Now differentiate to determine \(C(y, z)\):

Use \(\partial f / \partial y = e^{xy} x \sin z = F_2\).

\[
\frac{\partial f}{\partial y} = x e^{xy} \sin z + \frac{\partial C}{\partial y}
\Rightarrow \frac{\partial C}{\partial y} = 0
\Rightarrow C(y, z) = D(z)
\]

Use \(\partial f / \partial z = e^{xy} \cos z = F_3\)

\[
\frac{\partial f}{\partial z} = e^{xy} \cos z + D'(z)
\Rightarrow D'(z) = 0 \Rightarrow D(z) = \text{const}
\]

So we can take the constant to be 0.

Final potential function:

\[
f(x, y, z) = e^{xy} \sin z
\]

Evaluate the integral:

\[
\int_C \omega = f(B) - f(A)
\]

Where:

- \(A = (0, 0, \pi)\)
- \(B = \left( 2, \frac{1}{2}, \frac{\pi}{2} \right)\)

Compute:

- \(f(A) = e^{0} \cdot \sin(\pi) = 1 \cdot 0 = 0\)
- \(f(B) = e^{2 \cdot \frac{1}{2}} \cdot \sin\left( \frac{\pi}{2} \right) = e^1 \cdot 1 = e\)

Final Answer:

\[
\boxed{e}
\]

### Problem 3

Check if the following has path indepedence and if so, integrate from \((0,0,0)\) to \((a,b,c)\):

\[
  2e^{x^2}\left(x\,\cos{2y}\,dx - \sin{2y}\,dy\right)
\]

{{<divider>}}

\[
\omega = 2e^{x^2} \left( x\cos(2y)\, dx - \sin(2y)\, dy \right)
\]

Let’s write this in standard form:

\[
\omega = M(x, y)\, dx + N(x, y)\, dy
\]

where:

- \(M(x, y) = 2x e^{x^2} \cos(2y)\)
- \(N(x, y) = -2 e^{x^2} \sin(2y)\)

Check if the form is **exact** (i.e., has path independence).

A 1-form \(M\,dx + N\,dy\) is exact if:

\[
\frac{\partial M}{\partial y} = \frac{\partial N}{\partial x}
\]

Compute \(\frac{\partial M}{\partial y}\):

\[
\frac{\partial M}{\partial y}
= \frac{\partial}{\partial y} \left( 2x e^{x^2} \cos(2y) \right)
= 2x e^{x^2} \cdot (-2\sin(2y)) = -4x e^{x^2} \sin(2y)
\]

Compute \(\frac{\partial N}{\partial x}\):

\[
\frac{\partial N}{\partial x}
= \frac{\partial}{\partial x} \left( -2 e^{x^2} \sin(2y) \right)
= -2 \cdot \sin(2y) \cdot \frac{d}{dx} e^{x^2}
= -2 \cdot \sin(2y) \cdot 2x e^{x^2}
= -4x e^{x^2} \sin(2y)
\]

So:

\[
\frac{\partial M}{\partial y} = \frac{\partial N}{\partial x}
\quad \Rightarrow \quad \text{Form is exact ⇒ path independent}
\]

Find a potential function \(f(x, y)\).

We want to find \(f(x, y)\) such that:

\[
\frac{\partial f}{\partial x} = M = 2x e^{x^2} \cos(2y)
\]

Integrate with respect to \(x\):

Let’s treat \(y\) as constant and integrate:

\[
f(x, y) = \int 2x e^{x^2} \cos(2y)\, dx
\]

Pull out \(\cos(2y)\) (constant with respect to \(x\)):

\[
= \cos(2y) \int 2x e^{x^2} dx
= \cos(2y) \cdot e^{x^2} + g(y)
\]

So,

\[
f(x, y) = e^{x^2} \cos(2y) + g(y)
\]

Now find \(g(y)\) using \(\frac{\partial f}{\partial y} = N\):

\[
\frac{\partial f}{\partial y}
= -2 e^{x^2} \sin(2y) + g'(y)
\quad \overset{!}{=} \quad -2 e^{x^2} \sin(2y)
\Rightarrow g'(y) = 0 \Rightarrow g(y) = \text{const}
\]

We can take the constant to be 0, so:

\[
f(x, y) = e^{x^2} \cos(2y)
\]

Evaluate the integral.

By the fundamental theorem of line integrals:

\[
\int_{\gamma} \omega = f(a, b) - f(0, 0)
\]

Compute:

- \(f(a, b) = e^{a^2} \cos(2b)\)
- \(f(0, 0) = e^0 \cdot \cos(0) = 1 \cdot 1 = 1\)

So the result is:

\[
\boxed{e^{a^2} \cos(2b) - 1}
\]

