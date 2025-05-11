+++
draft = false
title = 'Building Micrograd'
readingTime = true
math = true
ToC = true
layout = 'single'
+++

> Here are my notes for Andrej Karpathy's video titled {{<ablank href="https://youtu.be/VMj-3S1tku0" text="The spelled-out intro to neural networks and backpropagation: building micrograd">}}. I'm assuming that the reader is following along with their own Jupyter notebook.

## Import statements

Run these import statements so we don't need to import anything later on:
```python
from collections import deque
from enum import Enum
from graphviz import Digraph
import json
import math
import matplotlib.pyplot as plt
import numpy as np
%matplotlib inline
```

## Derivatives

> Timestamp: {{<ablank href="https://www.youtube.com/watch?v=VMj-3S1tku0&t=488s" text="00:08:08">}}

Let's start simple. Consider the following function:

\[
  f(x) = 3x^2 - 4x + 5
\]

We can plot this function like so:

```python
f = lambda x: 3*x**2 - 4*x + 5
xs = np.arange(-5, 5, 0.25)
ys = f(xs)
plt.plot(xs, ys)
```
{{<image src="./images/001-function-plot.png" position="center">}}

{{<rawhtml>}}<div id="derivative-formula"></div>{{</rawhtml>}}
Recall the formula to find the derivative of the function \(f(x)\):

\[
  f'(x) = \lim_{h \to 0} \frac{f(x+h)-f(x)}{h}
\]

If we wanted to computationally find the approximate derivative at any point along the function, we can use this formula to compute it.

```python
h = 0.000001 # Small h value as a substitute for h -> 0
x = 3.0
f(x + h) - f(x)) / h
```

```text {caption="Output" no-copy="true" collapsed="true"}
14.000003002223593
```

Here, we tried to approximate the derivative of \(f(3)\) and we get a value of `14.000003002223593`. Note that limits imply abstract infinitesimal values which cannot be fully represented in computers, so the best way we can represent \(\lim_{h \to 0}\) is to set `h` to a value that is really close to `0`, in this case, `0.000001`.

We can verify that this works by computing the derivative as if we were back doing high school calculus.

\[\begin{aligned}
  f(x) &= 3x^2-4x+5 \\
  f'(x) &= 6x-4 \\
  f'(x) &= 6(3.0)-4 \\
  f'(x) &= 14.0
\end{aligned}\]

The essence of the derivative is a bit abstract and requires more foundational knowledge to truly appreciate, but we can make do with the general description that the derivative of a function tells us by what factor that function changes at any given point.

## Partial Derivatives

> Timestamp: {{<ablank href="https://www.youtube.com/watch?v=VMj-3S1tku0&t=852s" text="00:14:12">}}

Previously, we examined the derivative of a function with respect to one variable. Now, we're going to study a function with multiple variables.

Let's consider the following function:

\[
  g(a,b,c) = ab + c
\]

We want to know how \(g\) changes with any changes made to the variables \(a\), \(b\), and \(c\).

Let's consider \(g\) at the point \(a=2.0, b=-3.0, c=10.0\) and let's determine how \(g\) changes with respect to \(a\):

```python
a, b, c = 2.0, -3.0, 10.0
g = lambda a, b, c: a * b + c
h = 0.000001
dgda = (g(a+h, b, c) - g(a, b, c))/h
print(dgda)
```

```text {caption="Output" no-copy="true" collapsed="true"}
-3.000000000419334
```

This tells us that at the point \(a=2.0, b=-3.0, c=10.0\), increasing \(a\) decreases \(g(a,b,c)\) by a factor of 3.

Here are the slopes for \(b\) and \(c\) at \(a=2.0, b=-3.0, c=10.0\):

```python
dgdb = (g(a, b+h, c) - g(a, b, c))/h
dgdc = (g(a, b, c+h) - g(a, b, c))/h
print(dgdb)
print(dgdc)
```

```text {caption="Output" no-copy="true" collapsed="true"}
2.000000000279556
0.9999999992515995
```

Like before, we can validate these values by hand:

\[
    g(a,b,c) = ab+c
\]

\[
    \frac{\partial g}{\partial a} = b = -3 \hspace{1.5cm}
    \frac{\partial g}{\partial b} = a = 2  \hspace{1.5cm}
    \frac{\partial g}{\partial c} = 1
\]

## Implementing the `Value` class

> Timestamp: {{<ablank href="https://www.youtube.com/watch?v=VMj-3S1tku0&t=1149s" text="00:19:09">}}

Now we're going to implement a `Value` class that will serve as a building block for developing neural networks. As always, we'll start simple. We first and foremost want our `Value`class to represent a numerical value.

```python
class Value:
    def __init__(self, value):
        self.value = value

    def __repr__(self):
        s = json.dumps({
            "value": self.value   
        }, indent=2)
        return f"Value: {s}"
```

We have a simple constructor that accepts and stores a value. We also created a `__repr__` method to be able to print and inspect our `Value` class in a human-readable format.

```python
print(Value(3.14))
```

```text {caption="Output" no-copy="true" collapsed="true"}
Value: {
  "value": 3.14
}
```

Next, we want to be able to perform operations on our `Value` class. Let's go ahead and implement addition, subtraction, and multiplication magic methods for this class:

```python {caption="Adding operations" linenos=false hl_lines=["5-15"]}
class Value:
    def __init__(self, value):
        self.value = value

    def __add__(self, other):
        return Value(self.value + other.value)

    def __sub__(self, other):
        return Value(self.value - other.value)

    def __mul__(self, other):
        return Value(self.value * other.value)

    def __truediv__(self, other):
        return Value(self.value / other.value)
    
    def __repr__(self):
        s = json.dumps({
            "value": self.value   
        }, indent=2)
        return f"Value: {s}"
```

Let's quickly test these methods.

```python
a = Value(2.5)
b = Value(7.0)
print(a + b)
print(a - b)
print(a * b)
print(a / b)
```

```text {caption="Output", no-copy="true", collapsed="true"}
Value: {
  "value": 9.5
}
Value: {
  "value": -4.5
}
Value: {
  "value": 17.5
}
Value: {
  "value": 0.35714285714285715
}
```

We now need our `Value` class to maintain some kind of "memory" of how it was created. Firstly, we need to know what values were involved in creating any given value as well as the operation. If you are familiar in with the concept of backpropagation, you may see why this is necessary. If not, that's okay.

Let's say I have the following equation:

\[
    1+2=3
\]

This can be modeled with our `Value` class like so:

{{<rawhtml>}}
  <div style="display: flex; justify-content: center;">
    <code>Value(1) + Value(2) => Value(3)</code>
  </div>
{{</rawhtml>}}

Let's say we take our `Value(3)` and use it to perform some calculations. But let's also consider that sometime later we want to refer back to `Value(1)` and `Value(2)` and recall that these `Value` objects were added to create `Value(3)`. A solution might look like this:

```python {caption="Allowing values to remember how they were constructed." collapsible="true" collapsed="false"}
class Op(Enum):
    NONE = 0
    ADD = 1
    SUB = 2
    MUL = 3
    DIV = 4

    def __str__(self):
        match self:
            case Op.NONE:
                return "none"
            case Op.ADD:
                return "addition"
            case Op.SUB:
                return "subtraction"
            case Op.MUL:
                return "multiplication"
            case Op.DIV:
                return "division"
            case _:
                raise ValueError("Unknown operation")

    def opstr(self):
        match self:
            case Op.NONE:
                return ""
            case Op.ADD:
                return "+"
            case Op.SUB:
                return "-"
            case Op.MUL:
                return "*"
            case Op.DIV:
                return "/"
            case _:
                raise ValueError("Unknown operation")

class Value:
    def __init__(self, value, children=set(), operation=Op.NONE):
        self.value = value
        self.children = children
        self.operation = operation

    def __add__(self, other):
        return Value(
            value=self.value + other.value,
            children={self, other},
            operation=Op.ADD,
        )

    def __sub__(self, other):        
        return Value(
            value=self.value - other.value,
            children={self, other},
            operation=Op.SUB,
        )

    def __mul__(self, other):
        return Value(
            value=self.value * other.value,
            children={self, other},
            operation=Op.MUL,
        )

    def __truediv__(self, other):
        return Value(
            value=self.value / other.value,
            children={self, other},
            operation=Op.DIV,
        )

    def __str__(self):        
        s = json.dumps({
            "value": self.value,
            "children": [json.loads(str(v)) for v in self.children],
            "operation": str(self.operation),
        }, indent=2)
        return s
    
    def __repr__(self):
        return str(self)
```

```python
a = Value(2.0)
b = Value(-3.0)
c = Value(10.0)
print(a*b+c)
```

```json {caption="Output" no-copy="true", collapsed="true"}
{
  "value": 4.0,
  "children": [
    {
      "value": 10.0,
      "children": [],
      "operation": "none"
    },
    {
      "value": -6.0,
      "children": [
        {
          "value": -3.0,
          "children": [],
          "operation": "none"
        },
        {
          "value": 2.0,
          "children": [],
          "operation": "none"
        }
      ],
      "operation": "multiplication"
    }
  ],
  "operation": "addition"
}
```

### Graph Visualization

As these `Value` objects become more and more nested, it might be easier to visualize them as a graph. Here we're going to use the [Graphviz](https://graphviz.org/) package to implement a method for displaying our mathematical expression as a graph:

```python {caption="Adding a graph rendering method."}
    def render_graph(self):
        digraph = Digraph(format="svg", graph_attr={"rankdir": "LR"})
        queue = deque([self])
        while queue:
            current = queue.popleft()
            current_id = str(id(current))
            label = "{ %s | value: %.4f }" % (current.label, current.value)
            digraph.node(name=current_id, label=label, shape="record")
            if current.operation != Op.NONE:
                op_id = current_id + str(current.operation)
                digraph.node(
                    name=op_id,
                    label=current.operation.opstr(),
                )
                digraph.edge(op_id, current_id)
                for child in current.children:
                    digraph.edge(str(id(child)), op_id)
                    queue.append(child)
        return digraph
```

```python {caption="Full code" linenos="false" hl_lines=[7, "48-66"] collapsed="true"}
 class Value:
    def __init__(self, value, children=set(), operation=Op.NONE, label=""):
        self.value = value
        self.children = children
        self.operation = operation
        # Adding a label field to more easily identify Value objects.
        self.label = label

    def __add__(self, other):
        return Value(
            value=self.value + other.value,
            children={self, other},
            operation=Op.ADD,
        )

    def __sub__(self, other):        
        return Value(
            value=self.value - other.value,
            children={self, other},
            operation=Op.SUB,
        )

    def __mul__(self, other):
        return Value(
            value=self.value * other.value,
            children={self, other},
            operation=Op.MUL,
        )

    def __truediv__(self, other):
        return Value(
            value=self.value / other.value,
            children={self, other},
            operation=Op.DIV,
        )

    def __str__(self):        
        s = json.dumps({
            "value": self.value,
            "children": [json.loads(str(v)) for v in self.children],
            "operation": str(self.operation),
        }, indent=2)
        return s
    
    def __repr__(self):
        return str(self)

    def render_graph(self):
        digraph = Digraph(format="svg", graph_attr={"rankdir": "LR"})
        queue = deque([self])
        while queue:
            current = queue.popleft()
            current_id = str(id(current))
            label = "{ %s | value: %.4f }" % (current.label, current.value)
            digraph.node(name=current_id, label=label, shape="record")
            if current.operation != Op.NONE:
                op_id = current_id + str(current.operation)
                digraph.node(
                    name=op_id,
                    label=current.operation.opstr(),
                )
                digraph.edge(op_id, current_id)
                for child in current.children:
                    digraph.edge(str(id(child)), op_id)
                    queue.append(child)
        return digraph
```

Let's test out the `render_graph` method.

```python
a = Value(2.0, label="a")
b = Value(-3.0, label="b")
c = Value(10.0, label="c")
(a*b+c).render_graph()
```

{{<image src="./images/002-graphviz-rendering.svg" position="center">}}

## Backpropagation

> Timestamp: {{<ablank href="https://www.youtube.com/watch?v=VMj-3S1tku0&t=1930s" text="00:32:10">}}

Now that we have our `Value` class in a more complete state and a nice way to display it, we can start talking about _backpropagation_.

Consider the following function:

\[
    L = a(b+cd)
\]

The goal of backpropagation is to figure out how the inputs to a mathematical function affect the output. More concretely, in this example, backpropagation is asking _"if I slightly change the value of \(a\), how does that affect the output of \(L\). Likewise, what happens to \(L\) if I change the value of \(b\), and so on..."_.

Because this is a simple enough equation, we can quickly eyeball it and find the partial derivatives in our head:

\[
    L = a(b + cd) = ab + acd
\]

\[\begin{aligned}
    \frac{\partial L}{\partial a} &= b + cd \hspace{1.5cm} &\frac{\partial L}{\partial b} = a \\[1em]
    \frac{\partial L}{\partial c} &= ad \hspace{1.5cm} &\frac{\partial L}{\partial d} = ac
\end{aligned}\]

However, you can imagine this quickly because untenable as we introduce more and more variables. We need to come up with a way to programmatically calculate these partial derivatives.

Let's first try to visualize our our function \(L\) as a graph. For this, we are going to set \(a\), \(b\), \(c\), and \(d\) to arbitrary values:

\[
    a = -2.0, \hspace{1.0cm} b = 10.0, \hspace{1.0cm} c = 2.0, \hspace{1.0cm} d = -3.0
\]

Now let's build out this expression using our `Value` class and render it.

```python
a = Value(-2.0, label="a")
b = Value(10.0, label="b")
c = Value(2.0, label="c")
d = Value(-3.0, label="d")
e = c*d; e.label = "cd"
f = b+e; f.label = "b+cd"
L = a*f; L.label = "a(b+cd)"
L.render_graph()
```

{{<image src="./images/003-graphviz-rendering.svg" position="center">}}

For backpropagation, we want to know how tweaking any of these leaf nodes affects the output at the end of the graph. And the way we are going to "propagate" information to and from the leaf nodes is by maintaining a "local gradient" for each node.

```python {caption="Adding local gradients to the Value class" linenos=false hl_lines=[2,7]}
class Value:
    def __init__(self, value, children=set(), operation=Op.NONE, label="", gradient=0.0):
        self.value = value
        self.children = children
        self.operation = operation
        self.label = label
        self.gradient = gradient
```

```python {caption="Full code" collapsed=true linenos=true hl_lines=[2,7,54]}
class Value:
    def __init__(self, value, children=set(), operation=Op.NONE, label="", gradient=0.0):
        self.value = value
        self.children = children
        self.operation = operation
        self.label = label
        self.gradient = gradient

    def __add__(self, other):
        return Value(
            value=self.value + other.value,
            children={self, other},
            operation=Op.ADD,
        )

    def __sub__(self, other):        
        return Value(
            value=self.value - other.value,
            children={self, other},
            operation=Op.SUB,
        )

    def __mul__(self, other):
        return Value(
            value=self.value * other.value,
            children={self, other},
            operation=Op.MUL,
        )

    def __truediv__(self, other):
        return Value(
            value=self.value / other.value,
            children={self, other},
            operation=Op.DIV,
        )

    def __str__(self):        
        s = json.dumps({
            "value": self.value,
            "children": [json.loads(str(v)) for v in self.children],
            "operation": str(self.operation),
        }, indent=2)
        return s
    
    def __repr__(self):
        return str(self)

    def render_graph(self):
        digraph = Digraph(format="svg", graph_attr={"rankdir": "LR"})
        queue = deque([self])
        while queue:
            current = queue.popleft()
            current_id = str(id(current))
            label = "%s | value: %.4f | gradient: %.4f" % (current.label, current.value, current.gradient)
            digraph.node(name=current_id, label=label, shape="record")
            if current.operation != Op.NONE:
                op_id = current_id + str(current.operation)
                digraph.node(
                    name=op_id,
                    label=current.operation.opstr(),
                )
                digraph.edge(op_id, current_id)
                for child in current.children:
                    digraph.edge(str(id(child)), op_id)
                    queue.append(child)
        return digraph
```

Now if we render our graph again, we should see our gradient values.

```python
a = Value(-2.0, label="a")
b = Value(10.0, label="b")
c = Value(2.0, label="c")
d = Value(-3.0, label="d")
e = c*d; e.label = "cd"
f = b+e; f.label = "b+cd"
L = a*f; L.label = "a(b+cd)"
L.render_graph()
```
{{<image src="./images/004-graphviz-rendering.svg" position="center">}}

### Calculating gradients by hand

As you can see, our gradients are initialize to `0.0000` and we want to be able fill them out somehow. We'll eventually automate the process, but before we do that let's get a better intuitive understand of how that works by calculating the gradient of a few `Value` objects by hand. When performing backpropagation, we start at the end of our graph and, well — work backwards.

The first one is always the easiest.

\[
    \frac{\partial(a(b+cd))}{\partial(a(b+cd))} = 1
\]

This is basically saying "_if we make a change to the output by \(x\), we're making a change to the output by \(x\)_". Not much to overthink here.

Now let's look at how \(a(b+cd)\) changes with respect to \(b+cd\). The answer might be obvious using a simple calculus rule, but you can always prove this to yourself using [the formula for the derivative of a function](#derivative-formula).

\[\begin{aligned}
    \frac{\partial (a(b+cd))}{\partial (b+cd)} &= \lim_{h \to 0} \frac{(a((b+cd)+h)) - (a(b+cd))}{h} \\
    &= \lim_{h \to 0} \frac{\bcancel{ab} + \bcancel{acd} + ah - \bcancel{ab} + \bcancel{acd}}{h} \\
    &= \lim_{h \to 0} \frac{a\bcancel{h}}{h} \\
    &= a
\end{aligned}\]

You can do the same proof for how \(a(b+cd)\) changes with respect to \(a\) and find that \(\frac{\partial a(b+cd)}{\partial a} = b+cd\). At this point, you may notice that the derivative of the product of two values with respect to one of the values is just the other value. You can think of changes to one of the values is being multiplied by the other value, if that helps.

So, if we fill in the gradients we currently have, we have something like the following.

{{<image src="./images/005-graphviz-rendering.svg" position="center">}}

Solving for \(\frac{\partial (a(b+cd))}{\partial b}\), we get the following.

\[\begin{aligned}
    \frac{\partial (a(b+cd))}{\partial b} &= \lim_{h \to 0} \frac{a((b+h)+cd) - a(b+cd)}{h} \\
    &= \lim_{h \to 0} \frac{\bcancel{ab}+ah+\bcancel{acd}-\bcancel{ab}+\bcancel{acd}}{h} \\
    &= \frac{ah}{h} = a
\end{aligned}\]

If we solve for \(\frac{\partial (a(b+cd))}{\partial cd}\), we find that \((a(b+cd))\) with respect to \(cd\) changes by a factor of \(a\) as well. When performing backpropagation, we can think of the gradient dispersing to all of the children nodes when traversing through an addition operation.

{{<image src="./images/006-graphviz-rendering.svg" position="center">}}

Lastly, we need to solve for the gradients \(c\) and \(d\).

Let's first solve for \(c\).

\[\begin{aligned}
    \frac{\partial (a(b+cd))}{\partial c} &= \lim_{h \to 0} \frac{a(b+(c+h)d)-a(b+cd)}{h} \\
    &= \lim_{h \to 0} \frac{a(b+cd+dh)-ab-acd}{h} \\
    &= \lim_{h \to 0} \frac{\bcancel{ab}+\bcancel{acd}+adh-\bcancel{ab}-\bcancel{acd}}{h} \\
    &= ad
\end{aligned}\]

If we solved for the gradient of \(d\), we would unsurprisingly get \(\frac{\partial (a(b+cd))}{\partial d} = ac\). So I initially mentioned that in multiplication, the gradient for one value is just the other value. But this is not completely true. Here, we can see that the "other value" is being multiplied by \(a\). So multiplication involves not only just the other value but multiplying that value by the parent node's gradient.

{{<image src="./images/007-graphviz-rendering.svg" position="center">}}

So we have finally filled out the gradients for our expression. Obviously to programmatically find the gradients this way is intractable, so we need to come up with another solution to automate this process.

<!-- ### Calculating gradients automatically -->


<!-- LEFT OFF: https://youtu.be/VMj-3S1tku0?t=3235 -->
