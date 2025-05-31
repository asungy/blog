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

Based on theorem 3 in chapter 8.1 from our readings, we know that a matrix and its transpose have the same eigenvalues. Because each of this matrix's columns sum to 1, we know that it has an eigenvalue of 1.

<!-- TODO: Show this. -->

But what is the significance of this eigenvalue and why can we expect this matrix to have only one eigenvalue and one distinct eigenvector?

If we imagine our vector space as a 3D space where vectors can describe any combination of healthy, sick, and dead populations then we can think of the eigenvalue as helping us create a transformation matrix to collapse that 3D vector space into some 2D space (or a line). Now, there exists a vector in the 3D vector space that when this collapse happens from 3D to 2D space, this vector already exists in that 2D dimensional space (i.e. during the transformation it maintains the same direction). Actually, because the eigenvalue of this matrix is 1, this vector doesn't change at all. This is vector is called the eigenvector.

But what is this eigenvector telling us? It's saying there is some combination of healthy, sick, and dead people where our stochastic matrix won't have any affect when it is multiplied by this eigenvector. This represents a state of stability in our system.

---

<!-- TODO: Actually try to solve for the eigenvector and prove this point. -->

But let's be thorough and make sure we have a defective matrix of 2, that is, a matrix with a triple eigenvalue, but one distinct eigenvector. We can expect this to be the case because people in the population aren't disappearing or reproducing and thus the population vector is not expected to scale in any way.
