+++
draft = false
title = '02 - Applications of Eigenvalue Problems'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Notes

## Exercises

### Problem 1

There are initially 200 healthy people and they can either be healthy, sick, or dead. Due to a spread of contagion, each year, there's a 60% chance that a healthy individual gets sick and a 10% chance that a healthy person dies. Each year 60% of sick people die while 20% go from sick to healthy. How many years will it take for only 10% of the population to be alive? How many people are healthy, sick, and dead after _k_ years?

{{<divider>}}

Because we are dealing with a population's state of well-being transitioning to some other (or the same) state of well-being with a certain probability, this suggests we should model this problem using a _stochastic matrix_. A stochastic matrix is a square matrix where the values in each of the columns and non-negative and sum to 1. If we have the columns represent a the current state (e.g. healthy, sick, or dead) and the rows representing the next state, each value in the matrix represents the probability that a transition from the current state to the next state will occur. So for example, our stochastic matrix can look like this:

\[
\left[\begin{array}{ccc|c}
\text{healthy} & \text{sick} & \text{dead} & \\
\hline
0.3 & 0.2 & 0.0 & \text{healthy} \\
0.6 & 0.2 & 0.0 & \text{sick}   \\
0.1 & 0.6 & 1.0 & \text{dead}   \\
\end{array}\right]
\]

Each transition has been assigned the probability of occurring based on the problem statement and all columns sum to 1. Note, for the "dead" column there's a 100% chance that that person will remain dead and cannot become healthy or sick.

So if we initially start with 200 healthy individuals (and no sick or deceased individuals), we can figure out how many healthy, sick, and deceased people there are after one year by multiplying the our stochastic matrix by a column vector the represents our starting population.

\[
  \begin{bmatrix}
    0.3 & 0.2 & 0.0 \\
    0.6 & 0.2 & 0.0 \\
    0.1 & 0.6 & 1.0 \\
  \end{bmatrix}
  \begin{bmatrix}
    200 \\ 0 \\ 0
  \end{bmatrix} = 
  \begin{bmatrix}
    60.0\\
    120.0\\
    20.0
  \end{bmatrix}
\]

After one year it is predicted that there will be 60 healthy people, 120 sick people, and 20 deceased people. If we wanted to see what the population would look like the year after that, we would multiply the stochastic matrix by \(\begin{bmatrix}60 & 120 & 20\end{bmatrix}^{\top}\). So in general if we want to find how many people are healthy, sick, and deceased after \(k\) years, we would just do this process \(k\) times. But because matrix multiplication is associative we can also do something like this:

\[
  \left(\begin{bmatrix}
    0.3 & 0.2 & 0.0 \\
    0.6 & 0.2 & 0.0 \\
    0.1 & 0.6 & 1.0 \\
  \end{bmatrix}\right)^{k}
  \begin{bmatrix}
    200 \\ 0 \\ 0
  \end{bmatrix}
\]

Based on theorem 3 in chapter 8.1 from our readings, we know that a matrix and its transpose have the same eigenvalues. Because each of this matrix's columns sum to 1, we know that it has an eigenvalue of 1.

\[
  \begin{bmatrix}
    0.3 & 0.2 & 0.0 \\
    0.6 & 0.2 & 0.0 \\
    0.1 & 0.6 & 1.0 \\
  \end{bmatrix}^{\top} = 
  \begin{bmatrix}
    0.3 & 0.6 & 0.1 \\
    0.2 & 0.2 & 0.6 \\
    0.0 & 0.0 & 1.0 \\
  \end{bmatrix}
\]
\[
  \begin{bmatrix}
    0.3 & 0.6 & 0.1 \\
    0.2 & 0.2 & 0.6 \\
    0.0 & 0.0 & 1.0 \\
  \end{bmatrix}
  \begin{bmatrix}
    1 \\ 1 \\ 1
  \end{bmatrix} =
  \begin{bmatrix}
    1 \\ 1 \\ 1
  \end{bmatrix}
\]

But what is the significance of this eigenvalue?

If we imagine our vector space as a 3D space where vectors can describe any combination of healthy, sick, and dead populations then we can think of the eigenvalue as helping us create a transformation matrix to collapse that 3D vector space into some 2D space (or a line. This is geometrically what we are doing when we are setting solving for \(\lambda\) and setting the determinant to equal 0). Now, there exists a vector in the 3D vector space that when this collapse happens from 3D to 2D space, this vector already exists in that 2D dimensional space (i.e. during the transformation it maintains the same orientation, but may or may not be scaled). Actually, because the eigenvalue of this matrix is 1, this vector doesn't change at all. This is vector is the eigenvector.

But what is this eigenvector telling us? It's saying there is some combination of healthy, sick, and dead people where our stochastic matrix won't have any affect when it is multiplied by this eigenvector. This represents a state of stability in our system.

So let's find the eigenvector that describes a stable state in our system.

\[\begin{aligned}
  \begin{bmatrix}
    0.3-\lambda & 0.2 & 0.0 \\
    0.6 & 0.2-\lambda & 0.0 \\
    0.1 & 0.6 & 1.0-\lambda \\
  \end{bmatrix} = 
  \begin{bmatrix}
    0.3-1.0 & 0.2 & 0.0 \\
    0.6 & 0.2-1.0 & 0.0 \\
    0.1 & 0.6 & 1.0-1.0 \\
  \end{bmatrix} = 
  \begin{bmatrix}
    -0.7 & 0.2  & 0.0 \\
    0.6  & -0.8 & 0.0 \\
    0.1  & 0.6  & 0.0 \\
  \end{bmatrix} \\
\end{aligned}\]

\[\begin{aligned}
  \begin{bmatrix}
    -0.7 & 0.2  & 0.0 \\
    0.6  & -0.8 & 0.0 \\
    0.1  & 0.6  & 0.0 \\
  \end{bmatrix}
  &\xrightarrow{\text{multiply each column by 10}}
  \begin{bmatrix}
    -7 & 2  & 0 \\
    6  & -8 & 0 \\
    1  & 6  & 0 \\
  \end{bmatrix} \\ 
  \begin{bmatrix}
    -7 & 2  & 0 \\
    6  & -8 & 0 \\
    1  & 6  & 0 \\
  \end{bmatrix}
  &\xrightarrow{\text{Swap R0 and R2}}
  \begin{bmatrix}
    1  & 6  & 0 \\
    6  & -8 & 0 \\
    -7 & 2  & 0 \\
  \end{bmatrix} \\
  \begin{bmatrix}
    1  & 6  & 0 \\
    6  & -8 & 0 \\
    -7 & 2  & 0 \\
  \end{bmatrix}
  &\xrightarrow{R_1 \text{-=} 6R_0}
  \begin{bmatrix}
    1  & 6  & 0 \\
    (6-6*1)  & (-8-6*6) & (0-6*0) \\
    -7 & 2  & 0 \\
  \end{bmatrix}
  \xrightarrow{}
  \begin{bmatrix}
    1  & 6  & 0 \\
    0  & -44 & 0 \\
    -7 & 2  & 0 \\
  \end{bmatrix} \\
  \begin{bmatrix}
    1  & 6  & 0 \\
    0  & -44 & 0 \\
    -7 & 2  & 0 \\
  \end{bmatrix}
  &\xrightarrow{R_2 \text{+=} 7R_0}
  \begin{bmatrix}
    1  & 6  & 0 \\
    0  & -44 & 0 \\
    (-7+7*1) & (2+7*6)  & (0+7*0) \\
  \end{bmatrix}
  \xrightarrow{}
  \begin{bmatrix}
    1  & 6  & 0 \\
    0  & -44 & 0 \\
    0 & 44  & 0 \\
  \end{bmatrix}
\end{aligned}\]

And we can simplify this to:

\[
  \begin{bmatrix}
    1  & 0  & 0 \\
    0  & 1 & 0 \\
    0 & 0  & 0 \\
  \end{bmatrix}
\]

We can find the eigenvector by solving for \(x_1\), \(x_2\), and \(x_3\) which correspond to _healthy_, _sick_, and _dead_ respectively.

\[
  \begin{bmatrix}
    1  & 0  & 0 \\
    0  & 1 & 0 \\
    0 & 0  & 0 \\
  \end{bmatrix}
  \begin{bmatrix}
    x_1 \\ x_2 \\ x_3
  \end{bmatrix} =
  \mathbf{0}
\]

If we solve for the following system of equations, we see that the healthy and sick individual populations have to be zero and the dead population is a free variable. This makes sense because this is effectively saying that a stable populations is reached when everyone has died. So the eigenvector that represents our steady state is \(\begin{bmatrix}0&0&200\end{bmatrix}^{\top}\).

So what does this tell us?

In our expression,

\[
  \left(\begin{bmatrix}
    0.3 & 0.2 & 0.0 \\
    0.6 & 0.2 & 0.0 \\
    0.1 & 0.6 & 1.0 \\
  \end{bmatrix}\right)^{k}
  \begin{bmatrix}
    200 \\ 0 \\ 0
  \end{bmatrix}
\]

if \(k\) is large enough, it will eventually reach the eigenvector that represents our steady state.

This allows us to write a simple Python program to find the number of years it takes until only 10% of the population is alive and we know that it will eventually terminate.

```python
import numpy as np
def years_to_percent_alive(initial_population, percent):
  percent *= 0.01
  # Stochastic matrix
  m = np.array([
    [0.3, 0.2, 0.0],
    [0.6, 0.2, 0.0],
    [0.1, 0.6, 1.0],
  ])
  v = np.array([initial_population, 0, 0])
  result = [v]
  while (v[0] + v[1]) > initial_population * percent:
    v = m.dot(v)
    result.append(v)
  return result

for i, v in enumerate(years_to_percent_alive(200, 10)):
  print(f"Year: {i} - {v}")
```

Which outputs:

```
Year: 0 - [200   0   0]
Year: 1 - [ 60. 120.  20.]
Year: 2 - [42. 60. 98.]
Year: 3 - [ 24.6  37.2 138.2]
Year: 4 - [ 14.82  22.2  162.98]
Year: 5 - [  8.886  13.332 177.782]
Year: 6 - [  5.3322   7.998  186.6698]
```

So after about 5-6 years, only 20% of the population remains alive.

> I don't know how to make this calculation without a brute force approach, but I know there's a way.

### Problem 2

Given \(\mathbf{A}\) in a deformation \(\mathbf{y} = \mathbf{A} \mathbf{x}\), find the principal directions and corresponding factors of extension/contraction.

\[
  \mathbf{A} = \begin{bmatrix}
    3.0 & 1.5 \\
    1.5 & 3.0
  \end{bmatrix}
\]

{{<divider>}}

According to Wolfram Alpha, the eigenvalues of \(\mathbf{A}\) are \(\lambda = \{\frac{9}{2}, \frac{3}{2}\}\). These eigenvalues are the factors of extension.

Now we need to find the principal directions or with direction the deformation occurs. To do this, we need to calculate the corresponding eigenvectors of the factors of extension.

If we let \(\lambda = \frac{9}{2}\).

\[
  \mathbf{A} = \begin{bmatrix}
    3.0-\frac{9}{2} & 1.5 \\
    1.5 & 3.0-\frac{9}{2}
  \end{bmatrix}
\]

After row-reducing this becomes

\[
  \begin{bmatrix}
    1 & -1 \\
    0 & 0
  \end{bmatrix}
\]

So if we let \(x_1=1\) then \(x_2=1\), so a corresponding eigenvector is \(\begin{bmatrix}1 & 1\end{bmatrix}^{\top}\).

We can tell by looking at it, the angle it forms with the x-axis is 45°.

And we would do the same thing for \(\lambda = \frac{3}{2}\) where we would find an eigenvector of \(\begin{bmatrix}-1 & 1\end{bmatrix}^{\top}\) with an angle of 135°. This tells us, the deformation extends along the 45° and 135° line, but the extenion is greater along the 45° line.
