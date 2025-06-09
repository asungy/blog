+++
draft = false
title = '05 - Complex Matrices and Forms'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Notes

### Complex Conjugate Matrix Form

\(\overline{\mathbf{A}}\) is obtained by replacing each entry of the form \(\alpha + i\beta\) with it's complex conjugate.

For example, if

\[
  \mathbf{A} = \begin{bmatrix}
    3+4i & 1-i \\
    6 & 2-5i
  \end{bmatrix}
\]

then

\[
  \overline{\mathbf{A}} = \begin{bmatrix}
    3-4i & 1+i \\
    6 & 2+5i
  \end{bmatrix}
\]

### Hermitian, Skew-Hermitian, and Unitary Matrices

A square matrix \(\mathbf{A}\) is called:
- **Hermitian** if \(\overline{\mathbf{A}}^{\top} = \mathbf{A}\)
- **skew-Hermitian** if \(\overline{\mathbf{A}}^{\top} = -\mathbf{A}\)
- **unitary** if \(\overline{\mathbf{A}}^{\top} = \mathbf{A}^{-1}\)

### Definitions
- A **unitary system** is a set of complex vectors where

\[
  \mathbf{a}_j \cdot \mathbf{a}_k = \overline{\mathbf{a}}_j^{\top}\overline{\mathbf{a}}_k^{\top} = 
  \begin{cases}
    0 & \text{if } j \ne k \\
    1 & \text{if } j = k
  \end{cases}
\]

### Theorems

- The eigenvalues of a Hermitian matrix (and thus of a symmetric matrix)
are real
- The eigenvalues of a skew-Hermitian matrix (and thus of a skew-symmetric
matrix) are pure imaginary or zero.
- The eigenvalues of a unitary matrix (and thus of an orthogonal matrix) have
absolute value 1.
- The _unitary transformation_, that is, \(\mathbf{y}=\mathbf{A}\mathbf{x}\) with a unitary matrix \(\mathbf{A}\), preserves the value of the inner product, hence also the norm.
- A complex square matrix is unitary if and only if its column vectors (and also its
row vectors) form a unitary system.
- The determinant of a unitary matrix has an absolute value of \(1\).
- A Hermitian, skew-Hermitian, or unitary matrix has a basis of eigenvectors for \(\mathbb{C}^n\)
that is a unitary system.

### Misc

- The _inner product_ of the complex vector space \(\mathbb{C}^n\) is

\[
  \mathbf{a} \cdot \mathbf{b} = \overline{\mathbf{a}}^{\top}\mathbf{b}
\]

- The _length_ or _norm_ of a vector in \(\mathbb{C}^n\) is

\[
  \Vert \mathbf{a} \Vert = \sqrt{\overline{\mathbf{a}}^{\top}\mathbf{a}}
\]

## Exercises

### Problem 1

Is the given matrix Hermitian, skew-Hermitian, or unitary? Find its eigenvalues and eigenvectors.

\[\begin{bmatrix}
  6 & i \\
  -i & 6
\end{bmatrix}\]

{{<divider>}}

#### Hermitian check

We want to check if \(\overline{\mathbf{A}}^{\top} = \mathbf{A}\).

\[\begin{aligned}
  \overline{\mathbf{A}} = \begin{bmatrix}
    6 & -i \\
    i & 6
  \end{bmatrix} \\
  \overline{\mathbf{A}}^{\top} = \begin{bmatrix}
    6 & i \\
    -i & 6
  \end{bmatrix}
\end{aligned}\]

Therefore, it is Hermitian.

#### Find the eigenvalues

\[\begin{aligned}
  \text{det}(\mathbf{A}-\lambda\mathbf{I}) = 0\\
  \text{det}(\begin{bmatrix}
    6 & i \\
    -i & 6
  \end{bmatrix} - \begin{bmatrix}
    \lambda & 0 \\
    0 & \lambda \\
  \end{bmatrix}) = 0 \\
  \begin{vmatrix}
    6-\lambda & i \\
    -i & 6-\lambda
  \end{vmatrix} = 0\\
  (6-\lambda)(6-\lambda) - (-i \cdot i) = 0 \\
  (36-12\lambda+\lambda^2)-(1) = 0 \\
  \lambda^2-12\lambda+35 = 0 \\
  (\lambda-7)(\lambda-5) = 0 \\
  \lambda = \{5, 7\}
\end{aligned}\]

#### Finding the eigenvectors

For \(\lambda = 5\),

\[
  \begin{bmatrix}
    6-\lambda & i \\
    -i & 6-\lambda
  \end{bmatrix} = \begin{bmatrix}
    6-5 & i \\
    -i & 6-5
  \end{bmatrix} = \begin{bmatrix}
    1 & i \\
    -i & 1
  \end{bmatrix}
\]
