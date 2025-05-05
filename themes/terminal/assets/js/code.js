const codeblocks = document.querySelectorAll('code[class^="language-"]');
for (const block of codeblocks) {
  const parent = block.parentElement;
  // Remove excessing newlines.
  const content = block.innerText.split("\n").filter(Boolean).join("\n");

  // Code title
  const copyButtonDiv = document.createElement("div");
  const lang = block.dataset.lang;
  copyButtonDiv.classList.add("copy-div");

  // Copy to clipboard
  if (navigator.clipboard !== undefined) {
    const cpbutton = document.createElement("button");
    cpbutton.classList.add("copy-button");
    cpbutton.innerText = "Copy";

    cpbutton.addEventListener("click", () => {
      cpbutton.innerText = "Copied";
      setTimeout(() => {
        cpbutton.innerText = "Copy";
      }, 1000);

      navigator.clipboard.writeText(content);
    });

    copyButtonDiv.append(cpbutton);
  }

  parent.closest(".highlight").prepend(copyButtonDiv);
}
