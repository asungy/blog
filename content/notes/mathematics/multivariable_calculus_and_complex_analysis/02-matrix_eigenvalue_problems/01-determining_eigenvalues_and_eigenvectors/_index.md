+++
draft = false
title = '01 - Determining Eigenvalues and Eigenvectors'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Notes

### The Rational Root Theorem

While not explicitly covered in this subject, there are situations where we need to find the roots to a polynomial with more than 2 degrees. The _Rational Root Theorem_ is a tool used in algebra to help find possible rational roots of a polynomial _with integer coefficients_.

#### Theorem

The Rational Root Theorem states:


{{<divider width="90%">}}
If a polynomial
 
 \[
  P(x) = a_{n}x^n + a_{n-1}x^{n-1}+ \cdots + a_{1}x + a_{0}
\]
has a rational root \(\frac{p}{q}\) in lowest terms, then:
- \(p\) is a factor of the constant term \(a_0\) (the last term)
- \(q\) is a factor of the leading coefficient \(a_n\) (the first term)

{{<divider width="90%">}}

#### Example

Suppose you have this polynomial:

\[
  P(x) = 2x^3 -3x^2 - 8x + 3
\]

- The constant term \(a_0 = 3\), so the factors are \(\pm 1, \pm 3\).
- The leading coefficient \(a_n = 2\), so the factors are \(\pm 1, \pm 2\).

So the possible roots are:
\[
  \pm 1,\: \pm 3,\: \pm\frac{1}{2},\: \pm\frac{3}{2}
\]

You would then try to plug these in and see which ones (if any) are actual roots.

### Cramer's rule and finding eigenvalues

[Cramer's rule](https://en.wikipedia.org/wiki/Cramer%27s_rule) solves a linear system of the form:

\[
  \mathbf{A}\mathbf{x} = \mathbf{b}
\]

given by

\[
  x_i = \frac{\text{det}(\mathbf{A_i})}{\text{det}(\mathbf{A})}
\]

But notice this only works if \(\text{det}(\mathbf{A}) \neq \mathbf{0}\). Now consider a homogeneous system:

\[
  \mathbf{A}\mathbf{x} = \mathbf{0}
\]

If \(\text{det}(\mathbf{A}) \neq 0\), then only the trivial solution exists because by Cramer's rule, we are replacing every \(i^{\text{th}}\) column with a zero vector (which is the column vector \(\mathbf{b}\) for homogeneous systems).

However, if \(\text{det}(\mathbf{A}) = 0\), then we _might_ have infinitely many solutions **in which a non-trivial solution exists**. In conclusion, if \(\text{det}(\mathbf{A})=0\), Cramer's rule fails and that's when non-trivial solutions become possible in homogeneous systems.

## Exercises

### Problem 1

Find the eigenvalues and corresponding eigenvectors for the following matrix:

\[\begin{bmatrix}
  5 & -2 \\
  9 & -6 \\
\end{bmatrix}\]

{{<divider>}}

When solving for eigenvalue problem, we want to find values for \(\lambda\) that satisfy the following equation:

\[
\mathbf{A}\mathbf{x} = \lambda\mathbf{x}
\]

This can be alternatively written as:

\[\begin{aligned}
\mathbf{A}\mathbf{x} - \lambda\mathbf{x} =
\mathbf{A}\mathbf{x} - \lambda\mathbf{I}\mathbf{x} &= \\
(\mathbf{A}-\lambda\mathbf{I})\mathbf{x} &= \mathbf{0}
\end{aligned}\]

We want to find the case where \(\text{det}(\mathbf{A} - \lambda\mathbf{I}) = 0\), so we solve for \(\lambda\) such that that is the case:

\[\begin{aligned}
  \text{det}(\mathbf{A} - \lambda\mathbf{I}) &=
  \begin{vmatrix}
  5-\lambda & -2 \\
  9         & -6-\lambda
  \end{vmatrix} \\
  &= (5-\lambda)(-6-\lambda) + 9 \cdot 2 \\
  &= -30+6\lambda-5\lambda+\lambda^2+18 \\
  &= \lambda^2+\lambda-12 \\
  &= (\lambda+4)(\lambda-3)
\end{aligned}\]

If we set \((\lambda+4)(\lambda-3) = 0\), we get \(\lambda=\{-4,3\}\). These are _eigenvalues_ to our original matrix.

Now we need to find the corresponding _eigenvectors_ to these eigenvalues.

From \((\mathbf{A}-\lambda\mathbf{I})\mathbf{x}=\mathbf{0}\), we get the following system:

\[
  \left(\begin{bmatrix}
    5 & -2 \\
    9 & -6 \\
  \end{bmatrix} - \lambda
  \begin{bmatrix}
    1 & 0 \\
    0 & 1 \\
  \end{bmatrix}\right)
  \begin{bmatrix}
    x_1 \\
    x_2
  \end{bmatrix} = \mathbf{0}
\]
\[
  \begin{bmatrix}
    5-\lambda & -2 \\
    9         & -6-\lambda
  \end{bmatrix}
  \begin{bmatrix}
    x_1 \\
    x_2
  \end{bmatrix} = \mathbf{0}
\]

Now we can substitute our eigenvalues and get the corresponding eigenvectors.

Let's start with \(\lambda = -4\):

\[
  \begin{bmatrix}
    9 & -2 \\
    9 & -2
  \end{bmatrix}
  \begin{bmatrix}
    x_1 \\
    x_2
  \end{bmatrix} = \mathbf{0}
\]

So we can find eigenvectors with \(x_1 = \frac{2}{9}x_2\). If we let \(x_1=2\) then \(x_2 = 9\).

We can now check that \( \mathbf{A}\mathbf{x} = \lambda\mathbf{x} \).

\[\begin{aligned}
\begin{bmatrix}
  5 & -2 \\
  9 & -6
\end{bmatrix}
\begin{bmatrix}
  2 \\
  9 \\
\end{bmatrix} =
\begin{bmatrix}
  10-18 \\
  18-54
\end{bmatrix} =
\begin{bmatrix}
  -8 \\
  -36
\end{bmatrix}
\end{aligned}\]

which is indeed

\[
  -4\begin{bmatrix}
    2\\
    9
  \end{bmatrix}
\]

If we let \(\lambda=3\), we get
\[
  \begin{bmatrix}
    2 & -2 \\
    9 & -9
  \end{bmatrix}
  \begin{bmatrix}
    x_1 \\
    x_2
  \end{bmatrix} =
  \begin{bmatrix}
    1 & -1 \\
    1 & -1
  \end{bmatrix}
  \begin{bmatrix}
    x_1 \\
    x_2
  \end{bmatrix} =
  \mathbf{0}
\]

From this we know that \(x_1 = x_2\). If we let \(x_1 = 1\), we get the following eigenvector:

\[
  \mathbf{x} = \begin{bmatrix}
    1 \\
    1
  \end{bmatrix}
\]

Then

\[
\begin{bmatrix}
  5 & -2 \\
  9 & 6
\end{bmatrix}
\begin{bmatrix}
  1 \\ 1
\end{bmatrix} =
3\begin{bmatrix}
  1\\1
\end{bmatrix} = 
\begin{bmatrix}
  3\\3
\end{bmatrix}
\]

### Problem 2

Find the eigenvalues and corresponding eigenvectors for the following matrix:

\[\begin{bmatrix}
  0 & 1 \\
  0 & 0
\end{bmatrix}\]

{{<divider>}}

\[
\left(
  \begin{bmatrix}
    0 & 1 \\
    0 & 0
  \end{bmatrix} -
  \begin{bmatrix}
    \lambda & 0 \\
    0 & \lambda
  \end{bmatrix}
\right)
\begin{bmatrix}
  x_1\\
  x_2
\end{bmatrix} = \mathbf{0}
\]
\[
\begin{bmatrix}
  -\lambda & 1 \\
  0 & -\lambda
\end{bmatrix}\begin{bmatrix}
  x_1 \\
  x_2
\end{bmatrix} = \mathbf{0}
\]

Solve for \(\lambda\) when we set the determinant to \(0\).

\[\begin{aligned}
  \begin{vmatrix}
    -\lambda & 1 \\
    0 & -\lambda
  \end{vmatrix} &= 0 \\
  \lambda^2-0 &= 0 \\
  \lambda &= 0
\end{aligned}\]

If we set \(\lambda\) back into the original matrix, we get the same matrix and we see that \(x_2=0\) while \(x_1\) can be anything. So any eigenvector for this linear system would be \(\begin{bmatrix}1 & 0\end{bmatrix}^{\top}\).

### Problem 3

Find the eigenvalues and corresponding eigenvectors for the following matrix:

\[\begin{bmatrix}
  13 & 5 & 2 \\
  2  & 7 & -8 \\
  5  & 4 & 7 \\
\end{bmatrix}\]

{{<divider>}}

\[\begin{vmatrix}
  13-\lambda & 5         & 2 \\
  2          & 7-\lambda & -8 \\
  5          & 4         & 7-\lambda
\end{vmatrix} = 0\]

\[\begin{aligned}
  (13-\lambda)\begin{vmatrix}
    7-\lambda & -8 \\
    4 & 7-\lambda
  \end{vmatrix} -
  5\begin{vmatrix}
    2 & -8 \\
    5 & 7-\lambda
  \end{vmatrix} +
  2\begin{vmatrix}
    2 & 7-\lambda \\
    5 & 4
  \end{vmatrix} = 0
\end{aligned}\]

\[(13 - \lambda)((7-\lambda)^2+32)-5(2(7-\lambda)+40)+2(2 \cdot 4-5 \cdot(7-\lambda)) = 0\]
\[(13 - \lambda)(\lambda^2-14\lambda+49+32)-5(14-2\lambda+40)+2(8-(35-5\lambda)) = 0\]
\[(-\lambda+13)(\lambda^2-14\lambda+81)-(70-10\lambda+200)+2(8-35+5\lambda) = 0\]
\[(-\lambda(\lambda^2-14\lambda+81)+13(\lambda^2-14\lambda+81))-(-10\lambda+270)+2(-27+5\lambda) = 0\]
\[((-\lambda^3+14\lambda^2-81\lambda)+(13\lambda^2-182\lambda+1053))+(10\lambda-270)+(-54+10\lambda) = 0\]

| 3rd degree terms | 2nd degree terms                 | 1st degree terms                                              | constants                   |
|------------------|----------------------------------|---------------------------------------------------------------|-----------------------------|
| \(-\lambda^3\)   | \(14\lambda^2\), \(13\lambda^2\) | \(-81\lambda\), \(-182\lambda\), \(10\lambda\), \(10\lambda\) | \(1053\), \(-270\), \(-54\) |

\[-\lambda^3+27\lambda^2-243\lambda+729 = 0\]

We can use the [Rational Root Theorem](#the-rational-root-theorem) and find the possible roots to this polynomial.

Since the constant term \(729 = 3^6\), the positive divisors are:

\[
  1,\:3,\:9,\:27,\:81,\:243,\:729
\]

and thus the possible factors are:

\[
  \pm 1,\:\pm 3,\:\pm 9,\:\pm 27,\:\pm 81,\:\pm 243,\:\pm 729
\]

> I'm going to make a really lucky guess and see if \(9\) works as a possible root.

Let's try \(\lambda=9\).

\[\begin{aligned}
-\lambda^3+27\lambda^2-243\lambda+729 &= 0 \\
-(9)^3+27(9)^2-243(9)+729 &= 0 \\
-(729)+27\cdot81-2187+729 &= 0 \\
-(729)+2187-2187+729 &= 0 \\
0 &= 0
\end{aligned}\]

Wow, that was a lucky guess.

So we know that \(\lambda=9\) and now we need to do long division of the polynomial:

\[
\frac{-\lambda^3+27\lambda^2-243\lambda+729}{\lambda-9}
\]

First we need to divide the leading terms of \(-\lambda^3+27\lambda^2-243\lambda+729\) and \(\lambda-9\):
\[
  \frac{-\lambda^{3}}{\lambda} = -\lambda^2
\]

So the first term is \(-\lambda^2\). Next we need to multiply this term by \(\lambda-9\) and then subtract it from the original polynomial:

\[-\lambda^3+27\lambda^2-243\lambda+729 - (-\lambda^2 \cdot (\lambda-9))\]
\[-\lambda^3+27\lambda^2-243\lambda+729 - (-\lambda^3+9\lambda^2)\]
\[-\lambda^3+27\lambda^2-243\lambda+729 + \lambda^3-9\lambda^2\]
\[27\lambda^2+(-9\lambda^2)-243\lambda+729\]
\[18\lambda^2-243\lambda+729\]

Now, let's take the first term of \(18\lambda^2-243\lambda+729\) and divide it by the first term of \(\lambda-9\).

\[
  \frac{18\lambda^2}{\lambda} = 18\lambda
\]

Then we multiply \(18\lambda\) to \(\lambda-9\) and get \(18\lambda^2-162\lambda\). Now subtract \(18\lambda^2-162\lambda\) from \(18\lambda^2-243\lambda+729\):

\[18\lambda^2-243\lambda+729 - (18\lambda^2-162\lambda)\]
\[-243\lambda+729 + 162\lambda\]
\[-81\lambda+729\]

Now we divide the first term of \(-81\lambda+729\) by the first term of \(\lambda-9\) and get:

\[
  -81\lambda
\]

<!-- LEFT OFF -->
