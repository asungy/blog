+++
draft = false
title = '04 - Linear Independence, Rank, and Vector Spaces'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Topics

- Linear independence
- Rank of a matrix
- Vector spaces
- Basis

## Notes
- **Definition of Linear Independence** - Let us consider the vector space \(V\) with \(k \in \mathbb{N}\) and \(\mathbf{x}_1, \dots, \mathbf{x}_k \in V\). If there is a non-trivial linear combination, such that \(\mathbf{0} = \sum_{i=1}^{k} \lambda_i \mathbf{x}_i\) with at least one \(\lambda_i \neq 0\), the vectors \(\mathbf{x}_1, \dots, \mathbf{x}_k\) are _linearly dependent_. If only the trivial solution exists, then the vectors are _linearly independent_.
- **Definition of Rank** - The _rank_ of a matrix is the maximum number of linearly independent rows.
- A matrix is said to be _rank deficient_ if it does not have a full rank.
- A matrix is considered to be _full rank_ if its rank is equal to the smallest dimension of the matrix, meaning it has the maximum number of linearly independent rows or columns. 

## Exercises

### Problem 1

Find the rank, basis for the row space, and basis for the column space for the following matrix:

\[\begin{bmatrix}
  4 & -2 & 6 \\
  -2 & 1 & -3
\end{bmatrix}\]

{{<divider>}}

To find the rank, we need to find the number of linearly independent rows in the matrix. At a quick glance we can see that the two rows in this matrix are redundant, so this matrix has a rank of 1 with a basis of \(\begin{bmatrix}2 & -1 & 3\end{bmatrix}\) in the row space. Remember that the basis of a vector space is not unique so there can be many other bases.

To find the basis of the column space, we need to transpose the matrix and find the number of linearly independent rows in the transposed matrix.

\[
\begin{bmatrix}
  4 & -2 & 6 \\
  -2 & 1 & -3
\end{bmatrix}^{\top} =
\begin{bmatrix}
4 & -2 \\
-2 & 1 \\
6 & -3
\end{bmatrix} =
\begin{bmatrix}
2 & -1 \\
-2 & 1 \\
2 & -1
\end{bmatrix} =
\begin{bmatrix}
2 & -1 \\
0 & 0 \\
0 & 0
\end{bmatrix}
\]

Therefore, the basis of the column space is \(\begin{bmatrix}2 & -1\end{bmatrix}\).

### Problem 2

Find the rank, basis for the row space, and basis for the column space for the following matrix:

\[\begin{bmatrix}
0 & 3 & 5 \\
3 & 5 & 0 \\
5 & 0 & 10
\end{bmatrix}\]

{{<divider>}}

\[
\begin{bmatrix}
0 & 3 & 5 \\
3 & 5 & 0 \\
5 & 0 & 10
\end{bmatrix}
\quad \xrightarrow{R_2 \text{\=} 2}
\begin{bmatrix}
0 & 3 & 5 \\
3 & 5 & 0 \\
1 & 0 & 2
\end{bmatrix}
\quad \xrightarrow{R_1 \text{-=} 3R_2}
\begin{bmatrix}
0 & 3 & 5 \\
0 & 5 & -6 \\
1 & 0 & 2
\end{bmatrix}
\quad \xrightarrow{R_0 \text{*=} 5 \quad R_1 \text{*=} 3}
\begin{bmatrix}
0 & 15 & 25 \\
0 & 15 & -18 \\
1 & 0 & 2
\end{bmatrix}
\quad \xrightarrow{R_0 \text{-=} R_1}
\begin{bmatrix}
0 & 0 & 43 \\
0 & 15 & -18 \\
1 & 0 & 2
\end{bmatrix}
\]

Some rearranging and simplification:

\[
\begin{bmatrix}
1 & 0 & 2 \\
0 & 5 & -6 \\
0 & 0 & 1
\end{bmatrix}
\quad \xrightarrow{\text{row reduced echelon}}
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix}
\]

This matrix has a rank of 3. Because the transpose of this matrix is the same as the original matrix, the basis for the row and column space is \({[1,0,0], [0,1,0], [0,0,1]}\).

### Problem 3

Is the following set of vectors linearly independent?

\[
  [2, 0, 0, 7],\quad
  [2, 0, 0, 8],\quad
  [2, 0, 0, 9],\quad
  [2, 0, 1, 0]
\]

{{<divider>}}

\[
\begin{bmatrix}
2 & 0 & 0 & 7 \\
2 & 0 & 0 & 8 \\
2 & 0 & 0 & 9 \\
2 & 0 & 1 & 0
\end{bmatrix}
\quad \xrightarrow{R_2 \text{-=} R_1}
\begin{bmatrix}
2 & 0 & 0 & 7 \\
2 & 0 & 0 & 8 \\
0 & 0 & 0 & 1 \\
2 & 0 & 1 & 0
\end{bmatrix}
\quad \xrightarrow{R_1 \text{-=} R_0}
\begin{bmatrix}
2 & 0 & 0 & 7 \\
0 & 0 & 0 & 1 \\
0 & 0 & 0 & 1 \\
2 & 0 & 1 & 0
\end{bmatrix}
\]

We can see that rows 1 and 2 are redundant, so these vectors are linearly dependent.

### Problem 4

Is the following set of vectors linearly independent?

\[
  [6, 0, -1, 3],\quad
  [2, 2, 5, 0],\quad
  [-4, -4, -4, -4]
\]

{{<divider>}}

\[
\begin{bmatrix}
  6 & 0 & -1 & 3 \\
  2 & 2 & 5 & 0 \\
  -4 & -4 & -4 & -4
\end{bmatrix}
\quad \xrightarrow{R_2 \text{\=} -4}
\begin{bmatrix}
  6 & 0 & -1 & 3 \\
  2 & 2 & 5 & 0 \\
  1 & 1 & 1 & 1
\end{bmatrix}
\quad \xrightarrow{R_1 \text{-=} 2R_2}
\begin{bmatrix}
  6 & 0 & -1 & 3 \\
  0 & 0 & 3 & -2 \\
  1 & 1 & 1 & 1
\end{bmatrix}
\quad \xrightarrow{R_0 \text{-=} 6R_2}
\begin{bmatrix}
  0 & -6 & -7 & -3 \\
  0 & 0 & 3 & -2 \\
  1 & 1 & 1 & 1
\end{bmatrix}
\]

Some simplifying and rearranging...

\[
\begin{bmatrix}
  1 & 1 & 1 & 1 \\
  0 & 6 & 7 & 3 \\
  0 & 0 & 3 & -2
\end{bmatrix}
\]

These vectors are linearly independent because the number of vectors equals the rank of the matrix formed by these vectors.
