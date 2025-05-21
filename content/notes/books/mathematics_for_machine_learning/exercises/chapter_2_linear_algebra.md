+++
draft = false
title = 'Chapter 2: Linear Algebra'
readingTime = false
math = true
ToC = true
+++

## 2.1

We consider \((\mathbb{R} \setminus \{-1\}, \star)\), where

\[
  a \star b := ab + a + b, \qquad a,b \in \mathbb{R} \setminus \{-1\}
\]

### 2.1a

Show that \((\mathbb{R} \setminus \{-1\}, \star)\) is an [Abelian group](/notes/mathematics/definitions/abelian_group).

{{<divider>}}

In order to show that \((\mathbb{R} \setminus \{-1\}, \star)\) in an Abelian group, we need to first show that it fulfills the [conditions to be a group](/notes/mathematics/definitions/group#definition).

#### Proving that \(\star\) is closed under \(\mathbb{R} \setminus \{-1\}\)

Note that \(\star\) contains the operations of addition and multiplication. Because \(\mathbb{R}\) is a [ring](/notes/mathematics/definitions/ring), by definition \(\mathbb{R}\) is closed under addition and multiplication and thus closed under \(\star\).

However, we need to further prove that \(\star\) cannot produce \(-1\). We will prove this by contradiction.

Suppose \(a \star b = ab + a + b = -1\) for \(a,b \in \mathbb{R} \setminus \{-1\}\).


\[\begin{aligned}
  ab + a + b &= -1 \\
  ab + a + b + 1 &= 0 \\
  (a+1)(b+1) &= 0 \\
\end{aligned}\]

Note that for \(ab + a + b = -1\), both \(a\) and \(b\) must equal \(-1\). However, \(-1 \not \in \mathbb{R} \setminus \{-1\}\). So we proved that \(a \star b = ab + a + b \neq -1\) for \(a,b \in \mathbb{R} \setminus \{-1\}\) via contradiction, and thus \(\star\) is closed under \(\mathbb{R} \setminus \{-1\}\).

#### Proving that \(\star\) is associative under \(\mathbb{R} \setminus \{-1\}\)

We want to prove that \((a \star b) \star c = a \star (b \star c)\) for \(a,b,c \in \mathbb{R} \setminus \{-1\}\). We will prove this by changing the form of \((a \star b) \star c\) and \(a \star (b \star c)\) to be a sum of products and showing that they are equal.

##### \((a \star b) \star c\) (left side)

\[\begin{aligned}
(a \star b) \star c &= (ab + a + b) \star c
\end{aligned}\]

Let \(d = ab + a + b\) so that \((a \star b) \star c = d \star c\).

\[\begin{aligned}
(a \star b) \star c = d \star c &= dc + d + c \\
&= (ab + a + b)c + (ab + a + b) + c \\
&= abc + ac + bc + ab + a + b + c \\
&= \underline{abc + ab + ac + bc + a + b + c}
\end{aligned}\]

##### \(a \star (b \star c)\) (right side)

\[\begin{aligned}
a \star (b \star c) = a \star (bc + b + c)
\end{aligned}\]

Let \(e = bc + b + c\) so that \(a \star (b \star c) = a \star e\).

\[\begin{aligned}
a \star (b \star c) = a \star e &= ae + a + e \\
&= a(bc + b + c) + a + (bc + b + c) \\
&= abc + ab + ac + a + bc + b + c \\
&= \underline{abc + ab + ac + bc + a + b + c}
\end{aligned}\]

Thus, \((a \star b) \star c = a \star (b \star c)\).

#### Proving that \((\mathbb{R} \setminus \{-1\}, \star)\) has a neutral element

We want to show that \(\exists e \in \mathbb{R} \setminus \{-1\}, \: \forall x \in \mathbb{R} \setminus \{-1\}: x \star e = e \star x = x\).

Suppose \(e = 0\).

\[\begin{aligned}
x \star 0 &= (x \cdot 0) + x + 0 = x \\
0 \star x &= (0 \cdot x) + 0 + x = x
\end{aligned}\]

Therefore, \(\mathbb{R} \setminus \{-1\}\) has a neutral element.

#### Proving that \((\mathbb{R} \setminus \{-1\}, \star)\) has an inverse element

We want to show that \(\forall x \in \mathbb{R} \setminus \{-1\}, \: \exists y \in \mathbb{R} \setminus \{-1\}\) such that \(x \star y = y \star x = e\) where \(e = 0\) (as proven above).

We're first going to solve for the inverse element \(y\) and then substitute it back into the expression \(x \star y\) to prove that \(x \star y = 0\) is true.

##### Solving for the inverse element \(y\)

\[\begin{aligned}
x \star y = xy + x + y &= 0 \\
xy + y &= -x \\
y(x + 1) &= -x \\
y &= \frac{-x}{x+1}
\end{aligned}\]

##### Proving \(x \star y = 0\)

\[\begin{aligned}
x \star y = x \star \frac{-x}{x+1} &= 0 \\
x(\frac{-x}{x+1}) + x - \frac{x}{x+1} &= 0 \\
\frac{-x^2}{x+1} + \frac{x(x+1)}{x+1} - \frac{x}{x+1} &= 0 \\
-x^2 + x^2 + x - x &= 0 \\
0 = 0
\end{aligned}\]

> Note: for brevity, I am skipping the proof for \(y \star x = 0\).

Therefore, \(\mathbb{R} \setminus \{-1\}\) has an inverse element for every \(x \in \mathbb{R} \setminus \{-1\}\).

#### Proving \((\mathbb{R} \setminus \{-1\}, \star)\) is an Abelian group

Now that we have proven that \((\mathbb{R} \setminus \{-1\}, \star)\) is indeed a group, we can now determine whether it is Abelian. To do so, we need to show that \(a \star b = b \star a\) for all \(a,b \in \mathbb{R} \setminus \{-1\}\).

\[\begin{aligned}
a \star b &= ab + a + b \\
b \star a &= ba + b + a
\end{aligned}\]

Because \(\mathbb{R}\) is a [commutative ring](/notes/mathematics/definitions/commutative_ring), addition and multiplication are commutative, so \(\mathbb{R} \setminus \{-1\}\) is an Abelian group. \(\square\)

### 2.1b

Solve \(3 \star x \star x = 15\) in the Abelian group \((\mathbb{R} \setminus \{-1\}, \star)\).

{{<divider>}}

\[\begin{aligned}
  3 \star x \star x &= 15 \\
  (3x + 3 + x) \star x &= 15 \\
  (3x + 3 + x)x + (3x + 3 + x) + x &= 15 \\
  3x^2 + 3x + x^2 + 3x + 3 + x + x &= 15 \\
  4x^2 + 8x + 3 &= 15 \\
  4x^2 + 8x &= 12 \\
  x^2 + 2x &= 3 \\
  x^2 + 2x - 3 &= 0 \\
  (x+3)(x-1) &= 0 \\
  \fbox{x = \{-3, 1\}}
\end{aligned}\]

## 2.2 (in-progress)

{{<rawhtml>}}<div id="congruence-class-definition"></div>{{</rawhtml>}}

Let \(n\) be in \(\mathbb{N} \setminus \{0\}\). Let \(k,x \in \mathbb{Z}\). We define the [congruence class](/notes/mathematics/definitions/congruence_classes/) \(\bar{k}\) of the integer \(k\) as the set

\[\begin{aligned}
  \bar{k} &= \{x \in \mathbb{Z} \mid x - k = 0 \text{ (mod } \textit{n} \text{)}\} \\
  &= \{x \in \mathbb{Z} \mid (\exists a \in \mathbb{Z}): \: (x -k = n \cdot a)\}
\end{aligned}\]

We now define \(\mathbb{Z}/n\mathbb{Z}\) (sometimes written as \(\mathbb{Z}_n\)) as the set of all congruence classes modulo \(n\). Euclidean division implies that this set is a finite set containing \(n\) elements:

\[
  \mathbb{Z}_n = \{\bar{0}, \bar{1}, ..., \overline{n-1}\}
\]

For all \(\bar{a}, \bar{b} \in \mathbb{Z}_n\), we define

\[
  \bar{a} \oplus \bar{b} := \overline{a+b}
\]

### 2.2a

Show that \((\mathbb{Z}_n, \oplus)\) is a group. Is it Abelian?

{{<divider>}}

In order to show that \((\mathbb{Z}_n, \oplus)\) in an Abelian group, we need to first show that it is a group.

#### Intuiting congruence classes

> Congruence classes were a bit difficult for me to wrap my head around so I needed to write this section for myself. This is not required for proving that \((\mathbb{Z}_n, \oplus)\) is a group.

Let's try to look at congruence classes in a different way to get a better intuition of what they actually look like in practice. Let's consider the example:

\[
  \mathbb{Z}_4 = \{\bar{0}, \bar{1}, \bar{2}, \bar{3}\}
\]

In this example \(n = 4\). Let's look at the congruence class \(\bar{2}\). From the [definition of congruence classes](#congruence-class-definition), this looks like:

\[
  \bar{2} = \{x \in \mathbb{Z} \mid (\exists a \in \mathbb{Z}): \: (x - 2 = 4 \cdot a)\}
\]

Let's actually put some numbers in this set. As you can see, \(\bar{2}\) is an infinite set, so let's just start with \(a=\{1,2,3\}\).

\[\begin{aligned}
  \bar{2} &= \{..., \: 4 \cdot 1 + 2, \: 4 \cdot 2 + 2, \: 4 \cdot 3 + 2, \: ...\} \\
  &= \{..., \: 6, \: 10, \: 14, \: ...\}
\end{aligned}\]

Working from this example, we can see the general form.

{{<rawhtml>}}<div id="congruence-class-general-form"></div>{{</rawhtml>}}

\[\begin{aligned}
  \bar{k} &= \{..., \: n(-2)+k, \: n(-1)+k, \: n(0)+k, \: n(1)+k, \: n(2)+k, \: ...\} \\
  \bar{k} &= \{..., \: -2n+k, \: -n+k, \: k, \: n+k, \: 2n+k, \: ...\}
\end{aligned}\]

#### Proving \(\oplus\) is closed under \(\mathbb{Z}_n\)

To show that \(\oplus\) is closed under \(\mathbb{Z}_n\), we want to show that \((\bar{a} \oplus \bar{b}) \in \mathbb{Z}_n\).

From the [general form of the congruence class](#congruence-class-general-form), we can see that:

\[
  \bar{a} \oplus \bar{b} = \overline{a+b} = \{..., \: -2n+(a+b), \: -n+(a+b), \: a+b, \: n+(a+b), \: 2n+(a+b), \: ...\}
\]

Note, that \(\bar{a}, \bar{b} \in \mathbb{Z}_n \implies a,b \leq n-1\).

If \(a+b \leq n-1\), then \(\overline{a+b} \in \mathbb{Z}_n\). However, it may not be immediately obvious that \(\overline{a+b} \in \mathbb{Z}_n\) for \(a+b \geq n\). So we want to prove:
\[
a,b \in \mathbb{Z}_n, \: a+b \geq n \mid (\exists c \in \mathbb{Z}): \: c \lt n, \: \bar{c} = \overline{a+b}
\]

That is, for any set \(a+b \geq n \mid \overline{a+b}\), there is equivalent set \(\bar{c}\) where \(c \lt n\). 

Notice that the elements in the set \(\overline{a+b}\) differ by \(n\). So \(\exists x \in \mathbb{Z} \mid \overline{a+b} = \overline{a+b-xn}\) and \(a+b-xn \lt n\). Because we have shown that we can find an equivalent congruence class for any \(\overline{a+b}\) that is in \(\mathbb{Z}_n\), we have shown that \(\oplus\) is closed under \(\mathbb{Z}_n\).

#### Proving \(\oplus\) is associative under \(\mathbb{Z}_n\)

Addition is associative for \(\mathbb{Z}\) because \(\mathbb{Z}\) is a [commutative ring](/notes/mathematics/definitions/commutative_ring/#example), therefore \(\oplus\) (e.g. \(a \oplus b := \overline{a+b}\)) is associative under \(\mathbb{Z}_n\).

#### Proving that \((\mathbb{Z}_n, \oplus)\) has a neutral element

We want to show that \(\exists \bar{e} \in \mathbb{Z}_n, \forall \bar{k} \in \mathbb{Z}_n : \: \bar{k} \oplus \bar{e} = \bar{e} \oplus \bar{k} = \bar{k}\).

Consider \(\bar{e} = \bar{0}\).

\[
  \bar{k} \oplus \bar{0} = \bar{0} \oplus \bar{k} = \overline{k+0} = \bar{k}
\]

Therefore, the neutral element in \((\mathbb{Z}_n, \oplus)\) is \(\bar{0}\).

#### Proving that \(\mathbb{Z}_n, \oplus\) has an inverse element

> To-Do

## 2.3 (todo)

> To-Do

## 2.4

Compute the following matrix products, if possible:

### 2.4a

\[
\begin{bmatrix}
  1 & 2 \\
  3 & 4 \\
  7 & 8 
\end{bmatrix}
\begin{bmatrix}
  1 & 1 & 0 \\
  0 & 1 & 1 \\
  1 & 0 & 1 \\
\end{bmatrix}
\]

{{<divider>}}

Dimensions of matrices are incompatible because the number of columns in the left matrix does not equal the number of rows in the right matrix.

### 2.4b

\[
\begin{bmatrix}
1 & 2 & 3 \\
4 & 5 & 6 \\
7 & 8 & 9
\end{bmatrix}
\begin{bmatrix}
1 & 1 & 0 \\
0 & 1 & 1 \\
1 & 0 & 1
\end{bmatrix}
\]

{{<divider>}}

\[\begin{aligned}
  (0,0) &= 1 \cdot 1 + 2 \cdot 0 + 3 \cdot 1 = 1 + 0 + 3 = 4 \\
  (0,1) &= 1 \cdot 1 + 2 \cdot 1 + 3 \cdot 0 = 1 + 2 + 0 = 3 \\
  (0,2) &= 1 \cdot 0 + 2 \cdot 1 + 3 \cdot 1 = 0 + 2 + 3 = 5 \\
  \newline
  (1,0) &= 4 \cdot 1 + 5 \cdot 0 + 6 \cdot 1 = 4 + 0 + 6 = 10 \\
  (1,1) &= 4 \cdot 1 + 5 \cdot 1 + 6 \cdot 0 = 4 + 5 + 0 = 9  \\
  (1,2) &= 4 \cdot 0 + 5 \cdot 1 + 6 \cdot 1 = 0 + 5 + 6 = 11 \\
  \newline
  (2,0) &= 7 \cdot 1 + 8 \cdot 0 + 9 \cdot 1 = 7 + 0 + 9 = 16 \\
  (2,1) &= 7 \cdot 1 + 8 \cdot 1 + 9 \cdot 0 = 7 + 8 + 0 = 15 \\
  (2,2) &= 7 \cdot 0 + 8 \cdot 1 + 9 \cdot 1 = 0 + 8 + 9 = 17
\end{aligned}\]

\[\begin{bmatrix}
  4 & 3 & 5 \\
  10 & 9 & 11 \\
  16 & 15 & 17
\end{bmatrix}\]

### 2.4c

\[
\begin{bmatrix}
1 & 1 & 0 \\
0 & 1 & 1 \\
1 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
1 & 2 & 3 \\
4 & 5 & 6 \\
7 & 8 & 9
\end{bmatrix}
\]

{{<divider>}}

\[\begin{aligned}
  (0,0) &= 1 \cdot 1 + 1 \cdot 4 + 0 \cdot 7 = 1 + 4 + 0 = 5 \\
  (0,1) &= 1 \cdot 2 + 1 \cdot 5 + 0 \cdot 8 = 2 + 5 + 0 = 7 \\
  (0,2) &= 1 \cdot 3 + 1 \cdot 6 + 0 \cdot 9 = 3 + 6 + 0 = 9 \\
  \newline
  (1,0) &= 0 \cdot 1 + 1 \cdot 4 + 1 \cdot 7 = 0 + 4 + 7 = 11 \\
  (1,1) &= 0 \cdot 2 + 1 \cdot 5 + 1 \cdot 8 = 0 + 5 + 8 = 13 \\
  (1,2) &= 0 \cdot 3 + 1 \cdot 6 + 1 \cdot 9 = 0 + 6 + 9 = 15 \\
  \newline
  (2,0) &= 1 \cdot 1 + 0 \cdot 4 + 1 \cdot 7 = 1 + 0 + 7 = 8 \\
  (2,1) &= 1 \cdot 2 + 0 \cdot 5 + 1 \cdot 8 = 2 + 0 + 8 = 10 \\
  (2,2) &= 1 \cdot 3 + 0 \cdot 6 + 1 \cdot 9 = 3 + 0 + 9 = 12
\end{aligned}\]

\[\begin{bmatrix}
5 & 7 & 9 \\
11 & 13 & 15 \\
8 & 10 & 12
\end{bmatrix}\]

### 2.4c

\[
\begin{bmatrix}
1 & 2 & 1 & 2 \\
4 & 1 & -1 & -4
\end{bmatrix}
\begin{bmatrix}
0 & 3 \\
1 & -1 \\
2 & 1 \\
5 & 2
\end{bmatrix}
\]

{{<divider>}}

\[\begin{aligned}
(0,0) &= 1 \cdot 0 + 2 \cdot  1 +  1 \cdot 2 +  2 \cdot 5 = 0 + 2 + 2 + 10 = 14 \\
(0,1) &= 1 \cdot 3 + 2 \cdot -1 +  1 \cdot 1 +  2 \cdot 2 = 3 - 2 + 1 + 4 = 6 \\
(1,0) &= 4 \cdot 0 + 1 \cdot  1 + -1 \cdot 2 + -4 \cdot 5 = 0 + 1 - 2 - 20 = -21 \\
(1,1) &= 4 \cdot 3 + 1 \cdot -1 + -1 \cdot 1 + -4 \cdot 2 = 12 -1 - 1 - 8 = 2
\end{aligned}\]

\[\begin{bmatrix}
  14 & 6 \\
  -21 & 2
\end{bmatrix}\]

### 2.4e

\[
\begin{bmatrix}
0 & 3 \\
1 & -1 \\
2 & 1 \\
5 & 2
\end{bmatrix}
\begin{bmatrix}
1 & 2 & 1 & 2 \\
4 & 1 & -1 & -4
\end{bmatrix}
\]

{{<divider>}}

\[\begin{aligned}
(0,0) &= 0 \cdot 1 + 3 \cdot 4 = 12 \\
(0,1) &= 0 \cdot 2 + 3 \cdot 1 = 3 \\
(0,2) &= 0 \cdot 1 + 3 \cdot -1 = -3 \\
(0,3) &= 0 \cdot 2 + 3 \cdot -4 = -12 \\
\newline
(1,0) &= 1 \cdot 1 - 1 \cdot 4 = -3 \\
(1,1) &= 1 \cdot 2 - 1 \cdot 1 = 1 \\
(1,2) &= 1 \cdot 1 - 1 \cdot -1 = 2 \\
(1,3) &= 1 \cdot 2 - 1 \cdot -4 = 6 \\
\newline
(2,0) &= 2 \cdot 1 + 1 \cdot 4 = 6 \\
(2,1) &= 2 \cdot 2 + 1 \cdot 1 = 5 \\
(2,2) &= 2 \cdot 1 + 1 \cdot -1 = 1 \\
(2,3) &= 2 \cdot 2 + 1 \cdot -4 = 0 \\
\newline
(3,0) &= 5 \cdot 1 + 2 \cdot 4 = 13 \\
(3,1) &= 5 \cdot 2 + 2 \cdot 1 = 12 \\
(3,2) &= 5 \cdot 1 + 2 \cdot -1 = 3 \\
(3,3) &= 5 \cdot 2 + 2 \cdot -4 = 2
\end{aligned}\]

\[\begin{bmatrix}
  12 & 3 & -3 & -12 \\
  -3 & 1 & 2 & 6 \\
  6 & 5 & 1 & 0 \\
  13 & 12 & 3 & 2
\end{bmatrix}\]
