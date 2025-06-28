+++
draft = false
title = '06 - Surface Integrals'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

> 10.6 – 3, 13

## Exercises

### Problem 1

Evaluate

\[
  \int_{S}\int \mathbf{F} \cdot \mathbf{n}\,dA = \int_{R}\int \mathbf{F}(\mathbf{r}(u,v)) \cdot \mathbf{N}(u,v)\,du\,dv
\]

when \(\mathbf{F} = \left[x^2,\,0,\,3y^2\right]\) and \(S\) is the portion of the plane \(x+y+z=1\) in the first octant.

{{<image src="./problem1.png" width="20%" height="20%">}}

{{<divider>}}

We are going to work on developing and evaluating the left-side of the equation \(\int_{R}\int \mathbf{F}(\mathbf{r}(u,v)) \cdot \mathbf{N}(u,v)\,du\,dv\).

The first thing we need to do is parameterize the surface \(S = x + y + z = 1\) in terms of \(u\) and \(v\).

Let,

- \(x = u\)
- \(y = v\)
- \(z = 1-x-y = 1-u-v\)

So we have

\[
  \mathbf{r}(u,v) = \left[u,\,v,\,1-u-v\right]
\]

Note that at this step, we should also determine the bounds that we are integrating over for \(u\) and \(v\). Based on \(S\) and the image, we know we have a plane restricted to the first quadrant. If we look at \(\int_{R}\int \mathbf{F}(\mathbf{r}(u,v)) \cdot \mathbf{N}(u,v)\,du\,dv\), we notice that the outer integration is \(v\) which is a parameter for \(y\), so we need to make sure our bounds are independent of any of the other variables. If we set \(z = 0\), we can see in the image that the bounds on the \(xy\)-plane is \(x+y=1\). \(x\) cannot be negative, so we know that \(0 \leq y \leq 1\).

Now, we need to determine the bounds for inner integration with respect to \(u\). \(u=x\) and just like \(y\) is restricted to the same plane when \(z=0\). In theory we know that \(0 \leq x \leq 1\), but we need to make sure this bounds is dependent on \(y\) because the bounds \(x+y=1\) makes \(x\) dependent on \(y\). The bounds for \(x\) would be \(0 \leq x \leq 1-y\).

So we have the bounds:
- \(0 \leq x \leq 1-y\)
- \(0 \leq y \leq 1\)

In terms of \(u\) and \(v\), this would look like:
- \(0 \leq u \leq 1-v\)
- \(0 \leq v \leq 1\)

So now that we have our integration bounds, the next thing we can try to figure out is what \(\mathbf{r}(u,v)\) is in the expression \(\int_{R}\int \mathbf{F}(\mathbf{r}(u,v)) \cdot \mathbf{N}(u,v)\,du\,dv\). Well \(\mathbf{r}(u,v)\) is just our parameterizations of \(x\), \(y\), and \(z\) in terms of \(u\) and \(v\).

So \(\mathbf{r}(u,v) = \left[u,\,v,\,1-u-v\right]\).

Now that we have \(\mathbf{r}(u,v)\), we can now solve for \(\mathbf{N}=\mathbf{r}_u \times \mathbf{r}_v\). \(\mathbf{r}_u\) and \(\mathbf{r}_v\) are just the derivatives of \(\mathbf{r}\) with respect to \(u\) and \(v\).

- \(\mathbf{r}_u = \left[1,\,0,\,-1\right]\)
- \(\mathbf{r}_v = \left[0,\,1,\,-1\right]\)

So

\[\begin{aligned}
  \mathbf{N} = \mathbf{r}_u \times \mathbf{r}_v &= \begin{vmatrix}
    \mathbf{i} & \mathbf{j} & \mathbf{k} \\
    1 & 0 & -1 \\
    0 & 1 & -1 \\
  \end{vmatrix}\\
  &= (0 \cdot -1 - 1 \cdot -1)\mathbf{i} + (0 \cdot -1 - 1 \cdot -1)\mathbf{j} + (1 \cdot 1 - 0 \cdot 0)\mathbf{k}\\
  &= 1\cdot\mathbf{i} + 1\cdot\mathbf{j} + 1\cdot\mathbf{k}\\
  &= \left[1,\,1,\,1\right]
\end{aligned}\]

The final piece we need to figure out before we can start integrating is \(\mathbf{F}(\mathbf{r}(u,v))\). Recall that \(\mathbf{F} = \left[x^2,\,0,\,3y^2\right]\) and \(\mathbf{r}(u,v) = \left[u,\,v,\,1-u-v\right]\), so 

\[
  \mathbf{F}(\mathbf{r}(u,v)) = \left[u^2,\,0,\,3v^2\right]
\]

Thus,

\[
  \mathbf{F}(\mathbf{r}(u,v)) \cdot \mathbf{N}(u,v) = \left[u^2,\,0,\,3v^2\right] \cdot \left[1,\,1,\,1\right] = u^2 + 0 + 3v^2
\]

So now we can set up the integration like so

\[\begin{aligned}
  \int_{S}\int\mathbf{F}\cdot\mathbf{n}\:dA &= \int_{R}\int \mathbf{F}(\mathbf{r}(u,v)) \cdot \mathbf{N}(u,v)\,du\,dv\\
  &= \int_{0}^{1}\int_{0}^{1-v}\left(u^2+3v^2\right)\:du\,dv\\
  &= \int_{0}^{1} \left[\frac{1}{3}u^3 + 3v^2u\right]_{0}^{1-v}\:dv\\
  &= \int_{0}^{1} \left[\frac{1}{3}\left(1-v\right)^3 + 3v^2\left(1-v\right)\right]-0\:dv\\
\end{aligned}\]

If you go through the expansion process for \((1-v)^3\), then you get \(1-3v+3v^2-v^3\).

So continuing on

\[\begin{aligned}
  \int_{S}\int\mathbf{F}\cdot\mathbf{n}\:dA &= \int_{0}^{1} \left[\frac{1}{3}\left(1-3v+3v^2-v^3\right) + 3v^2 - 3v^3\right]\:dv\\
  &= \int_{S}\left[\frac{1}{3}-v+v^2-\frac{1}{3}v^3+3v^2-3v^3\right]\:dv\\
  &= \int_{S}\left[\frac{1}{3}-v+4v^2-\frac{10}{3}v^3\right]\:dv\\
  &= \left[\frac{1}{3}v - \frac{1}{2}v^2+\frac{4}{3}v^3-\frac{10}{12}v^4\right]_{0}^{1}\\
  &= \left[\frac{1}{3}-\frac{1}{2}+\frac{4}{3}-\frac{5}{6}\right]\\
  &= \boxed{\frac{1}{3}}
\end{aligned}\]

### Problem 2

Evaluate the integral for the given data. Describe the kind of surface.

\[
  \mathbf{F} = \left[0,x,0\right],\: S:\,x^{2} + y^{2} + z^{2} = 1,\; x \geq 0,\, y\geq 0,\,z\geq 0
\]

{{<divider>}}

