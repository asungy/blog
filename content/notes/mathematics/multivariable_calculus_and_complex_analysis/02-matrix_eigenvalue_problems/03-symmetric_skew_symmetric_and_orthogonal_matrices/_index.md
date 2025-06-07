+++
draft = false
title = '03 - Symmetric, Skew-Symmetric, and Orthogonal Matrices'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Notes

### Symmetric, Skew-Symmetric, and Orthongonal Matrices

An \(n \times n\) matrix with elements in \(\mathbb{R}\) is _symmetric_ if it's transposition leaves it unchanged.

\[
  \mathbf{A}^{\top} = \mathbf{A}
\]

An \(n \times n\) matrix with elements in \(\mathbb{R}\) is _skew-symmetric_ if it's transposition results in the negative of \(\mathbf{A}\).

\[
  \mathbf{A}^{\top} = -\mathbf{A}
\]

An \(n \times n\) matrix with elements in \(\mathbb{R}\) is _orthogonal_ if it's transposition results in the inverse of \(\mathbf{A}\).

\[
  \mathbf{A}^{\top} = \mathbf{A}^{-1}
\]

### Theorems

- The eigenvalues of a symmetric matrix are real.
- The eigenvalues of a skew-symmetric matrix are pure imaginary or zero.
- A transformation on a vector by an orthogonal matrix preserves its _norm_ or length.
- The determinant of an orthogonal matrix has the value \(+1\) or \(-1\).


## Exercises


### Problem 1

Is the following matrix symmetric, skew-symmetric, or orthogonal? Find the spectrum.

\[\begin{bmatrix}
  6 & 0  & 0 \\
  0 & 2  & -2 \\
  0 & -2 & 5 \\
\end{bmatrix}\]

{{<divider>}}

This matrix is symmetric with eigenvalues of \(\lambda = \{6, 6, 1\}\)
