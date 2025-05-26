+++
draft = false
title = '03 - Gauss Elimination'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Topics

- Linear system of equations
- Gauss elimination
- Determined, underdetermined and overdetermined linear systems
- Consistent and inconsistent linear systems

## Notes
- A linear system is _overdetermined_ if it has more equations than unknowns.
- A linear system is _underdetermined_ if it has fewer equations than unknowns.
- A linear system is _determined_ if the number of equations equals the number of unknown variables.
- A linear system is _consistent_ if it has at least one solution.
- A linear system is _inconsistent_ if it has no solutions at all.


## Exercises

### Problem 1

Solve the following system of linear equations:

\[\begin{aligned}
  x + y - z &= 9 \\
  8y + 6z &= -6 \\
  -2x + 4y - 6z &= 40
\end{aligned}\]

{{<divider>}}

Let's convert the system of linear equations into an augmented matrix so that it is easier to work with.

\[
\left[\begin{array}{ccc|c}
1 & 1 & -1 & 9 \\
0 & 8 & 6 & -6 \\
-2 & 4 & -6 & 40
\end{array}\right]
\]

\[
\left[\begin{array}{ccc|c}
1 & 1 & -1 & 9 \\
0 & 8 & 6 & -6 \\
-2 & 4 & -6 & 40
\end{array}\right]
\quad \xrightarrow{R_2 \text{+=} 2R_0}
\left[\begin{array}{ccc|c}
1 & 1 & -1 & 9 \\
0 & 8 & 6 & -6 \\
(-2 + 2) & (4 + 2) & (-6 + -2) & (40 + 18)
\end{array}\right]
\longrightarrow
\left[\begin{array}{ccc|c}
1 & 1 & -1 & 9 \\
0 & 8 & 6 & -6 \\
0 & 6 & -8 & 58
\end{array}\right]
\]

\[
\left[\begin{array}{ccc|c}
1 & 1 & -1 & 9 \\
0 & 8 & 6 & -6 \\
0 & 6 & -8 & 58
\end{array}\right]
\quad \xrightarrow{R_1 \text{\=} 2\quad R_2 \text{\=} 2}
\left[\begin{array}{ccc|c}
1 & 1 & -1 & 9 \\
0 & 4 & 3 & -3 \\
0 & 3 & -4 & 29
\end{array}\right]
\quad \xrightarrow{R_1 \text{*=} 3 \quad R_2 \text{*=} 4}
\left[\begin{array}{ccc|c}
1 & 1 & -1 & 9 \\
0 & 12 & 9 & -9 \\
0 & 12 & -16 & 116
\end{array}\right]
\]

\[
\left[\begin{array}{ccc|c}
1 & 1 & -1 & 9 \\
0 & 12 & 9 & -9 \\
0 & 12 & -16 & 116
\end{array}\right] 
\quad \xrightarrow{R_2 \text{-=} R_1}
\left[\begin{array}{ccc|c}
1 & 1 & -1 & 9 \\
0 & 12 & 9 & -9 \\
0 & 0 & -25 & 125
\end{array}\right] 
\quad \xrightarrow{R_1 \text{\=} 3 \quad R_2 \text{\=} -25}
\left[\begin{array}{ccc|c}
1 & 1 & -1 & 9 \\
0 & 4 & 3 & -3 \\
0 & 0 & 1 & -5
\end{array}\right] 
\]

So \(z = -5\). If we back substitute \(z\) into \(4y + 3z = -3\), we get:

\[\begin{aligned}
  4y + 3z &= -3, \quad z = -5 \\
  4y + 3(-5) &= -3 \\
  4y - 15 &= -3 \\
  4y &= 12 \\
  y &= 3
\end{aligned}\]

So now we have \(y = 3, z = -5\). If we back substitute \(y\) and \(z\) into \(x + y - z = 9\), we get:

\[\begin{aligned}
x + y - z &= 9, \quad y = 3, \quad z = -5 \\
x + (3) - (-5) &= 9 \\
x + 8 &= 9 \\
x &= 1
\end{aligned}\]

So the solution to this system of linear equations is \(x = 1, y = 3, z = -5\).

### Problem 2

Solve the following system of linear equations:

\[\begin{aligned}
  -2y - 2z &= -8 \\
  3x + 4y - 5z &= 13
\end{aligned}\]

{{<divider>}}

Let's turn this system of equations into an augmented matrix.

\[
\left[\begin{array}{ccc|c}
  0 & -2 & -2 & -8 \\
  3 & 4 & -5 & 13
\end{array}\right]
\]

\[
\left[\begin{array}{ccc|c}
  0 & -2 & -2 & -8 \\
  3 & 4 & -5 & 13
\end{array}\right]
\quad \xrightarrow{R_1 \text{+=} 2R_0}
\left[\begin{array}{ccc|c}
  0 & -2 & -2 & -8 \\
  3 & 0 & -9 & -3
\end{array}\right]
\quad \xrightarrow{R_1 \text{\=} 3}
\left[\begin{array}{ccc|c}
  0 & -2 & -2 & -8 \\
  1 & 0 & -3 & -1
\end{array}\right]
\]
\[
\left[\begin{array}{ccc|c}
  0 & -2 & -2 & -8 \\
  1 & 0 & -3 & -1
\end{array}\right]
\quad \xrightarrow{\text{Swap R0 and R1}}
\left[\begin{array}{ccc|c}
  1 & 0 & -3 & -1 \\
  0 & -2 & -2 & -8
\end{array}\right]
\quad \xrightarrow{R1 \text{\=} -2}
\left[\begin{array}{ccc|c}
  1 & 0 & -3 & -1 \\
  0 & 1 & 1 & 4
\end{array}\right]
\]

We have reduced the matrix to row-echlon form and if we solve for \(z\) in the second equation and back substitute \(z\) into the first equation, we notice that \(x\) and \(y\) can be arbitrary values. So this system of linear equations has infinitely many solutions.

### Problem 3

Using Kirchoff's Laws, find the currents in the following system:

{{<image src="./problem-3.png" position="center" style="width: 30%; height: 30%">}}

{{<divider>}}

The following are Kirchoff's Laws:
- KCL: the sum of the currents at a point in a network is 0.
- KVL: the sum of potential differences in a closed loop is 0.

Notice the two junctions in the image. The top junction will be referred to as point _A_ and the bottom one will be referred to as point _B_. If the current flows in to the junction, that will be said to have a positive current. If the current flow out from a junction, that will be said to have a negative current.

Based off of KCL, point _A_ is represented by the following linear equation:

\[
  I_1 + I_2 - I_3 = 0
\]

Similarly, point _B_ is represented by the following linear equation:

\[
  -I_1 - I_2 + I_3 = 0 
\]

Notice how these two equations are redundant, so one of them can be removed. I'm going to forgo the latter.

Let's take a look at the left closed loop. Based on KVL, it can be represented by the following linear equation:

\[
  E_0 - I_2 R_1 = 0
\]

Since we are going to throw this in an augmented matrix, let's keep all of the currents on the left side.

\[
  I_2 R_1 = -E_0
\]

> To be honest, I'm unclear about the physical representation of the sign for the voltage. To me, it makes sense that a voltage source and voltage at a resistor have opposite signs, but I'm not sure which one should get what. For the purposes of this problem, I don't think it matters. It's just going to flip the sign of the other loop.

Similarly, based on KVL, we can represent the right closed loop by the following linear equation:

\[
  R_1 I_2 + R_2 I_3 = 0
\]

This system of linear equations can be represented by the following augmented matrix:

\[\left[\begin{array}{ccc|c}
  1 & 1 & -1 & 0 \\
  0 & R_1 & 0 & -E_0 \\
  0 & R_1 & R_2 & 0
\end{array}\right]\]

We can get the row echelon form with a single operation: subtracting the last row by the second row:

\[
\left[\begin{array}{ccc|c}
  1 & 1 & -1 & 0 \\
  0 & R_1 & 0 & -E_0 \\
  0 & 0 & R_2 & E_0
\end{array}\right]
\]

From this matrix, we can get

\[
  I_3 = \frac{E_0}{R_2}
\]
\[
  I_2 = \frac{-E_0}{R_1}
\]
\[\begin{aligned}
  I_1 &+ \frac{-E_0}{R_1} - \frac{E_0}{R_2} = 0 \\
  I_1 &= \frac{E_0}{R_1} + \frac{E_0}{R_2}
\end{aligned}\]

### Problem 4

> Skipping

## Additional Exercises

### Problem 1

Turn the following matrix into row-echelon form:

\[\left[\begin{array}{cccc|c}
  2 & 3 & 1 & -11 & 1 \\
  5 & -2 & 5 & -4 & 5 \\
  1 & -1 & 3 & -3 & 3 \\
  3 & 4 & -7 & 2 & -7
\end{array}\right]\]

{{<divider>}}

\[\begin{aligned}
\left[\begin{array}{cccc|c}
  2 & 3 & 1 & -11 & 1 \\
  5 & -2 & 5 & -4 & 5 \\
  1 & -1 & 3 & -3 & 3 \\
  3 & 4 & -7 & 2 & -7
\end{array}\right]
&\quad \xrightarrow{\text{Swap R0 and R2}}
\left[\begin{array}{cccc|c}
  1 & -1 & 3 & -3 & 3 \\
  5 & -2 & 5 & -4 & 5 \\
  2 & 3 & 1 & -11 & 1 \\
  3 & 4 & -7 & 2 & -7
\end{array}\right] \\
\left[\begin{array}{cccc|c}
  1 & -1 & 3 & -3 & 3 \\
  5 & -2 & 5 & -4 & 5 \\
  2 & 3 & 1 & -11 & 1 \\
  3 & 4 & -7 & 2 & -7
\end{array}\right]
&\quad \xrightarrow{R_1 \text{-=} 5R_0}
\left[\begin{array}{cccc|c}
  1      & -1      & 3      & -3      & 3 \\
  (5-5*1) & (-2-5*-1) & (5-5*3) & (-4-5*-3) & (5-5*3) \\
  2      & 3       & 1      & -11     & 1 \\
  3      & 4       & -7     & 2       & -7
\end{array}\right] \\
&\quad \xrightarrow{}
\left[\begin{array}{cccc|c}
1  & -1  & 3    & -3   & 3\\
0  & 3   & -10  & 11   & -10\\
2  & 3   & 1    & -11  & 1\\
3  & 4   & -7   & 2    & -7
\end{array}\right] \\
\left[\begin{array}{cccc|c}
1  & -1  & 3    & -3   & 3\\
0  & 3   & -10  & 11   & -10\\
2  & 3   & 1    & -11  & 1\\
3  & 4   & -7   & 2    & -7
\end{array}\right]
&\quad \xrightarrow{R_2 \text{-=} 2R_0}
\left[\begin{array}{cccc|c}
1  & -1  & 3    & -3   & 3\\
0  & 3   & -10  & 11   & -10\\
(2-2*1)  & (3-2*-1)   & (1-2*3)    & (-11-2*-3)  & (1-2*3)\\
3  & 4   & -7   & 2    & -7
\end{array}\right] \\
&\quad \xrightarrow{}
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 3  & -10 & 11 & -10\\
0 & 5  & -5  & -5 & -5\\
3 & 4  & -7  & 2  & -7
\end{array}\right] \\
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 3  & -10 & 11 & -10\\
0 & 5  & -5  & -5 & -5\\
3 & 4  & -7  & 2  & -7
\end{array}\right]
&\quad \xrightarrow{R_2 \text{-=} 3R_0}
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 3  & -10 & 11 & -10\\
0 & 5  & -5  & -5 & -5\\
(3-3*1) & (4-3*-1)  & (-7-3*3)  & (2-3*-3)  & (-7-3*3)
\end{array}\right] \\
&\quad \xrightarrow{}
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 3  & -10 & 11 & -10\\
0 & 5  & -5  & -5 & -5\\
0 & 7  & -16 & 11 & -16
\end{array}\right] \\
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 3  & -10 & 11 & -10\\
0 & 5  & -5  & -5 & -5\\
0 & 7  & -16 & 11 & -16
\end{array}\right]
&\quad \xrightarrow{R_1 \text{/=} 5}
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 3  & -10 & 11 & -10\\
0 & 1  & -1  & -1 & -1\\
0 & 7  & -16 & 11 & -16
\end{array}\right]
\quad \xrightarrow{\text{Swap R1 and R2}}
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 1  & -1  & -1 & -1\\
0 & 3  & -10 & 11 & -10\\
0 & 7  & -16 & 11 & -16
\end{array}\right] \\
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 1  & -1  & -1 & -1\\
0 & 3  & -10 & 11 & -10\\
0 & 7  & -16 & 11 & -16
\end{array}\right]
&\quad \xrightarrow{R_3 \text{-=} 7R_1}
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 1  & -1  & -1 & -1\\
0 & 3  & -10 & 11 & -10\\
(0-7*0) & (7-7*1)  & (-16-7*-1) & (11-7*-1) & (-16-7*-1)
\end{array}\right] \\
&\quad \xrightarrow{}
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 1  & -1  & -1 & -1\\
0 & 3  & -10 & 11 & -10\\
0 & 0  & -9 & 18 & -9
\end{array}\right] \\
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 1  & -1  & -1 & -1\\
0 & 3  & -10 & 11 & -10\\
0 & 0  & -9 & 18 & -9
\end{array}\right]
&\quad \xrightarrow{R_2 \text{-=} 3R_1}
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 1  & -1  & -1 & -1\\
(0-3*0) & (3-3*1)  & (-10-3*-1) & (11-3*-1) & (-10-3*-1)\\
0 & 0  & -9 & 18 & -9
\end{array}\right] \\
&\quad \xrightarrow{}
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 1  & -1  & -1 & -1\\
0 & 0  & -7 & 14 & -7\\
0 & 0  & -9 & 18 & -9
\end{array}\right] \\
\left[\begin{array}{cccc|c}
1 & -1 & 3   & -3 & 3\\
0 & 1  & -1  & -1 & -1\\
0 & 0  & -7 & 14 & -7\\
0 & 0  & -9 & 18 & -9
\end{array}\right]
&\quad \xrightarrow{R_2 \text{/=} -7 \quad R_3 \text{/=} -9}
\left[\begin{array}{cccc|c}
1 & -1 & 3  & -3 & 3\\
0 & 1  & -1 & -1 & -1\\
0 & 0  & 1  & -2 & 1\\
0 & 0  & 1  & -2 & 1
\end{array}\right]
\quad \xrightarrow{R_3 \text{-=} R_2}
\left[\begin{array}{cccc|c}
1 & -1 & 3  & -3 & 3\\
0 & 1  & -1 & -1 & -1\\
0 & 0  & 1  & -2 & 1\\
0 & 0  & 0  & 0 & 0
\end{array}\right]
\end{aligned}\]
