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

### Markov Process

Let's say we want to model how a certain species of bacteria can transition between different states of health. The bacteria can take on 3 states: 1) healthy, 2) sick, 3) dead. The following matrix represents the probability of transitioning the population of bacteria from one state to another state in 5 days.

\[
\left[\begin{array}{ccc|c}
\text{from healthy} & \text{from sick} & \text{from dead} & \\
\hline
0.80 & 0.10 & 0.0 & \text{to healthy} \\
0.15 & 0.60 & 0.0 & \text{to sick} \\
0.05 & 0.30 & 1.0 & \text{to dead}
\end{array}\right]
\]

\[
\begin{bmatrix}
  0.80 & 0.10 & 0.0 \\
  0.15 & 0.60 & 0.0 \\
  0.05 & 0.30 & 1.0
\end{bmatrix}
\]

This type of matrix is known as a [stocastic matrix](https://en.wikipedia.org/wiki/Stochastic_matrix) where all of the entries represent probabilities and the values in each column sum to 1. This is an example of a [Markov process](https://en.wikipedia.org/wiki/Markov_chain) which is a process where the probability of entering one state depends only on the last state.

Let's say we start with 1 billion healthy bacteria. What is the break down of bacteria expected to be healthy, sick and dead in 5 days?

\[
  \begin{bmatrix}
    0.80 & 0.10 & 0.0 \\
    0.15 & 0.60 & 0.0 \\
    0.05 & 0.30 & 1.0
  \end{bmatrix}
  \begin{bmatrix}
    1\mathrm{e}9 \\
    0 \\
    0
  \end{bmatrix}
\]
\[\begin{aligned}
  (0,0) &= 0.80 \cdot 1\mathrm{e}9 + 0 + 0 = 8\mathrm{e}8 \\
  (1,0) &= 0.15 \cdot 1\mathrm{e}9 + 0 + 0 = 15\mathrm{e}7 \\
  (2,0) &= 0.05 \cdot 1\mathrm{e}9 + 0 + 0 = 5\mathrm{e}7
\end{aligned}\]

- 800,000,000 are expected to be healthy.
- 150,000,000 are expected to sick.
- 50,000,000 are expected to be dead.

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
    4 + -4 + 0 = 0 \\
  (1,0) &=
    \begin{bmatrix}
      -2 & 1 & 6
    \end{bmatrix}
    \begin{bmatrix}
      1 \\ -2 \\ 0
    \end{bmatrix} =
    -2 \cdot 1 + 1 \cdot -2 + 6 \cdot 0 =
    -2 + -2 + 0 = -4 \\
  (2,0) &=
    \begin{bmatrix}
      1  & 2  & 2
    \end{bmatrix}
    \begin{bmatrix}
      1 \\ -2 \\ 0
    \end{bmatrix} =
    1 \cdot 1 + 2 \cdot -2 + 2 \cdot 0 =
    1 + -4 + 0 = -3
\end{aligned}\]
\[
  \mathbf{A}\mathbf{a}^{\top} = \begin{bmatrix}
    0 \\ -4 \\ 3
  \end{bmatrix}
\]

#### \((\mathbf{A}\mathbf{a})^{\top}\)

\((\mathbf{A}\mathbf{a})^{\top}\) is undefined because the number of columns in \(\mathbf{A}\) don't match the number of rows in \(\mathbf{a}\).

#### \(\mathbf{b}^{\top}\mathbf{A}^{\top}\)

\[
  \mathbf{A}^{\top} = \begin{bmatrix}
    4  & -2 & 1 \\
    -2 & 1  & 2 \\
    3  & 6  & 2
  \end{bmatrix},
  \mathbf{b}^{\top} = \begin{bmatrix}
    3 & 1 & -1
  \end{bmatrix}
\]
\[
 \mathbf{b}^{\top}\mathbf{A}^{\top} = 
  \begin{bmatrix}
    3 & 1 & -1
  \end{bmatrix}
  \begin{bmatrix}
    4  & -2 & 1 \\
    -2 & 1  & 2 \\
    3  & 6  & 2
  \end{bmatrix}
\]
\[\begin{aligned}
  (0,0) &=
    \begin{bmatrix}
      3 & 1 & -1
    \end{bmatrix}
    \begin{bmatrix}
      4 \\ -2 \\ 3
    \end{bmatrix} =
    3 \cdot 4 + 1 \cdot -2 + -1 \cdot 3 = 12 + -2 + -3 = 7 \\
  (0,1) &= 
    \begin{bmatrix}
      3 & 1 & -1
    \end{bmatrix}
    \begin{bmatrix}
     -2 \\ 1 \\ 6
    \end{bmatrix} =
    3 \cdot -2 + 1 \cdot 1 + -1 \cdot 6 = -6 + 1 + -6 = -11 \\
  (0,2) &=
    \begin{bmatrix}
      3 & 1 & -1
    \end{bmatrix}
    \begin{bmatrix}
     1 \\ 2 \\ 2
    \end{bmatrix} =
    3 \cdot 1 + 1 \cdot 2 + -1 \cdot 2 = 3 + 2 + -2 = 3
\end{aligned}\]
\[
  \mathbf{b}^{\top}\mathbf{A}^{\top} = \begin{bmatrix}
    7 & -11 & 3
  \end{bmatrix}
\]

### Problem 3

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
  \mathbf{a} = \begin{bmatrix}
    1 & -2 & 0
  \end{bmatrix},
  \mathbf{b} = \begin{bmatrix}
    3 \\ 1 \\ -1
  \end{bmatrix}
\]

Solve for

\[
  1.5\mathbf{a} + 3.0\mathbf{b}, 1.5\mathbf{a}^{\top} + 3.0\mathbf{b}, (\mathbf{A}-\mathbf{B})\mathbf{b}, \mathbf{A}\mathbf{a} - \mathbf{B}\mathbf{b}
\]

{{<divider>}}

> Skipping due to lack of time. Maybe I'll come back and do it but probably not.

#### Problem 4

Write a program for a Markov process to calculate further steps for the [bacteria example](#markov-process) above.

```python
import numpy as np
def bacteria_markov_process(starting_population, iterations):
  stochastic_matrix = np.array([
    [ 0.8, 0.1, 0.0 ],
    [ 0.15, 0.60, 0.0],
    [ 0.05, 0.30, 1.0],
  ])
  current_population = np.array([
    [starting_population],
    [0],
    [0],
  ])

  for i in range(iterations):
    current_population = stochastic_matrix @ current_population
  return current_population

print(bacteria_markov_process(1e9, 1))
```
