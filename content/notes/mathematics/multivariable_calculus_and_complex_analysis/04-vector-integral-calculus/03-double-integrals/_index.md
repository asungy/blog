+++
draft = false
title = '03 -  Double Integrals'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

## Exercises

### Problem 1

Evaluate:

\[
  \int_{0}^{1}\int_{x^2}^{x} \left(1-2xy\right)\,dy\,dx
\]

{{<divider>}}

Integrate w.r.t. \(y\).

Treat \(x\) as constant:

\[
\int_{x^2}^{x} \left(1 - 2xy\right) dy
= \left[ y - x y^2 \right]_{x^2}^{x}
\]

Evaluate:

- At \(y = x \Rightarrow x - x \cdot x^2 = x - x^3\)
- At \(y = x^2 \Rightarrow x^2 - x \cdot x^4 = x^2 - x^5\)

Now subtract:

\[
(x - x^3) - (x^2 - x^5) = x - x^3 - x^2 + x^5 = x - x^2 - x^3 + x^5
\]

Now integrate w.r.t. \(x\):

\[
\int_0^1 \left( x - x^2 - x^3 + x^5 \right) dx
= \int_0^1 x\,dx - \int_0^1 x^2\,dx - \int_0^1 x^3\,dx + \int_0^1 x^5\,dx
\]

Use basic power rule:

\[
= \left[\frac{x^2}{2}\right]_0^1 - \left[\frac{x^3}{3}\right]_0^1 - \left[\frac{x^4}{4}\right]_0^1 + \left[\frac{x^6}{6}\right]_0^1
= \frac{1}{2} - \frac{1}{3} - \frac{1}{4} + \frac{1}{6}
\]

Compute:

\[
= \left(\frac{1}{2} + \frac{1}{6}\right) - \left( \frac{1}{3} + \frac{1}{4} \right)
= \frac{2}{3} - \frac{7}{12} = \frac{8}{12} - \frac{7}{12} = \frac{1}{12}
\]

Final Answer:

\[
\boxed{\frac{1}{12}}
\]

### Problem 2

Find the volume of the region of space beneath \(z = 4x^2+9y^2\) and above the rectangle with vertices \((0,0)\), \((3,0)\), \((3,2)\), and \((0,2)\) in the \(xy\)-plane.

{{<divider>}}

We are asked to find the **volume under the surface**:

\[
z = 4x^2 + 9y^2
\]

and **above the rectangle** in the \(xy\)-plane with vertices:

\[
(0,0), \; (3,0), \; (3,2), \; (0,2)
\]

We are integrating \(z = 4x^2 + 9y^2\) over the rectangle:

- \(x \in [0, 3]\)
- \(y \in [0, 2]\)

The volume is:

\[
V = \int_{x=0}^{3} \int_{y=0}^{2} (4x^2 + 9y^2) \, dy\, dx
\]

Integrate with respect to \(y\) first.

\[
\int_{0}^{2} (4x^2 + 9y^2) \, dy
= 4x^2 \int_0^2 dy + 9 \int_0^2 y^2 \, dy
= 4x^2 [y]_0^2 + 9 \left[ \frac{y^3}{3} \right]_0^2
= 4x^2(2) + 9\left( \frac{8}{3} \right) = 8x^2 + \frac{72}{3} = 8x^2 + 24
\]

Integrate with respect to \(x\).

\[
\int_{0}^{3} \left(8x^2 + 24\right) dx
= 8 \int_0^3 x^2 dx + 24 \int_0^3 dx
= 8 \cdot \left[ \frac{x^3}{3} \right]_0^3 + 24 \cdot [x]_0^3
= 8 \cdot \frac{27}{3} + 24 \cdot 3 = 72 + 72 = 144
\]

Final Answer:

\[
\boxed{144}
\]
