+++
draft = false
title = '01 (IN-PROGRESS) - Line Integrals'
readingTime = false
ToC = true
layout = 'single'
math = true
+++

> 3, 5, 9, 19    

## Exercises

### Problem 1

Calculate \(\int_{C} \mathbf{F}(\mathbf{r}) \cdot d\mathbf{r}\) for the given data. If \(\mathbf{F}\) is a force, this gives the work done by the force in the displacement along \(C\).

\[
  \mathbf{F} = \left[y^2,\,-x^2\right],\; C:\,y = 4x^2\;\text{from (0, 0) to (1, 4)}
\]

{{<divider>}}

\[
  \int_C \mathbf{F}(\mathbf{r}) \cdot d\mathbf{r}
\]

Since \(y = 4x^2\), we can parameterize the path as:

$$
\mathbf{r}(t) = \langle t, 4t^2 \rangle, \quad \text{for } t \in [0, 1]
$$

Then:

$$
\mathbf{r}'(t) = \left\langle \frac{d}{dt}(t), \frac{d}{dt}(4t^2) \right\rangle = \langle 1, 8t \rangle
$$

---

### **Step 2: Express $\mathbf{F}(\mathbf{r}(t))$**

$$
\mathbf{F}(\mathbf{r}(t)) = \left\langle (4t^2)^2, -(t)^2 \right\rangle = \langle 16t^4, -t^2 \rangle
$$

---

### **Step 3: Compute the dot product $\mathbf{F}(\mathbf{r}(t)) \cdot \mathbf{r}'(t)$**

$$
\mathbf{F}(\mathbf{r}(t)) \cdot \mathbf{r}'(t) = \langle 16t^4, -t^2 \rangle \cdot \langle 1, 8t \rangle = 16t^4 \cdot 1 + (-t^2)(8t) = 16t^4 - 8t^3
$$

---

### **Step 4: Integrate**

$$
\int_0^1 (16t^4 - 8t^3) \, dt = \int_0^1 16t^4 \, dt - \int_0^1 8t^3 \, dt
$$

$$
= \left[ \frac{16}{5}t^5 \right]_0^1 - \left[ 2t^4 \right]_0^1 = \frac{16}{5} - 2 = \frac{6}{5}
$$

---

### ✅ Final Answer:

$$
\boxed{\frac{6}{5}}
$$

Let me know if you want a visual sketch or breakdown of the vector field and path.
