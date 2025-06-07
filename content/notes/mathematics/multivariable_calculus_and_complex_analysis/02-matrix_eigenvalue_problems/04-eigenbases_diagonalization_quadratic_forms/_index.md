+++
draft = false
title = '04 - Eigenbases, Diagonalization, Quadratic Forms'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Notes

### The Purpose of Finding Eigenbases

Let's say we have a transformation represented by \(\mathbf{y} = \mathbf{A} \mathbf{x}\) where \(\mathbf{A}\) is an \(n \times n\) matrix.

If we find an eigenbasis of \(\mathbf{A}\), then we can express any vector \(\mathbf{x} \in \mathbb{R}^{n}\) as a unique linear combination of eigenvectors \(\mathbf{x}_1, \dots ,\mathbf{x}_n\).

\[
  \mathbf{x} = c_1\mathbf{x}_1 + c_2\mathbf{x}_2 + \cdots + c_n\mathbf{x}_n
\]

And since \(\mathbf{A}\mathbf{x}_j = \lambda_j\mathbf{x}\), we have

\[\begin{aligned}
  \mathbf{y} &= \mathbf{A}\mathbf{x} = \mathbf{A}(c_1\mathbf{x}_1 + \dots + c_n\mathbf{x}_n) \\
  &= c_1\mathbf{A}\mathbf{x}_1 + \dots + c_n\mathbf{A}\mathbf{x}_n \\
  &= c_1\lambda_1\mathbf{x}_1 + \dots + c_n\lambda_n\mathbf{x}_n
\end{aligned}\]

The benefit of this is that the matrix multiplication of a transformation on a vector has now been simplified to a sum of products.

> I can imagine this would offer some computational efficiencies.

> Though I'm interested in what those \(c\) constants are and how they are calculated in a real world example.

### Diagonalization

If an \(n \times n\) matrix \(\mathbf{A}\) has a basis of eigenvectors, then

\[
  \mathbf{D} = \mathbf{X}^{-1}\mathbf{A}\mathbf{X}
\]

is diagonal with the eigenvalues of \(\mathbf{A}\) as the entries of the main diagonal.

\(\mathbf{X}\) is a matrix with the eigenvectors of \(\mathbf{A}\) as the column vectors.

### Definitions

#### Similar Matrices

An \(n \times n\) matrix \(\hat{\mathbf{A}}\) is called *similar* to an \(n \times n\) matrix \(\mathbf{A}\) if

\[
  \hat{\mathbf{A}} = \mathbf{P}^{-1}\mathbf{A}\mathbf{P}
\]

for some nonsingular (a matrix that has an inverse) \(n \times n\) matrix \(\mathbf{P}\).

The key property of a **similarity transformation** (\(\hat{\mathbf{A}} = \mathbf{P}^{-1}\mathbf{A}\mathbf{P}\)) is that it preserves the eigenvalues of \(\mathbf{A}\) to \(\hat{\mathbf{A}}\).

### Theorems
- If an \(n \times n\) matrix \mathbf{A} has \(n\) distinct eigenvalues, then \(\mathbf{A}\) has a basis of eigenvectors \(\mathbf{x}_1, \dots , \mathbf{x}_n \in \mathbb{R}^{n}\).
- A symmetric matrix has an orthonormal basis for \(\mathbb{R}^{n}\).
- If \(\hat{\mathbf{A}}\) is similar to \(\mathbf{A}\) then \(\hat{\mathbf{A}}\) has the same eigenvalues as \(\mathbf{A}\). Furthermore, if \(\mathbf{x}\) is an eigenvector of \(\mathbf{A}\), then \(\mathbf{y} = \mathbf{P}^{-1}\mathbf{x}\) is an eigenvector of \(\hat{\mathbf{A}}\) corresponding to the same eigenvalue.

### Misc
- Eigenvectors of an \(n \times n\) matrix may or may not form a basis for \(R^{n}\).
- An _eigenbasis_ is a basis of eigenvectors.
- Even if all \(n\) eigenvalues are not different, a matrix \(A\) may still provide an eigenbasis for \(\mathbb{R}^{n}\).

## Exercises

### Problem 1

Find an eigenbasis and diagonalize.

\[
  \begin{bmatrix}
    4 & 3 & 3 \\
    3 & 6 & 1 \\
    3 & 1 & 6 \\
  \end{bmatrix}
\]

{{<divider>}}

> For the calculations that seemed to be pulled from my ass were made by Wolfram Alpha.

The eigenvalues are \(\lambda = \{1, 5, 10\}\).

#### Finding the eigenvector for \(\lambda = 1\)

\[
  \begin{bmatrix}
    4-1 & 3 & 3 \\
    3 & 6-1 & 1 \\
    3 & 1 & 6-1 \\
  \end{bmatrix} =
  \begin{bmatrix}
    3 & 3 & 3 \\
    3 & 5 & 1 \\
    3 & 1 & 5 \\
  \end{bmatrix}
\]

Row reducing this matrix, we get:

\[
  \begin{bmatrix}
    1 & 0 & 2 \\
    0 & 1 & -1 \\
    0 & 0 & 0
  \end{bmatrix}
\]

Then we get the following system of linear equations:

\[\begin{aligned}
  x_1 + 2 x_3 = 0 \\
  x_2 + x_3 = 0
\end{aligned}\]

The following eigenvector satisifies this system:

\[
  \begin{bmatrix}
  2 \\ 1 \\ -1
  \end{bmatrix}
\]

#### Finding the eigenvector for \(\lambda = 5\)

\[
  \begin{bmatrix}
    4-5 & 3 & 3 \\
    3 & 6-5 & 1 \\
    3 & 1 & 6-5 \\
  \end{bmatrix} =
  \begin{bmatrix}
    -1 & 3 & 3 \\
    3 & 1 & 1 \\
    3 & 1 & 1 \\
  \end{bmatrix}
\]

Row reduce:

\[
  \begin{bmatrix}
    1 & 0 & 0 \\
    0 & 1 & 1 \\
    0 & 0 & 0 \\
  \end{bmatrix}
\]

System of linear equations:

\[\begin{aligned}
  x_1 = 0 \\
  x_2 + x_3 = 0
\end{aligned}\]

Eigenvector:

\[
  \begin{bmatrix}
    0 \\ 1 \\ -1
  \end{bmatrix}
\]

#### Finding the eigenvector for \(\lambda = 10\)

\[
  \begin{bmatrix}
    4-10 & 3 & 3 \\
    3 & 6-10 & 1 \\
    3 & 1 & 6-10 \\
  \end{bmatrix} =
  \begin{bmatrix}

  \end{bmatrix}
\]

> TODO: Continue
