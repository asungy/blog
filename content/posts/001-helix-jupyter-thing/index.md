+++
title = "Helix Jupyter Thing"
# Run the following command to generate the current date: `date -u +"%Y-%m-%dT%H:%M:%SZ"`
date = "2025-05-11T10:52:50-04:00"
description = "A tool to help me work with Jupyter Notebooks inside of Helix."
showFullContent = false
readingTime = true
hideComments = false
ToC = false
math = false
+++

## The Python Problem

I have always been interested in learning about AI, but the reason I never could get started sounds actually pretty ridiculous. It's Python. As a software engineer, I obviously know how to code in Python, but I have always struggled to find peace in its ecosystem. From the seemingly redundant package managers to the lack of static analysis, it's not hard for me to find something that peeves me either about the language itself or its tooling.

But as AI is only becoming more relevant over time, Python continues to deepen its roots in its already long-enduring ubiquity. So if I want in on the game, I'm going to have to learn to love the rules.

For as much shade as I throw in Python's direction, I actually think what developers in the Python community have managed to do is absolutely stunning. They have been able to sustain such an impactful technology for decades across a wide variety of domains. I think a big reason for this is because they made it relatively easy to interface with C code. So you have a really simple language that lowers the bar for beginning programmers who don't have to think about types, compiler errors, etc, but you also have the ability to get deep in the weeds and really push the performance limits of code. If you look at any of popular deep learning packages like [PyTorch](https://github.com/pytorch/pytorch) and [Tensorflow](https://github.com/tensorflow/tensorflow), a lot of the core functionality is written in C++.

When a technology is that good at a lot of things, it's easy to expect the world from it. So whenever I get frustrated, I need to step back and realize that my frustrations are probably just mostly self-induced.

## Making HJT

Whenever I have tried to start learning about AI, I am always first told to open up a Jupyter Notebook. While I think Jupyter Notebooks are a really useful tool, I _hate_ working in them. I like Vim-motions and staying in the terminal, so opening up a bulky Electron app like VSCode with Jupyter extensions or using the Jupyter Notebook web client feels like death to me. Dramatic? Not at all.

So I wanted to figure out a way that I can still somehow use Helix to write Python code, but utilize Jupyter notebooks for fancy visualization purposes.

When I was still using Neovim, I frequently used this plugin called [iron](https://github.com/Vigemus/iron.nvim) to send Python code to an IPython kernel, so I knew there was a way I could do something similar using Helix and Jupyter kernels. With Helix, you can select text and pipe it to shell commands and get back any output text, so I asked ChatGPT to generate some code that would do the following:

1. Take some text from stdin
2. Send it to a Jupyter kernel
3. Print any output returned from the kernel

I was decently surprised that the code ChatGPT generated was extremely simple. I then made a few tweaks to the code and wrapped it in a nice CLI.

Not knowing (nor caring) what to call this little bespoke tool, I ended up naming this tool _Helix Jupyter Thing_, or _hjt_ for short.

## Installing HJT

I put _hjt_ up on [PyPI](https://pypi.org/project/helix-jupyter-thing/) so I can have it easily available by running `pip install helix-jupyter-thing`. Once it is installed, I just ensure that it is available in my path by running `hjt --help` and then it'll be available to Helix once I start editing files from the same shell session.

## Specifying the Kernel

In order to start using _hjt_, we need to tell it which kernel to use.

If you open up a Jupyter Notebook and click on the kernel information in the upper right-hand corner, a dialog box will pop up with the kernel ID.

{{<image src="./jupyter_screenshot.png" position="center">}}

You can then set the kernel ID like so: `hjt kernel set 08ad`. Note that you don't have to write out the complete ID because it will match the first kernel file.

## Sending Code to the Kernel

After the kernel is set, you can just select some code in Helix and pipe it over to `hjt exec`. If you used `pipe`, then the selected text will be replaced with the output text provided by the kernel. If you used `pipe-to`, the output is simply ignored.

## Final Thoughts

Though this feels a little hacky, this has allowed me to enjoy working with Jupyter Notebooks a lot more. I mostly just write the Python code in Helix and anytime I need to visualize the output or produce an image, I'll briefly switch over to Jupyter and work in the notebook to produce the output that I can't get in the terminal.
