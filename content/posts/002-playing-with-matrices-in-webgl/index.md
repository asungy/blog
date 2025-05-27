+++
title = "Playing with Matrices in WebGL"
# Run the following command to generate the current date: `date -u +"%Y-%m-%dT%H:%M:%SZ"`
date = "2025-05-27T05:07:47Z"
description = "Just a little exploration with transformational matrices."
showFullContent = false
readingTime = true
hideComments = false
ToC = false
math = false
+++

{{<rawhtml>}}
<script src="./lib.js"></script>
{{</rawhtml>}}

## Notes
- [Video explaining rotational matrices](https://www.youtube.com/watch?v=Ta8cKqltPfU)
- [Rotational matrices wiki](https://en.wikipedia.org/wiki/Rotation_matrix)
- [Mozilla WebGL tutorial](https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial)

I wanted to spend some time getting WebGL setup and playing with some matrices in 2D and 3D environments.

## Setting up WebGL

{{<rawhtml>}}
<canvas id="gl-canvas" style="width: 100%; height: 50%; margin-top: 10px;"></canvas>
<script src="./01-demo.js"></script>
{{</rawhtml>}}

