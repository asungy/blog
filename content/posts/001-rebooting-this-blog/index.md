+++
title = "rebooting this blog"
# Run the following command to generate the current date: `date -u +"%Y-%m-%dT%H:%M:%SZ"`
date = "2025-04-10T22:56:12-04:00"
author = "Alek Sung"
cover = ""
tags = ["linear-algebra", "beginner"]
description = "testing mathjax with some math notes"
showFullContent = false
readingTime = true
hideComments = false
ToC = false
math = true
+++

Yesterday, I got accepted into the Artificial Intelligence Master's program at Johns Hopkins University. While I feel that the significance of higher education has deterioted over time, this moment was nevertheless very important to me. To me, it marked a second chance at what I would consider many missed opportunities during my undergraduate years about a decade ago. Now at 30, I feel that I have the experience to appreciate the time and energy it takes to learn something well and the maturity to understand the fortune that has presented itself before me.

That being said, I'm rebooting this blog to serve as a repository of my notes as I go through the program. As I'm refamiliarizing myself with this blog, I realize that it currently doesn't support MathJax or any sort of mathematical notation. Given that AI can get pretty mathy, I figure I better do something about this. According to [this page](https://gohugo.io/content-management/mathematics/), it seems pretty straightforward, so the following will be some notes about introductory linear algebra to test that the changes I make to this blog actually work (and to also refresh my LaTeX skills).

---

So what is _linear algebra_? Well, as I understand it, it's a branch of mathematics that involves solving problems with vectors and matrices and from the things I hear, it's apparently pretty important to AI. So I'm assuming I should get pretty comfortable with the topic.

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

### Definition 1.1

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

