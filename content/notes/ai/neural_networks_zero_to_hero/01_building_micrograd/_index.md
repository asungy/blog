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

```python {linenos=false, hl_lines=["5-15"]}
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

```python {collapsible="true" collapsed="false"}
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

As these `Value` objects become more and more nested, it might be easier to visualize them as a graph. This can be done using the [Graphviz](https://graphviz.org/) Python package:

```python {linenos="false" hl_lines=[7, "48-66"] collapsed="true"}
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
