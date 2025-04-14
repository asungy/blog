+++
title = "First linear algebra notes"
# Run the following command to generate the current date: `date -u +"%Y-%m-%dT%H:%M:%SZ"`
date = "2025-04-10T22:56:12-04:00"
author = "Alek Sung"
cover = ""
tags = ["linear-algebra", "beginner"]
description = "Doing some introductory linear algebra review (and MathJax testing)."
showFullContent = false
readingTime = true
hideComments = false
ToC = true
math = true
+++

Yesterday, I got accepted into the Artificial Intelligence Master's program at Johns Hopkins University. While I feel that the significance of higher education has deterioted over time, this moment was nevertheless very important to me. To me, it marked a second chance at what I would consider many missed opportunities during my undergraduate years about a decade ago. Now at 30, I feel that I have the experience to appreciate the time and energy it takes to learn something well and the maturity to understand the fortune that has presented itself before me.

That being said, I'm ~~starting~~ rebooting this blog to serve as a repository of my notes as I go through the program. As I'm refamiliarizing myself with this blog, I realize that it currently doesn't support MathJax or any sort of mathematical notation. Given that AI can get pretty mathy, I figure I better do something about this. According to [this page](https://gohugo.io/content-management/mathematics/), it seems pretty straightforward, so the following will be some notes about introductory linear algebra to test that the changes I make to this blog actually work (and to also refresh some math and LaTeX skills).

---

So what is _linear algebra_? Well, as I understand it, it's a branch of mathematics that involves solving problems with vectors and matrices and from the things I hear, it's apparently pretty important to AI. So I'm assuming I should get pretty comfortable with the topic.

> Note: I will be using [_Mathematics for Machine Learning_](https://mml-book.com/) to drive most of the notes.

## Vectors

Alright, let's start with _vectors_. So there's a computer science definition and a physics definition where the former can be thought of as an array of values (say, in memory) and the latter is depicted as an arrow on a grid with angle and magnitude. But I like the mathematical definition that says vectors are mathematical objects that can be added together and multiplied by scalars to produce another mathematical object of the same kind. Simple and clean.

I don't really need to show this, but for thoroughness a vector can be depicted in the following forms:

\[
\vec{v} = \begin{bmatrix} 3 & -2 & 5 \end{bmatrix} = \begin{bmatrix} 3 \\ -2 \\ 5 \end{bmatrix}
\]

Like I mentioned before, you can add them:

\[
\begin{bmatrix} 1 \\ 2 \\ 3 \end{bmatrix} + \begin{bmatrix} 4 \\ 5 \\ 6 \end{bmatrix} = \begin{bmatrix} 5 \\ 7 \\ 9 \end{bmatrix}
\]

And you can multiply a vector by a scalar:

\[
2 \cdot \begin{bmatrix} 3 \\ -1 \\ 4 \end{bmatrix} = \begin{bmatrix} 6 \\ -2 \\ 8 \end{bmatrix}
\]

Okay, I think that's enough about vectors. Let's move onto matrices.

> One last thing about vectors: you can't add vectors of different sizes.
>
> Example:
> 
> \[
\begin{bmatrix} 1 \\ 5 \\ 9 \\ 7 \end{bmatrix} + \begin{bmatrix} 3 \\ -1 \\ 4 \end{bmatrix} = \text{???}
\]

## Matrices

What is a _matrix_? Well they are kind of similar to vectors, but with a bit more dimensionality. Where a vector can be described as 1-dimensional, a matrix is 2-dimensional.

Let's add a little bit more formalism:

> For \(m,n \in \mathbb{N}\), _matrix_ \(\textbf{A}\) is an \(m,n\)-tuple of elements \(a_{ij}, i=1, \ldots, m, j=1, \ldots, n\) that follow the matrix notation consisting of \(m\) rows and \(n\) columns:
>
> \[
\textbf{A} = 
\begin{bmatrix}
a_{11} & a_{12} & \cdots & a_{1n} \\
a_{21} & a_{22} & \cdots & a_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mn}
\end{bmatrix}
\]

Like vectors, you can add two matrices of the same cardinality (e.g. \(\textbf{A}\) and \(\textbf{B}\) can be added together if \(A \in \mathbb{R}^{m \times n}\) and \(B \in \mathbb{R}^{m \times n}\)):

\[
\begin{bmatrix}
1 & 2 & 3\\
4 & 5 & 6 \\
7 & 8 & 9
\end{bmatrix}
\ + \
\begin{bmatrix}
5 & 6 & 7 \\
8 & 9 & 10 \\
11 & 12 & 13
\end{bmatrix}
\ = \
\begin{bmatrix}
6 & 8 & 10 \\
12 & 14 & 16 \\
18 & 20 & 22
\end{bmatrix}
\]

However, unlike vectors, matrices can be multiplied by each other but only if they fulfill the condition that:

> If \(\textbf{A}\) is a \(n \times m\) matrix and \(\textbf{B}\) is a \(m \times n\) matrix, then the product of \(\textbf{A}\) and \(\textbf{B}\) will result in a \(n \times n\) matrix.

Here's an example:

\[
\begin{bmatrix} 1 & 2 & 3 \\ 3 & 2 & 1 \end{bmatrix} \begin{bmatrix} 0 & 2 \\ 1 & -1 \\ 0 & 1 \end{bmatrix} = \begin{bmatrix} 2 & 3 \\ 2 & 5 \end{bmatrix}
\]

And we can see here that matrix multiplication is not commutative:

\[
\begin{bmatrix} 0 & 2 \\ 1 & -1 \\ 0 & 1 \end{bmatrix} \begin{bmatrix} 1 & 2 & 3 \\ 3 & 2 & 1 \end{bmatrix} = \begin{bmatrix} 6 & 4 & 2 \\ -2 & 0 & 2 \\ 3 & 2 & 1 \end{bmatrix}
\]

Some other topics that I won't cover, but might be worth refreshing on are:

- [identity matrix](https://en.wikipedia.org/wiki/Identity_matrix)
- [invertible matrix](https://en.wikipedia.org/wiki/Invertible_matrix)
- [transpose of a matrix](https://en.wikipedia.org/wiki/Transpose)

## Systems of Linear Equations

Now that we have a decent idea of how matrices and vectors work, we can start looking into how they are used to represent a system of linear equations. Let's take the following example:

\[
\begin{aligned}
-2x_1 + 4x_2 - 2x_3 - x_4 + 4x_5 &= -3 \\
4x_1 - 8x_2 + 3x_3 - 3x_4 + x_5 &= 2 \\
x_1 - 2x_2 + x_3 - x_4 + x_5 &= 0 \\
x_1 - 2x_2 -3x_4 + 4x_5 &= a
\end{aligned}
\]

This can be represented by the following augmented matrix:

\[
\left[\begin{array}{ccccc|c}
-2 & 4 & -2 & -1 & 4 & -3 \\
4 & -8 & 3 & -3 & 1 & 2 \\
1 & -2 & 1 & -1 & 1 & 0 \\
1 & -2 & 0 & -3 & 4 & a
\end{array}\right]
\]

If we want to solve this system of linear equations, it is best to convert it to a form called _row-echelon form_ which just makes doing the calculations a bit more convenient.

> A matrix is in _row-echelon form_ if:
>
> 1. All zero rows are at the bottom.
> 2. The leading entry (pivot) in each non-zero row is 1. \*
> 3. Each leading 1 is to the right of the leading 1 in the row above.
> 4. Each below each leading 1 are all zeros.
>
> Example:
>
> \[
\begin{bmatrix}
1 & 2 & 0 \\
0 & 1 & 3 \\
0 & 0 & 0
\end{bmatrix}
\]
> \* According to [Wikipedia](https://en.wikipedia.org/wiki/Row_echelon_form#(General)_row_echelon_form), this requirement can float between the general row-echelon form and the reduced row-echelon form.

And while talking about row-echelon form, we might as well mention _reduced row-echelon form_:

> A matrix is in _reduced row echelon form_ if:
>
> 1. All row-echolon form rules are satisfied.
> 2. Each leading 1 is the only non-zero entry in the column.
>
> Example:
>
> \[
\begin{bmatrix}
1 & 0 & -6 \\
0 & 1 & 3  \\
0 & 0 & 0
\end{bmatrix}
\]

Anyway, back to our problem. We want to convert this to row-echelon form. Let's start with getting a 1 in the top left corner. We can do this by swapping rows 1 and 3:

\[
\left[\begin{array}{ccccc|c}
-2 & 4 & -2 & -1 & 4 & -3 \\
4 & -8 & 3 & -3 & 1 & 2 \\
1 & -2 & 1 & -1 & 1 & 0 \\
1 & -2 & 0 & -3 & 4 & a
\end{array}\right]
\quad \xrightarrow{\text{Swap } R_1 \text{ and } R_3} \quad
\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
4 & -8 & 3 & -3 & 1 & 2 \\
-2 & 4 & -2 & -1 & 4 & -3 \\
1 & -2 & 0 & -3 & 4 & a
\end{array}\right]
\]

Now we're going to use the top row and combine it with the remaining rows so the rows 2, 3, and 4 start with a 0:

\[
\begin{aligned}
\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
4 & -8 & 3 & -3 & 1 & 2 \\
-2 & 4 & -2 & -1 & 4 & -3 \\
1 & -2 & 0 & -3 & 4 & a
\end{array}\right]
\quad \xrightarrow{R_2 \to R_2 - 4R_1} \quad
&\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
(4-4) & (-8+8) & (3-4) & (-3+4) & (1-4) & (2-0) \\
-2 & 4 & -2 & -1 & 4 & -3 \\
1 & -2 & 0 & -3 & 4 & a
\end{array}\right] \\
\\=
&\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & -1 & 1 & -3 & 2 \\
-2 & 4 & -2 & -1 & 4 & -3 \\
1 & -2 & 0 & -3 & 4 & a
\end{array}\right]
\end{aligned}
\]

\[
\begin{aligned}
\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & -1 & 1 & -3 & 2 \\
-2 & 4 & -2 & -1 & 4 & -3 \\
1 & -2 & 0 & -3 & 4 & a
\end{array}\right]
\quad \xrightarrow{R_3 \to R_3 + 2R_1} \quad
&\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & -1 & 1 & -3 & 2 \\
(-2+2) & (4-4) & (-2+2) & (-1-2) & (4+2) & (-3+0) \\
1 & -2 & 0 & -3 & 4 & a
\end{array}\right] \\
\\=
&\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & -1 & 1 & -3 & 2 \\
0 & 0 & 0 & -3 & 6 & -3 \\
1 & -2 & 0 & -3 & 4 & a
\end{array}\right]
\end{aligned}
\]

\[
\begin{aligned}
\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & -1 & 1 & -3 & 2 \\
0 & 0 & 0 & -3 & 6 & -3 \\
1 & -2 & 0 & -3 & 4 & a
\end{array}\right]
\quad \xrightarrow{R_4 \to R_4 - R_1} \quad
&\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & -1 & 1 & -3 & 2 \\
0 & 0 & 0 & -3 & 6 & -3 \\
(1-1) & (-2+2) & (0-1) & (-3+1) & (4-1) & (a-0)
\end{array}\right] \\
\\=
&\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & -1 & 1 & -3 & 2 \\
0 & 0 & 0 & -3 & 6 & -3 \\
0 & 0 & -1 & -2 & 3 & a
\end{array}\right]
\end{aligned}
\]

Now that we have the top row leading with a 1 and all zeros below, we can move on and try to do the same for second column. But we quickly notice that no matter how we arrange and combine the rows, we cannot construct a row where there is a leading 1 in the second column, so we need to move onto column 3. The third row already how a zero in the third column and all we need to do is to get the last row's third number to be 0 (note: the second row's leading 1 is negative. We ultimately want this to be a positive 1, but I'll handle that later).

\[
\begin{aligned}
\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & -1 & 1 & -3 & 2 \\
0 & 0 & 0 & -3 & 6 & -3 \\
0 & 0 & -1 & -2 & 3 & a
\end{array}\right]
\quad \xrightarrow{R_4 \to R_4 - R_2} \quad
&\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & -1 & 1 & -3 & 2 \\
0 & 0 & 0 & -3 & 6 & -3 \\
(0-0) & (0-0) & (-1+1) & (-2-1) & (3+3) & (a-2)
\end{array}\right]
\\=
&\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & -1 & 1 & -3 & 2 \\
0 & 0 & 0 & -3 & 6 & -3 \\
0 & 0 & 0 & -3 & 6 & a-2
\end{array}\right]
\end{aligned}
\]

The next step is to get the leading 1 in row 3 and a zero below it in row 4. We can get the zero in row 4 by subtracting by row 3:
\[
\begin{aligned}
\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & -1 & 1 & -3 & 2 \\
0 & 0 & 0 & -3 & 6 & -3 \\
0 & 0 & 0 & -3 & 6 & a-2
\end{array}\right]
\quad \xrightarrow{R_4 \to R_4 - R_3} \quad
&\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & -1 & 1 & -3 & 2 \\
0 & 0 & 0 & -3 & 6 & -3 \\
(0-0) & (0-0) & (0-0) & (-3+3) & (6-6) & (a-2+3)
\end{array}\right]
\\=
&\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & -1 & 1 & -3 & 2 \\
0 & 0 & 0 & -3 & 6 & -3 \\
0 & 0 & 0 & 0 & 0 & a+1
\end{array}\right]
\end{aligned}
\]

We just tidy this up and make sure all leading non-zero values are 1. We can do this by multiplying the second row by -1 and dividing the third row by -3. This gets us:

\[
\left[\begin{array}{ccccc|c}
1 & -2 & 1 & -1 & 1 & 0 \\
0 & 0 & 1 & -1 & 3 & -2 \\
0 & 0 & 0 & 1 & -2 & 1 \\
0 & 0 & 0 & 0 & 0 & a+1
\end{array}\right]
\]

Now this is matrix is in row-echelon form.

> At this point, I was a little confused why this example was using the variable \(a\) instead of a constant value, but I think (though not certain) it just allows the example to have 4 equations, 5 unknowns and allow the numbers to work out relatively nicely.
>
> Note that this system can only be solved if \(a=1\).

We ultimately want to find a _general solution_ for this matrix which involves finding a _particular solution_ (\(\textbf{Ax}=\textbf{b}\)) and all solutions to \(\textbf{Ax}=\textbf{0}\).

Taking our augmented matrix, our system of linear equations looks like:

\[
\begin{aligned}
x_1 - 2x_2 + x_3 - x_4 + x_5 &= 0 \\
x_3 - x_4 + 3x_5 &= -2 \\
x_4 - 2x_5 &= 1 \\
0 &= a + 1
\end{aligned}
\]

To find a particular solution, we can make it easy on ourselves and set \(x_2\) and \(x_5\) to zero (because there isn't equation in the system where they have a non-zero, leading coefficient or _pivot_). We will be sure to capture them in the solutions to \(\textbf{Ax}=\textbf{0}\). This simplifies our system to:

\[
\begin{aligned}
x_1 + x_3 - x_4 &= 0 \\
x_3 - x_4 &= -2 \\
x_4 &= 1
\end{aligned}
\]

This makes it easy to see that our particular solution is:

\[
\left[\begin{array}{c}
x_1 \\ x_2 \\ x_3 \\ x_4 \\ x_5
\end{array}\right]
\\=
\left[\begin{array}{c}
2 \\ 0 \\ -1 \\ 1 \\ 0
\end{array}\right]
\]

Now we need to go back and find solutions for the variables we trivially set to 0 (namely \(x_2\) and \(x_5\)).

Let's start with \(x_2\). First we need to express the second column as columns 1, 3, and 4:

\[
\left[\begin{array}{c}
-2 \\ 0 \\ 0 \\ 0
\end{array}\right]
\\=
-2\left[\begin{array}{c}
1 \\ 0 \\ 0 \\ 0
\end{array}\right]
+
0\left[\begin{array}{c}
1 \\ 1 \\ 0 \\ 0
\end{array}\right]
+
0\left[\begin{array}{c}
-1 \\ -1 \\ 1 \\ 0
\end{array}\right]
\]

Next we substitute our new second column so we have the following for generating a 0-set:

\[
\textbf{0} = -2\left[\begin{array}{c} 1 \\ 0 \\ 0 \\ 0 \end{array}\right] - \left[\begin{array}{c} -2 \\ 0 \\ 0 \\ 0 \end{array}\right] + 0\left[\begin{array}{c} 1 \\ 1 \\ 0 \\ 0 \end{array}\right] + 0\left[\begin{array}{c} -1 \\ -1 \\ 0 \\ 0 \end{array}\right] + 0\left[\begin{array}{c} 1 \\ 3 \\ -2 \\ 0 \end{array}\right]
\]

This gives us the solution:

\[
\left[\begin{array}{c}
x_1 \\ x_2 \\ x_3 \\ x_4 \\ x_5
\end{array}\right]
\\=
\left[\begin{array}{c}
-2 \\ -1 \\ 0 \\ 0 \\ 0
\end{array}\right]
\]

Note that for \(\lambda_1 \in \mathbb{R}\) (i.e. any scaling factor), the following remains true:

\[
\left[\begin{array}{}
1 & -2 & 1 & -1 & 1 \\
0 & 0 & 1 & -1 & 3 \\
0 & 0 & 0 & 0 & -2 \\
0 & 0 & 0 & 0 & 0
\end{array}\right]
\left(
\lambda_1
\left[\begin{array}{}
-2 \\ -1 \\ 0 \\ 0 \\ 0
\end{array}\right]
\right)
\\=
\textbf{0}
\]

We can go through a similar process for \(x_5\):

\[
\left[\begin{array}{}
1 \\ 3 \\ -2 \\ 0
\end{array}\right]
\\=
2\left[\begin{array}{}
1 \\ 0 \\ 0 \\ 0
\end{array}\right]
+0\left[\begin{array}{}
-2 \\ 0 \\ 0 \\ 0
\end{array}\right]
-\left[\begin{array}{}
-1 \\ -1 \\ 0 \\ 0
\end{array}\right]
+2\left[\begin{array}{}
-1 \\ -1 \\ 1 \\ 0
\end{array}\right]
\]

which gives us:

\[
\textbf{0} = 2\left[\begin{array}{c} 1 \\ 0 \\ 0 \\ 0 \end{array}\right] + 0\left[\begin{array}{c} -2 \\ 0 \\ 0 \\ 0 \end{array}\right] - 1\left[\begin{array}{c} 1 \\ 1 \\ 0 \\ 0 \end{array}\right] + 2\left[\begin{array}{c} -1 \\ -1 \\ 0 \\ 0 \end{array}\right] + 1\left[\begin{array}{c} 1 \\ 3 \\ -2 \\ 0 \end{array}\right]
\]

\[
\left[\begin{array}{}
1 & -2 & 1 & -1 & 1 \\
0 & 0 & 1 & -1 & 3 \\
0 & 0 & 0 & 0 & -2 \\
0 & 0 & 0 & 0 & 0
\end{array}\right]
\left(
\lambda_2
\left[\begin{array}{}
2 \\ 0 \\ -1 \\ 2 \\ 1
\end{array}\right]
\right)
\\=
\textbf{0} ; \lambda_2 \in \mathbb{R}
\]

So the _general solution_ that captures the set of all possible solutions is:

\[
\left\{
\textbf{x} \in \mathbb{R}^5: \textbf{x} = \left[\begin{array}{}2 \\ 0 \\ -1 \\ 1 \\ 0 \end{array}\right] + \lambda_1 \left[\begin{array}{}2 \\ 1 \\ 0 \\ 0 \\ 0 \end{array}\right] + \lambda_2 \left[\begin{array}{}2 \\ 0 \\ -1 \\ 2 \\ 1 \end{array}\right]; \lambda_1, \lambda_2 \in \mathbb{R}
\right\}
\]

---

This was a bit tedious to do and wouldn't scale well to millions of elements. Hopefully in a future post I can explore some algorithms to computationally solve systems of linear equations in a reasonable amount of time.
