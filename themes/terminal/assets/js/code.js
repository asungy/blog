const codeblocks = document.querySelectorAll('code[class^="language-"]');
for (const block of codeblocks) {
  const highlight = block.parentElement.closest(".highlight");
  // Remove excessing newlines.
  const content = block.innerText.split("\n").filter(Boolean).join("\n");

  const codeHeader = document.createElement("div");
  const headerLeft = document.createElement("div");
  const headerRight = document.createElement("div");
  codeHeader.classList.add("code-header");
  headerLeft.classList.add("header-left");
  headerRight.classList.add("header-right");
  codeHeader.append(headerLeft);
  codeHeader.append(headerRight);

  // Caption text.
  if (highlight.hasAttribute("caption")) {
    const caption = document.createElement("div");
    caption.classList.add("code-caption");
    caption.innerText = highlight.getAttribute("caption");
    headerLeft.append(caption);
  }

  // Copy to clipboard button.
  const noCopy = highlight.hasAttribute("no-copy") &&
    highlight.getAttribute("no-copy").toLowerCase() === "true" ? true : false;
  if (!noCopy && navigator.clipboard !== undefined) {
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

    headerRight.append(cpbutton);
  }

  // Show/hide button.
  const collapsed = highlight.hasAttribute("collapsed") && highlight.getAttribute("collapsed").toLowerCase() === "true" ? true : false;
  const collapsible = highlight.hasAttribute("collapsible") && highlight.getAttribute("collapsible").toLowerCase() === "true" ? true : false;
  if (collapsed || collapsible) {
    block.style.display = collapsed ? "none" : "block";
    const collapsibleButton = document.createElement("button");
    collapsibleButton.classList.add("collapsible-button");
    collapsibleButton.innerText = collapsed ? "Show" : "Hide";
    collapsibleButton.addEventListener("click", () => {
      block.style.display = block.style.display === "block" ? "none" : "block";
      collapsibleButton.textContent = block.style.display === "block" ? "Hide" : "Show";
    });

    headerRight.append(collapsibleButton);
  }

  highlight.prepend(codeHeader);
}
