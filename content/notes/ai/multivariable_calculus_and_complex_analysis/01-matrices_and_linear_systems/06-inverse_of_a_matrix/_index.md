+++
draft = false
title = '06 - Inverse of a Matrix'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Topics
- Matrix inversion
- Singular and non-singular matrices
- Gauss-Jordan Elimination

## Notes
- The inverse of an \(n \times n\) matrix is denoted by
\[
  \mathbf{A}\mathbf{A}^{-1} = \mathbf{A}^{-1}\mathbf{A} = \mathbf{I}
\]

- If \(\mathbf{A}\) has an inverse, then \(\mathbf{A}\) is called a _nonsingular matrix_.
  - If \(\mathbf{A}\) has an inverse, the inverse is unique.
- If \(\mathbf{A}\) has no inverse, then \(\mathbf{A}\) is called a _singular matrix_.
- The inverse of an \(n \times n\) matrix exists if and only if its rank equals \(n\).

## Exercises

### Problem 1

Find the inverse for the following matrix:

\[
  \mathbf{A} = \begin{bmatrix}
    0.3 & -0.1 & 0.5 \\
    2 & 6 & 4 \\
    5 & 0 & 9
  \end{bmatrix}
\]

{{<divider>}}

\[\begin{aligned}
\left[\begin{array}{ccc|ccc}
    0.3 & -0.1 & 0.5 &1 & 0 & 0 \\
    2 & 6 & 4 & 0 & 1 & 0 \\
    5 & 0 & 9 & 0 & 0 & 1
\end{array}\right]
&\quad \xrightarrow{R_0 \text{\=} 0.3}
\left[\begin{array}{ccc|ccc}
    1 & -0.333 & 1.667 & 3.333 & 0 & 0 \\
    2 & 6 & 4 & 0 & 1 & 0 \\
    5 & 0 & 9 & 0 & 0 & 1
\end{array}\right]\\
&\quad \xrightarrow{R_1 \text{-=} 2R_0}
\left[\begin{array}{ccc|ccc}
  1       & -0.333      & 1.667         & 3.333         & 0       & 0 \\
  (2-2*1) & (6+2*0.333) & (4-2*1.667)   & (0-2*3.333)   & (1-2*0) & (0-2*0) \\
  5 & 0 & 9 & 0 & 0 & 1
\end{array}\right] \\
&\quad \xrightarrow{}
\left[\begin{array}{ccc|ccc}
  1 & -0.333& 1.667& 3.333 & 0 & 0 \\
  0 & 6.666 & 0.666& -6.666& 1 & 0 \\
  5 & 0 & 9 & 0 & 0 & 1
\end{array}\right] \\
&\quad \xrightarrow{R_2 \text{-=}5R_0}
\left[\begin{array}{ccc|ccc}
  1      & -0.333 & 1.667  & 3.333  & 0      & 0 \\
  0      & 6.666  & 0.666  & -6.666 & 1      & 0 \\
  (5-5*1) & (0-5*-0.333) & (9-5*1.667) & (0-5*3.333) & (0-5*0) & (1-5*0)
\end{array}\right] \\
&\quad \xrightarrow{}
\left[\begin{array}{ccc|ccc}
1 & -0.333 & 1.667 & 3.333   & 0 & 0\\
0 & 6.666  & 0.666 & -6.666  & 1 & 0\\
0 & 1.665  & 0.665 & -16.665 & 0 & 1
\end{array}\right] \\
&\quad \xrightarrow{R_1 \text{\=} 6.666}
\left[\begin{array}{ccc|ccc}
1         & -0.333        & 1.667         & 3.333          & 0         & 0\\
(0/6.666) & (6.666/6.666) & (0.666/6.666) & (-6.666/6.666) & (1/6.666) & (0/6.666)\\
0         & 1.665         & 0.665         & -16.665        & 0         & 1
\end{array}\right] \\ 
&\quad \xrightarrow{}
\left[\begin{array}{ccc|ccc}
1 & -0.333 & 1.667 & 3.333   & 0     & 0\\
0 & 1.0    & 0.010 & -1      & 0.150 & 0.0\\
0 & 1.665  & 0.665 & -16.665 & 0     & 1
\end{array}\right] \\
&\quad \xrightarrow{R_2 \text{-=} 1.665R_1}
\left[\begin{array}{ccc|ccc}
1           & -0.333            & 1.667               & 3.333              & 0               & 0\\
0           & 1.0               & 0.010               & -1                 & 0.150           & 0.0\\
(0-1.665*0) & (1.665-1.665*1.0) & (0.665-1.665*0.010) & (-16.665-1.665*-1) & (0-1.665*0.150) & (1-1.665*0.0)
\end{array}\right] \\
&\quad \xrightarrow{}
\left[\begin{array}{ccc|ccc}
1   & -0.333 & 1.667 & 3.333 & 0      & 0\\
0   & 1.0    & 0.010 & -1    & 0.150  & 0.0\\
0.0 & 0.0    & 0.648 & -15.0 & -0.250 & 1.0
\end{array}\right] \\
&\quad \xrightarrow{R_2 \text{/=} 0.648}
\left[\begin{array}{ccc|ccc}
1   & -0.333 & 1.667 & 3.333 & 0      & 0\\
0   & 1.0    & 0.010 & -1    & 0.150  & 0.0\\
(0.0/0.648) & (0.0/0.648)    & (0.648/0.648) & (-15.0/0.648) & (-0.250/0.648) & (1.0/0.648)
\end{array}\right] \\
&\quad \xrightarrow{}
\left[\begin{array}{ccc|ccc}
1   & -0.333 & 1.667 & 3.333   & 0      & 0\\
0   & 1.0    & 0.010 & -1      & 0.150  & 0.0\\
0.0 & 0.0    & 1.0   & -23.148 & -0.386 & 1.543
\end{array}\right] \\
\end{aligned}\]

> LEFT OFF
