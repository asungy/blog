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

{{<rawhtml>}}<hr style="width: 50%; margin: 0 auto;">{{</rawhtml>}}

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

{{<rawhtml>}}<hr style="width: 50%; margin: 0 auto;">{{</rawhtml>}}

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
