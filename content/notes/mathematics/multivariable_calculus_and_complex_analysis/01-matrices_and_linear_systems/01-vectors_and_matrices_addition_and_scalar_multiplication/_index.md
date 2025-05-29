+++
draft = false
title = '01 - Vectors and Matrices: Addition and Scalar Multiplication'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Topics

- Vector/Matrix addition
- Scalar multiplication
- Vector/Matrix operations laws: 
  - Commutativity
  - Associativity
  - Distributivity


## Notes

> The subsection is pretty straightforward so no notes are available.

## Exercises

> TODO: I should verify the answers.

### Problem 1

Let

\[
  \mathbf{A} = \begin{bmatrix}
    0 & 2 & 4 \\
    6 & 5 & 5 \\
    1 & 0 & -3
  \end{bmatrix},
  \mathbf{B} = \begin{bmatrix}
    0  & 5 &  2 \\
    5  & 3 &  4 \\
    -2 & 4 & -2
  \end{bmatrix},
  \mathbf{C} = \begin{bmatrix}
     5 & 2 \\
    -2 & 4 \\
     1 & 0
  \end{bmatrix}
\]

{{<divider>}}

\[
  3 \mathbf{A} = 3 
    \begin{bmatrix}
      0 & 2 & 4 \\
      6 & 5 & 5 \\
      1 & 0 & -3
    \end{bmatrix} = 
    \begin{bmatrix}
      0  & 6 & 12 \\
      18 & 15 & 15 \\
      3 & 0 & -9
    \end{bmatrix}
\]

\[
  0.5\mathbf{B} = 0.5
  \begin{bmatrix}
    0  & 5 &  2 \\
    5  & 3 &  4 \\
    -2 & 4 & -2
  \end{bmatrix} =
  \begin{bmatrix}
    0   &  2.5 &  1 \\
    2.5 &  1.5 &  2 \\
    -1  &  2   & -1
  \end{bmatrix}
\]

\[
  3\mathbf{A} + 0.5\mathbf{B} =
  \begin{bmatrix}
    0  & 6 & 12 \\
    18 & 15 & 15 \\
    3 & 0 & -9
  \end{bmatrix} + 
  \begin{bmatrix}
    0   &  2.5 &  1 \\
    2.5 &  1.5 &  2 \\
    -1  &  2   & -1
  \end{bmatrix} = 
  \begin{bmatrix}
  0    & 8.5  & 13 \\
  20.5 & 16.5 & 17 \\
  2    & 2    & -10
  \end{bmatrix}
\]

\[
  3\mathbf{A} + 0.5\mathbf{B} + \mathbf{C} =
  \begin{bmatrix}
  0    & 8.5  & 13 \\
  20.5 & 16.5 & 17 \\
  2    & 2    & -10
  \end{bmatrix} + 
  \begin{bmatrix}
     5 & 2 \\
    -2 & 4 \\
     1 & 0
  \end{bmatrix} = \text{undefined}
\]

- \(3\mathbf{A} + 0.5\mathbf{B} + \mathbf{C}\) is undefined because \(3\mathbf{A} + 0.5\mathbf{B}\) and \(\mathbf{C}\) do not have the same dimensions.

### Problem 2

Let

\[
  \mathbf{C} = \begin{bmatrix}
     5 & 2 \\
    -2 & 4 \\
     1 & 0
  \end{bmatrix},
  \mathbf{D} = \begin{bmatrix}
    -4 & 1 \\
    5  & 0 \\
    2  & -1
  \end{bmatrix}
\]

{{<divider>}}

\[
  8\mathbf{C} + 10\mathbf{D} =
  8\begin{bmatrix}
     5 & 2 \\
    -2 & 4 \\
     1 & 0
  \end{bmatrix} +
  10\begin{bmatrix}
    -4 & 1 \\
    5  & 0 \\
    2  & -1
  \end{bmatrix} = 
  \begin{bmatrix}
    40  & 16 \\
    -16 & 32 \\
    8   & 0
  \end{bmatrix} +
  \begin{bmatrix}
    -40 & 10 \\
    50  & 0 \\
    20  & -10
  \end{bmatrix} =
  \begin{bmatrix}
    0  & 26 \\
    34 & 32 \\
    28 & -10
  \end{bmatrix}
\]

\[
  2(5\mathbf{D} + 4\mathbf{C}) =
  2(
    5\begin{bmatrix}
      -4 & 1 \\
      5  & 0 \\
      2  & -1
    \end{bmatrix} + 
    4\begin{bmatrix}
       5 & 2 \\
      -2 & 4 \\
       1 & 0
    \end{bmatrix}
  ) =
  2(
    \begin{bmatrix}
      -20 & 5 \\
      25  & 0 \\
      10  & -5
    \end{bmatrix} +
    \begin{bmatrix}
      20 & 8 \\
      -8 & 16 \\
      4  & 0 
    \end{bmatrix}
  ) =
  2\begin{bmatrix}
    0  & 13 \\
    17 & 16 \\
    14 & -5
  \end{bmatrix} =
  \begin{bmatrix}
    0  & 26 \\
    34 & 32 \\
    28 & -10
  \end{bmatrix}
\]

> Lol, I didn't realize the previous two expressions were the same via the distribution rule... oh well ¯\\\_(ツ)_/¯

\[
  0.6\mathbf{C} - 0.6\mathbf{D} = 0.6(\mathbf{C} - \mathbf{D}) =
  0.6(
    \begin{bmatrix}
       5 & 2 \\
      -2 & 4 \\
       1 & 0
    \end{bmatrix} - 
    \begin{bmatrix}
      -4 & 1 \\
      5  & 0 \\
      2  & -1
    \end{bmatrix}
  ) =
  0.6\begin{bmatrix}
    9  & 1 \\
    -7 & 4 \\
    -1 & 1
  \end{bmatrix} =
  \begin{bmatrix}
    5.4  & 0.6 \\
    -6.3 & 2.4 \\
    -0.6 & 0.6 
  \end{bmatrix}
\]

- \(0.6\mathbf{C} - 0.6\mathbf{D} = 0.6(\mathbf{C} - \mathbf{D})\) via the distributive rule.

### Problem 3

Let

\[
  \mathbf{C} = \begin{bmatrix}
     5 & 2 \\
    -2 & 4 \\
     1 & 0
  \end{bmatrix},
  \mathbf{E} = \begin{bmatrix}
    0 & 2 \\
    3 & 4 \\
    3 & -1
  \end{bmatrix},
  \mathbf{u} = \begin{bmatrix}
    1.5 \\
    0 \\
    -3.0
  \end{bmatrix},
  \mathbf{v} = \begin{bmatrix}
    -1 \\
    3 \\
    2
  \end{bmatrix},
  \mathbf{w} = \begin{bmatrix}
    -5 \\
    -30 \\
    10
  \end{bmatrix}
\]

{{<divider>}}

\[
  (\mathbf{u} + \mathbf{v}) - \mathbf{w} = \mathbf{u} + (\mathbf{v} - \mathbf{w}) = 
  \begin{bmatrix}
    1.5 \\
    0 \\
    -3.0
  \end{bmatrix} + (
    \begin{bmatrix}
      -1 \\
      3 \\
      2
    \end{bmatrix} -
    \begin{bmatrix}
      -5 \\
      -30 \\
      10
    \end{bmatrix}
  ) =
  \begin{bmatrix}
    1.5 \\
    0 \\
    -3.0
  \end{bmatrix} +
  \begin{bmatrix}
    4 \\
    33 \\
    -8
  \end{bmatrix} =
  \begin{bmatrix}
    5.5 \\
    33 \\
    -11.0
  \end{bmatrix}
\]

- \((\mathbf{u} + \mathbf{v}) - \mathbf{w} = \mathbf{u} + (\mathbf{v} - \mathbf{w})\) due to the associative rule.

\[
  \mathbf{C} + 0\mathbf{w} = 
  \begin{bmatrix}
     5 & 2 \\
    -2 & 4 \\
     1 & 0
  \end{bmatrix} +
  0\begin{bmatrix}
    -5 \\
    -30 \\
    10
  \end{bmatrix} =
  \begin{bmatrix}
     5 & 2 \\
    -2 & 4 \\
     1 & 0
  \end{bmatrix} +
  \begin{bmatrix}
    0 \\
    0 \\
    0
  \end{bmatrix} =
  \begin{bmatrix}
     5 & 2 \\
    -2 & 4 \\
     1 & 0
  \end{bmatrix}
\]

\[
  0\mathbf{E} + \mathbf{u} - \mathbf{v} =
  0\begin{bmatrix}
    0 & 2 \\
    3 & 4 \\
    3 & -1
  \end{bmatrix} +
  \begin{bmatrix}
    1.5 \\
    0 \\
    -3.0
  \end{bmatrix} -
  \begin{bmatrix}
    -1 \\
    3 \\
    2
  \end{bmatrix} = \text{undefined}
\]

- \(0\mathbf{E}\) does not have same dimensions as \(\mathbf{u}\) and \(\mathbf{v}\) so matrix addition cannot be applied here.

### Problem 4

Let 

\[
  \mathbf{u} = \begin{bmatrix}
    1.5 \\
    0 \\
    -3.0
  \end{bmatrix},
  \mathbf{v} = \begin{bmatrix}
    -1 \\
    3 \\
    2
  \end{bmatrix},
  \mathbf{w} = \begin{bmatrix}
    -5 \\
    -30 \\
    10
  \end{bmatrix}
\]

Let's say these vectors represent forces in space. If we combine or sum these vectors we get a single vector called the _resultant_. Calculate the resultant of \(\mathbf{u}\), \(\mathbf{v}\), and \(\mathbf{w}\).

{{<divider>}}

\[
\mathbf{u} + \mathbf{v} + \mathbf{w} =
\begin{bmatrix}
  1.5 \\
  0 \\
  -3.0
\end{bmatrix} +
\begin{bmatrix}
  -1 \\
  3 \\
  2
\end{bmatrix} +
\begin{bmatrix}
  -5 \\
  -30 \\
  10
\end{bmatrix} = 
\begin{bmatrix}
0.5 \\
3 \\
-1.0
\end{bmatrix} +
\begin{bmatrix}
-5 \\
-30 \\
10
\end{bmatrix} =
\begin{bmatrix}
-4.5 \\
-27 \\
-9.0
\end{bmatrix}
\]

### Problem 5

Forces are said to be in _equilibrium_ if their resultant is a zero vector. What opposing vector force would cause the resultant force found in [17](#17) to be in equilibrium?

{{<divider>}}

All we have to do is multiply the force vector by \(-1\) which would give us the opposing force to make both forces at equilibrium or their sums become a zero vector.

\[
  -1\begin{bmatrix}
    -4.5 \\
    -27 \\
    -9.0
  \end{bmatrix} =
  \begin{bmatrix}
    4.5 \\
    27 \\
    9.0
  \end{bmatrix}
\]
