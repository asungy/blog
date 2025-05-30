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

\[
  (13 - \lambda)((7-\lambda)^2+32)-5(2(7-\lambda)+40)+2(2 \cdot 4-5 \cdot(7-\lambda)) = 0
\]

> TODO: Finish it
