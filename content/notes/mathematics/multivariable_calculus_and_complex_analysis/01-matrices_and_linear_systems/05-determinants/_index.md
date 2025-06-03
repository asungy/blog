+++
draft = false
title = '05 - Determinants'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Notes
- Some properties and behaviors on determinants:
  - Interchange of two rows multiplies the value of the determinant by -1.
  - Addition of a multiple of a row to another row does not alter the value of the determinant.
  - Multiplication of a row by a nonzero constant \(c\) multiplies the value of the determinant by \(c\). (This holds also when \(c=0\), but no longer gives an elementary row operation.)
  - Transposition leaves the value of the determinant unaltered.
  - A zero (redundant) row or column makes the value of the determinant zero.

- A determinant of the second order is defined by:

\[
D = \text{det }\mathbf{A} =
\begin{vmatrix}
  a_{11} & a_{12} \\
  a_{21} & a_{22}
\end{vmatrix} =
a_{11}a_{12} - a_{12}a_{21}
\]

- A determinant of the third order can be defined by:

\[
D = \begin{vmatrix}
  a_{11} & a_{12} & a_{13} \\
  a_{21} & a_{22} & a_{23} \\
  a_{31} & a_{32} & a_{33}
\end{vmatrix} =
  a_{11} \begin{vmatrix}
    a_{22} & a_{23} \\
    a_{32} & a_{33}
  \end{vmatrix} -
  a_{21} \begin{vmatrix}
    a_{12} & a_{13} \\
    a_{32} & a_{33}
  \end{vmatrix} +
  a_{31} \begin{vmatrix}
    a_{12} & a_{13} \\
    a_{22} & a_{23}
  \end{vmatrix}
\]

- General form to calculate determinants:

\[
  D = \sum_{j=1}^{n} (-1)^{j+k} a_{jk}M_{jk} \qquad (k = 1, 2, \dots n)
\] 

- The "sub-determinants" inside of a determinant is called a _minor_ (denoted as \(M_{jk}\)).
- If a matrix has a rank \(r\) greater than or equal to 1, then there exists at least one \(r \times r\) square submatrix whose determinant is non-zero.
- If the rank of a matrix is \(r\), then any square matrix that is larger than \(r \times r\)  will have a zero determinant.
- An \(n \times n\) square matrix \(A\) has a rank \(n\) if and only if \(\text{det} A \neq 0\).
- If the determinant of a matrix \(A\) is 0, then
  - \(A\) does not have an inverse
  - There are redundant rows/columns
- The difference between _rank_ and _full rank_:
  - The _rank_ of a matrix is the maximum number of linearly independent rows or columns in the matrix.
  - A matrix is said to be _full rank_ when its rank is as large as possible for its shape.

## Exercises

### Problem 1

Evaluate the following determinant:

\[\begin{vmatrix}
  4 & 1 & 8 \\
  0 & 2 & 3 \\
  0 & 0 & 5
\end{vmatrix}\]

{{<divider>}}

\[
\begin{vmatrix}
  4 & 1 & 8 \\
  0 & 2 & 3 \\
  0 & 0 & 5
\end{vmatrix}
\]
\[\begin{aligned}
&= 4\begin{vmatrix}
2 & 3 \\
0 & 5
\end{vmatrix} -
1\begin{vmatrix}
0 & 3 \\
0 & 5
\end{vmatrix} +
8\begin{vmatrix}
  0 & 2 \\
  0 & 0
\end{vmatrix} \\
&= 4(2 \cdot 5 - 0 \cdot 3) - (0 \cdot 5 - 0 \cdot 3) + 8(0 \cdot 0 - 0 \cdot 2) \\
&= 4(10) -0 + 0 \\
&= 40
\end{aligned}\]

### Problem 2

Evaluate the determinant of the following matrix:

\[\begin{bmatrix}
1 & 5 & 2 & 2 \\
1 & 3 & 2 & 6 \\
4 & 0 & 8 & 48
\end{bmatrix}\]

{{<divider>}}

> Skipping
