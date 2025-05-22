+++
draft = false
title = '02 - Matrix Multiplication'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Topics

- Matrix multiplication
- Linear transformation
- Transposition

## Notes

## Exercises

### Problem 1

Let

\[
  \mathbf{A} = \begin{bmatrix}
    4  & -2 & 3 \\
    -2 & 1  & 6 \\
    1  & 2  & 2
  \end{bmatrix},
  \mathbf{B} = \begin{bmatrix}
    1  & -3 & 0 \\
    -3 & 1  & 0 \\
    0  & 0  & -2
  \end{bmatrix}
\]

Solve for

\[
  \mathbf{A}\mathbf{B}, \mathbf{A}\mathbf{B}^{\top}, \mathbf{B}\mathbf{A}, \mathbf{B}^{\top}\mathbf{A}
\]

#### \(\mathbf{A}\mathbf{B}\)

\[\begin{aligned}
  (0,0) &=
    \begin{bmatrix} 4 & -2 & 3 \end{bmatrix}
    \begin{bmatrix} 1 \\ -3 \\ 0 \end{bmatrix} =
    4 \cdot 1 + -2 \cdot -3 + 3 \cdot 0 =
    4 + 6 + 0 = 10 \\
  (0,1) &= 
    \begin{bmatrix} 4 & -2 & 3 \end{bmatrix}
    \begin{bmatrix} -3 \\ 1 \\ 0 \end{bmatrix} =
    4 \cdot -3 + -2 \cdot 1 + 3 \cdot 0 =
    -12 + -2 + 0 = -14 \\
  (0,2) &= 
    \begin{bmatrix} 4 & -2 & 3 \end{bmatrix}
    \begin{bmatrix} 0 \\ 0 \\ -2 \end{bmatrix} = -6 \\
  (1,0) &= 
    \begin{bmatrix} 2 & 1 & 6 \end{bmatrix}
    \begin{bmatrix} 1 \\ -3 \\ 0 \end{bmatrix} =
    2 \cdot 1 + 1 \cdot -3 + 6 \cdot 0 = 2 + -3 + 0 = -1 \\
  (1,1) &=
    \begin{bmatrix} 2 & 1 & 6 \end{bmatrix}
    \begin{bmatrix} -3 \\ 1 \\ 0 \end{bmatrix} =
    2 \cdot -3 + 1 \cdot 1 + 6 \cdot 0 = -6 + 1 + 0 = -5 \\
  (1,2) &=
    \begin{bmatrix} 2 & 1 & 6 \end{bmatrix}
    \begin{bmatrix} 0 \\ 0 \\ -2 \end{bmatrix} = -6 \\
  (2,0) &= 
    \begin{bmatrix} 1 & 2 & 2 \end{bmatrix}
    \begin{bmatrix} 1 \\ -3 \\ 0 \end{bmatrix} =
    1 \cdot -3 + 2 \cdot 1 + 2 \cdot 0 = -3 + 2 + 0 = -1 \\
  (2,1) &=
    \begin{bmatrix} 1 & 2 & 2 \end{bmatrix}
    \begin{bmatrix} -3 \\ 1 \\ 0 \end{bmatrix} =
    1 \cdot -3 + 2 \cdot 1 + 2 \cdot 0 = -3 + 2 + 0 = -1 \\
  (2,2) &=
    \begin{bmatrix} 1 & 2 & 2 \end{bmatrix}
    \begin{bmatrix} 0 \\ 0 \\ -2 \end{bmatrix} = -4 \\
\end{aligned}\]
\[
 \mathbf{A}\mathbf{B} = 
  \begin{bmatrix}
    10 & -14 & -6 \\
    -1 & -5 & -6 \\
    -1 & -1 & -4
  \end{bmatrix}
\]

#### \(\mathbf{A}\mathbf{B}^{\top}\)

Because \(\mathbf{B}\) is symmetrical across the diagnol \(\mathbf{B}=\mathbf{B}^{\top}\) so

\[
 \mathbf{A}\mathbf{B} = 
 \mathbf{A}\mathbf{B}^{\top} = 
  \begin{bmatrix}
    10 & -14 & -6 \\
    -1 & -5 & -6 \\
    -1 & -1 & -4
  \end{bmatrix}
\]

#### \(\mathbf{B}\mathbf{A}\), \(\mathbf{B}^{\top}\mathbf{A}\)

> I'm skipping this calculation out of time but we can see that \(\mathbf{B}\mathbf{A}=\mathbf{B}^{\top}\mathbf{A}\) because \(\mathbf{B}=\mathbf{B}^{\top}\).

### Problem 2

Let
\[
  \mathbf{A} = \begin{bmatrix}
    4  & -2 & 3 \\
    -2 & 1  & 6 \\
    1  & 2  & 2
  \end{bmatrix},
  \mathbf{a} = \begin{bmatrix}
    1 & -2 & 0
  \end{bmatrix},
  \mathbf{b} = \begin{bmatrix}
    3 \\ 1 \\ -1
  \end{bmatrix}
\]

Solve for
\[
  \mathbf{A}\mathbf{a}, \mathbf{A}\mathbf{a}^{\top}, (\mathbf{A}\mathbf{a})^{\top}, \mathbf{b}^{\top}\mathbf{A}^{\top}
\]

#### \(\mathbf{A}\mathbf{a}\)

\[
  \mathbf{A}\mathbf{a} = 
  \begin{bmatrix}
    4  & -2 & 3 \\
    -2 & 1  & 6 \\
    1  & 2  & 2
  \end{bmatrix}
  \begin{bmatrix}
    1 & -2 & 0
  \end{bmatrix},
\]

\(\mathbf{A}\mathbf{a}\) is undefined because the number of columns in \(\mathbf{A}\) don't match the number of rows in \(\mathbf{a}\).

#### \(\mathbf{A}\mathbf{a}^{\top}\)

\[
  \mathbf{A}\mathbf{a}^{\top} = 
  \begin{bmatrix}
    4  & -2 & 3 \\
    -2 & 1  & 6 \\
    1  & 2  & 2
  \end{bmatrix}
  \begin{bmatrix}
    1 \\ -2 \\ 0
  \end{bmatrix},
\]

\[\begin{aligned}
  (0,0) &=
    \begin{bmatrix}
      4  & -2 & 3
    \end{bmatrix}
    \begin{bmatrix}
      1 \\ -2 \\ 0
    \end{bmatrix} =
    4 \cdot 1 + -2 \cdot -2 + 3 \cdot 0 =
    4 + -4 + 0 = 0
\end{aligned}\]

<!-- LEFT OFF -->
