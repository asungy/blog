+++
draft = false
title = '01 - Determining Eigenvalues and Eigenvectors'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Notes

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
(\mathbf{A}-\lambda\mathbf{I})\mathbf{x} &= 0
\end{aligned}\]

We want to find the case where \(\text{det}(\mathbf{A} - \lambda\mathbf{I}) = 0\), so we solve for \(\lambda\) such that that is the case:

\[\begin{aligned}
  \text{det}(\mathbf{A} - \lambda\mathbf{I}) &=
  \begin{vmatrix}
  -5-\lambda & 2 \\
  2          & -2-\lambda
  \end{vmatrix} \\
  &= (-5-\lambda)(-2-\lambda) - 2 \cdot 2 \\
  &= -5 \cdot -2 + 2\lambda + 5\lambda + \lambda^{2} - 4 \\
  &= 10 + 7\lambda + \lambda^{2} - 4 \\
  &= 6 + 7\lambda + \lambda^{2} \\
  &= \lambda^{2} + 7\lambda + 6 \\
  &= (\lambda+6)(\lambda+1)
\end{aligned}\]

If we set \((\lambda+6)(\lambda+1) = 0\), we get \(\lambda={-6,-1}\).
