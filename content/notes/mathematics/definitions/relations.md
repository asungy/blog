+++
draft = false
title = 'Relations'
readingTime = false
math = true
+++

## Definition

Let \(S\) and \(T\) be sets. Then a **relation** from \(S\) to \(T\) is a subset \(\rho\) of {{<rawhtml>}}<a href="/notes/mathematics/definitions/cartesian_product/">\(S \times T\)</a>{{</rawhtml>}}. If \(s \in S\) and \(t \in T\), then we write \(s \rho t\) if \((s,t) \in \rho\); otherwise, we write \(s \not\rho t\).

> Informally: A _relation_ is some kind of relationship between two objects in a set.

## Example

Let \(S = \{1,2,3\}\) and \(T = \{1,2,3,4\}\). Define a relation \(\rho\) from \(S\) to \(T\) via \(s \rho t\) if and only if \(st^2 \le 4\). Then \(\rho = \{(1,1), (1,2), (2,1), (3,1)\}\).

## Source
<!-- Author(s). Title of Textbook. Edition (if applicable). Publisher, Year. Page(s) used. -->
Gregory T. Lee. Abstract Algebra. 1st ed. Springer Cham, 2018. pp. 5.
