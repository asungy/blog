+++
draft = false
title = 'Discussion'
readingTime = false
ToC = false
layout = 'single'
math = true
+++


>  Two of the most important theorems in vector calculus, Green's Theorem and Stokes's Theorem, are named after George Green and George Stokes. However, William Thomson (Lord Kelvin) significantly contributed to the development and application of these results. All three men were deeply interested in how these theorems could explain and predict phenomena in electricity, magnetism, and fluid flow.
> 
> Discuss the following:
> 
> - What are the historical origins of Green’s Theorem and Stokes’s Theorem? How did the contributions of Green, Stokes, and Kelvin intertwine to advance these ideas?
> - How are Green’s Theorem and Stokes’s Theorem similar, and what relationships exist between them? Consider their roles in connecting local and global properties of vector fields.
> - Can you identify examples in physics or engineering where one theorem is more applicable than the other? Why would that be the case?
>
> Collaborate with your classmates by exploring historical anecdotes, comparing theorems’ uses in modern applications, or debating their foundational roles in vector calculus. How do these theorems highlight the interconnectedness of mathematical theory and physical reality? Share your insights and reflections!

George Green was born in an English town of Sneinton, Nottinghamshire in 1793 and was the son of a successful baker. While working at the bakery until his father's death, George Green showed to have a strong inclination towards mathematics and physical sciences even with minimal formal education in the subjects. In 1828, he published a paper title _An Essay on the Application of Mathematical Analysis to the Theories of Electricity and Magnetism_ which laid the groundwork for what we would know today as Green's Theorem. In our textbook, we know Green's Theorem to be

\[
  \int_{R}\int \left(\frac{\partial F_2}{\partial x} - \frac{\partial F_1}{\partial y}\right)\,dx\,dy = \oint_{C} \left(F_1\,dx+F_2\,\right)
\]

However, [in his essay](https://arxiv.org/pdf/0807.0088) (page 16), we see it take the form of

\[
  \int dx\,dy\,dz\,U\delta V + \int d\sigma U\left(\frac{dV}{dw}\right) = \int dx\,dy\,dz\,V\delta U + \int d\sigma V \left(\frac{dU}{dw}\right)
\]

From the paper, he defines \(U\) and \(V\) to be scalar functions that take the values of \(x\), \(y\), and \(z\) and are differentiable. \(d\sigma\) represents an infinitesimal element on the surface of the bodies described by \(U\) and \(V\) and \(\frac{d}{dw}\) can be understood as the _normal derivative_ to either \(U\) or \(V\).

I was trying to figure out the significance of \(\delta\) and I think it's an operation for the following (see page 17 from [the aforementioned link](https://arxiv.org/pdf/0807.0088)):

\[
  U\delta V = \frac{dV}{dx}\frac{dU}{dx} + \frac{dV}{dy}\frac{dU}{dy} + \frac{dV}{dz}\frac{dU}{dz}
\]

because he mentions that \(\delta\) is supposed to serve as some sort of shorthand, but I could very well be mistaking this because this would suggest that \(\int d\sigma U\left(\frac{dV}{dw}\right) = \int d\sigma V \left(\frac{dU}{dw}\right)\) (unless the triple integrations \(\int dx\,dy\,dz\) aren't supposed to be taken literally). Recall that \(\text{div}\,\mathbf{v} = \frac{\partial v_1}{\partial x} + \frac{\partial v_2}{\partial y} + \frac{\partial v_3}{\partial z}\). If my interpretation is correct, then \(U\delta V\) is just the dot products of \(\text{div}\,\nabla U\) and \(\text{div}\,\nabla V\).

Also, the mention of normal derivates makes the ideas here have a strong resemblance to the divergence theorem of Gauss \(\int\int_{T}\int\text{div}\,\mathbf{F}dV = \int_{S}\int\mathbf{F}\cdot\mathbf{n}dA\).

I'm not claiming to completely understand what's going on here, but the gist I'm getting is that Green is trying to establish a sense of symmetry between arbitrary functions (\(U\) and \(V\)) that describe arbitrary bodies. The thing that sticks out for me is on either side of the equation he has a triple integral and an integration over a boundary surface which suggests there's some link between the ideas of volume and surface. The only difference between the left side and the right side is that \(U\) and \(V\) are swapped.

Anyway, I thought it was useful for me to try to grok what Green was actually proposing, especially since Green's Theorem didn't take its general form until after Green's death, which was done by Augustin Cauchy in 1846, albeit without proof. Green's Theorem was proved until 1851 by Bernhard Riemann.

Stokes theorem apparently takes two forms: 1) [a classical form](https://en.wikipedia.org/wiki/Stokes'_theorem#Theorem) and 2) [a general form](https://en.wikipedia.org/wiki/Generalized_Stokes_theorem). I couldn't find in what exact way George Stokes contributed to either of the forms, but apparently the classical form was originally communicated to Stokes from Lord Kelvin in 1850 ([here are the letters](https://books.google.com/books?id=YrjkOEdC83gC&pg=PA97#v=onepage&q&f=false) of that correspondence). According to an editor's footnote in the letter, Stokes's name appears on the theorem because he set the theorem as a question on the 1854 Smith's Prize exam. The general form wasn't published until 1861 by Hermann Hankel (the original publication can be found [here](https://babel.hathitrust.org/cgi/pt?id=mdp.39015035826760&seq=5#page/34/mode/1up) though it is in German).

In Lord Kelvin's letter to Stokes, he provides the following:

\[
  \int\left(\alpha\,dx+\beta\,dy+\gamma\,dz\right) = \pm\int\int \left\{l\left(\frac{d\beta}{dz}-\frac{\gamma}{dy}\right)+m\left(\frac{d\gamma}{dx}-\frac{d\alpha}{dz}\right)+n\left(\frac{d\alpha}{dy}-\frac{d\beta}{dx}\right)\right\}dS
\]

(If you actually read the letter, it funny that this seemed to come up almost as an after thought.)

From the letter, he suggests that \(l\), \(m\), and \(n\) are normals of infinitesimal elements on the surface \(S\).

Let's compare this with the equation for Stokes's Theorem provided by our textbook:

\[
  
\]
