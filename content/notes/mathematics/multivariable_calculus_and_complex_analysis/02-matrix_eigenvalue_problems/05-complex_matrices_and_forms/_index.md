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

### Theorems

- The eigenvalues of a Hermitian matrix (and thus of a symmetric matrix)
are real
- The eigenvalues of a skew-Hermitian matrix (and thus of a skew-symmetric
matrix) are pure imaginary or zero.
- The eigenvalues of a unitary matrix (and thus of an orthogonal matrix) have
absolute value 1.

## Exercises
