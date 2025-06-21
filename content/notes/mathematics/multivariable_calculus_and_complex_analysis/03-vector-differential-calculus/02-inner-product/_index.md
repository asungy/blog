+++
draft = false
title = '02 - Inner Product (Dot Product)'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

> 9.2 – 7, 13, 21, 27, 33, 39   

## Exercises

### Problem 1

Let \(\mathbf{a} = \left[1,-3,5\right]\), \(\mathbf{b} = \left[4,0,8\right]\), \(\mathbf{c} = \left[-2, 9, 1\right]\)

Find

\[
  |\mathbf{a}\cdot\mathbf{c}|,\quad |\mathbf{a}||\mathbf{c}|
\]

{{<divider>}}

Computing \(\mathbf{a} \cdot \mathbf{c}\):

\[\begin{aligned}
\mathbf{a} \cdot \mathbf{c} &= (1)(-2) + (-3)(9) + (5)(1)\\
&= -2 - 27 + 5\\
&= -24\\
\end{aligned}\]

Then,

\[
|\mathbf{a} \cdot \mathbf{c}| = |-24| = 24
\]

Computing \(|\mathbf{a}| |\mathbf{c}|\):

- Magnitude \(|\mathbf{a}|\):
\[
|\mathbf{a}| = \sqrt{1^2 + (-3)^2 + 5^2} 
= \sqrt{1 + 9 + 25} 
= \sqrt{35}
\]

- Magnitude \(|\mathbf{c}|\):
\[
|\mathbf{c}| = \sqrt{(-2)^2 + 9^2 + 1^2}
= \sqrt{4 + 81 + 1}
= \sqrt{86}
\]

Thus,

\[
  |\mathbf{a}| |\mathbf{c}| = \sqrt{35} \cdot \sqrt{86} = \sqrt{3010}
\]

### Problem 2

Prove the Cauchy–Schwarz inequality.

{{<divider>}}

> Due to limited time, I got an LLM to do this proof. I need to go back and actually work through it.

The **Cauchy–Schwarz inequality** states that for any two vectors \(\mathbf{u}, \mathbf{v}\) in an inner product space, we have:

\[
|\mathbf{u} \cdot \mathbf{v}| \leq |\mathbf{u}|\,|\mathbf{v}|
\]

Let’s start with the inner product definition for two vectors \(\mathbf{u}\) and \(\mathbf{v}\):

Consider any real scalar \(t\) and define a vector as follows:

\[
\mathbf{w} = \mathbf{u} - t\mathbf{v}
\]

We observe that the squared magnitude of \(\mathbf{w}\) is always non-negative:

\[
|\mathbf{w}|^2 \geq 0
\]

Expanding this, we get:

\[
(\mathbf{u} - t\mathbf{v}) \cdot (\mathbf{u} - t\mathbf{v}) \geq 0
\]

Simplify further:

\[
|\mathbf{u}|^2 - 2t(\mathbf{u} \cdot \mathbf{v}) + t^2|\mathbf{v}|^2 \geq 0
\]

Consider this as a quadratic function in \(t\):

Define the function:

\[
f(t) = |\mathbf{v}|^2 t^2 - 2(\mathbf{u}\cdot\mathbf{v})t + |\mathbf{u}|^2
\]

Since we established \(f(t)\) is always non-negative, its discriminant must be \(\leq 0\).

Analyze the discriminant condition.

The discriminant of this quadratic (with respect to \(t\)) must satisfy:

\[
(-2(\mathbf{u}\cdot\mathbf{v}))^2 - 4|\mathbf{v}|^2|\mathbf{u}|^2 \leq 0
\]

Simplify:

\[
4(\mathbf{u}\cdot\mathbf{v})^2 - 4|\mathbf{v}|^2|\mathbf{u}|^2 \leq 0
\]

Divide by 4:

\[
(\mathbf{u}\cdot\mathbf{v})^2 \leq |\mathbf{u}|^2|\mathbf{v}|^2
\]

Taking square roots (non-negative magnitudes):

\[
|\mathbf{u}\cdot\mathbf{v}| \leq |\mathbf{u}||\mathbf{v}|
\]

### Problem 3

Find the work done by a force \(\mathbf{p}\) acting on a body if the body is displaced along the straight segment \(\overline{AB}\) from \(A\) to \(B\).

\[
  \mathbf{p} = \left[0,4,3\right],\quad A:\,\left(0,0,0\right),\quad B:\,\left(1,3,0\right)
\]

{{<divider>}}

Find the displacement vector \(\overrightarrow{AB}\):

\[
\overrightarrow{AB} = B - A = [1-0,\,3-0,\,0-0] = [1,3,0]
\]

Work (\(W\)) done by a force (\(\mathbf{p}\)) is given by the dot product of the force and displacement vectors:

\[
W = \mathbf{p}\cdot \overrightarrow{AB}
\]

Compute the dot product:

\[
W = [0,4,3]\cdot[1,3,0] = (0)(1)+(4)(3)+(3)(0)
= 0+12+0
= 12
\]

### Problem 4

Prove that:

\[
  \cos(\alpha - \beta) = \cos\alpha \cos\beta + \sin\alpha \sin\beta
\]

with

\[
  \mathbf{a} = [\cos\alpha,\sin\alpha], \quad \mathbf{b} = [\cos\beta,\sin\beta],\qquad 0 \leq \alpha \leq \beta \leq 2\pi
\]

{{<divider>}}

Define vectors using given angles:

\[
\mathbf{a} = [\cos\alpha,\sin\alpha], \quad \mathbf{b} = [\cos\beta,\sin\beta]
\]

Both vectors have magnitude equal to 1:

\[
|\mathbf{a}| = |\mathbf{b}| = 1
\]

The angle between vectors \(\mathbf{a}\) and \(\mathbf{b}\) is \(\alpha - \beta\). Thus, by definition of the dot product, we have:

\[
\mathbf{a}\cdot\mathbf{b} = |\mathbf{a}||\mathbf{b}|\cos(\alpha - \beta)
\]

Since \(|\mathbf{a}|=|\mathbf{b}|=1\), this reduces to:

\[
\mathbf{a}\cdot\mathbf{b} = \cos(\alpha - \beta)
\]

Explicitly compute the dot product:

\[
\mathbf{a}\cdot\mathbf{b} = [\cos\alpha,\sin\alpha]\cdot[\cos\beta,\sin\beta] = \cos\alpha\cos\beta + \sin\alpha\sin\beta
\]

Thus, combining both results we obtain:

\[
\cos(\alpha - \beta) = \cos\alpha\cos\beta + \sin\alpha\sin\beta
\]

### Problem 5

Find all unit vectors \(\mathbf{a} = \left[a_1, a_2\right]\) in the plane orthogonal to \(\left[4,3\right]\).

{{<divider>}}

We want unit vectors orthogonal to the vector \([4,3]\).

We have a vector \(\mathbf{a} = [a_1, a_2]\) orthogonal to \([4,3]\). Thus, their dot product is zero:

\[
[4,3]\cdot[a_1,a_2] = 4a_1 + 3a_2 = 0
\]

Solve for \(a_2\):

\[
3a_2 = -4a_1 \quad\Rightarrow\quad a_2 = -\frac{4}{3}a_1
\]

Thus, vectors orthogonal to \([4,3]\) have the form:

\[
\mathbf{a} = \left[a_1,\; -\frac{4}{3}a_1\right]
\]

Normalize to obtain unit vectors.

We require unit vectors, so magnitude must equal 1:

\[
|\mathbf{a}| = \sqrt{a_1^2 + \left(-\frac{4}{3}a_1\right)^2} = 1
\]

Solve for \(a_1\):

\[
\sqrt{a_1^2 + \frac{16}{9}a_1^2} = 1
\]

Simplify inside the square root:

\[
\sqrt{\frac{9a_1^2 + 16a_1^2}{9}} = 1 \quad\Rightarrow\quad \sqrt{\frac{25a_1^2}{9}} = 1
\]

Simplify further:

\[
\frac{5|a_1|}{3} = 1 \quad\Rightarrow\quad |a_1| = \frac{3}{5}
\]

Thus, \(a_1 = \pm \frac{3}{5}\).

Therefore, the two possible unit vectors are:

\[
\mathbf{a} = \left[\frac{3}{5}, -\frac{4}{5}\right] \quad\text{and}\quad \mathbf{a} = \left[-\frac{3}{5}, \frac{4}{5}\right]
\]

### Problem 6

When will the component (the projection) of \(\mathbf{a}\) in the direction of \(\mathbf{b}\) be equal to the component (the projection) of \(\mathbf{b}\) in the direction of \(\mathbf{a}\)?

{{<divider>}}

The **scalar projection** of \(\mathbf{a}\) in the direction of \(\mathbf{b}\) is:

\[
\text{comp}_{\mathbf{b}} \mathbf{a} = \frac{\mathbf{a} \cdot \mathbf{b}}{|\mathbf{b}|}
\]

The **scalar projection** of \(\mathbf{b}\) in the direction of \(\mathbf{a}\) is:

\[
\text{comp}_{\mathbf{a}} \mathbf{b} = \frac{\mathbf{a} \cdot \mathbf{b}}{|\mathbf{a}|}
\]

Set the two projections equal.

\[
\frac{\mathbf{a} \cdot \mathbf{b}}{|\mathbf{b}|} = \frac{\mathbf{a} \cdot \mathbf{b}}{|\mathbf{a}|}
\]

Assuming \(\mathbf{a} \cdot \mathbf{b} \ne 0\), we can divide both sides by \(\mathbf{a} \cdot \mathbf{b}\):

\[
\frac{1}{|\mathbf{b}|} = \frac{1}{|\mathbf{a}|}
\quad \Rightarrow \quad |\mathbf{a}| = |\mathbf{b}|
\]

The projections are equal if and only if the vectors \(\mathbf{a}\) and \(\mathbf{b}\) have the same magnitude.
