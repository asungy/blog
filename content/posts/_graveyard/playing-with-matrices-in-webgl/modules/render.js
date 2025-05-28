function resizeCanvasToDisplaySize(canvas) {
  const displayWidth  = canvas.clientWidth;
  const displayHeight = canvas.clientHeight;
  const needResize = canvas.width  !== displayWidth ||
                     canvas.height !== displayHeight;
 
  if (needResize) {
    canvas.width  = displayWidth;
    canvas.height = displayHeight;
  }
}

function clearCanvas(gl) {
  gl.clearColor(0, 0, 0, 0);
  gl.clear(gl.COLOR_BUFFER_BIT);
}

export function render(gl, programInfo, buffers) {
  resizeCanvasToDisplaySize(gl.canvas);
  gl.viewport(0, 0, gl.canvas.width, gl.canvas.height);
  clearCanvas();
}
