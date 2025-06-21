+++
draft = false
title = 'Helix Macros'
readingTime = false
ToC = true
math = true
+++

> Just some macros I use in Helix sometimes.
>
> To use: copy-pasta text into helix, throw it into a register, and run it with the macro key (`q`).

## Blog

### Inline MathJax

For beginning to write an inline MathJax.

```
i\(\<left><left><right><esc>
```

### Converting dollar sign `$$` MathJax block to brackets `\[\]`

```
/\$\$<ret>c\[<esc>d/\$\$<ret>c\]<esc>
```
### Converting dollar sign `$` inline MathJax to parentheses `\(\)`

First load the `j` register with `\(`, then load the `k` register with `\)`.

It needs to be done this way because typing out the keys are inconsistent depending on the text that is in between the dollar signs.

```
f$<esc>"j<S-R>f$<esc>"k<S-R><esc>
```

## MathJax

### Making brackets

These brackets resize better around math notation.

```
i\left[\right<esc><S-F>\<esc>
```
