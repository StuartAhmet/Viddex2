// copy.js
document.addEventListener("click", (event) => {
  if (event.target.id === "copy-button") {
    const imageContainer = event.target.closest('.image-container');
    const image = imageContainer.querySelector('#image');
    const imageLink = imageContainer.querySelector('#image-link');
    image.width = 500;
    imageLink.width = 500;


    // Change the 'copy' text to 'copied'
    event.target.textContent = 'Copied!';
    setTimeout(() => {
      event.target.textContent = 'Copy';
    }, 2000); // reset the text after 2 seconds (2000 milliseconds)

    // Create a new div element
    const copyDiv = document.createElement('div');

    // Create copies of the image and its hyperlink
    const imageLinkCopy = imageLink.cloneNode(true);

    // Append the copies of the image and its hyperlink to the div
    // copyDiv.appendChild(imageCopy);
    copyDiv.appendChild(imageLinkCopy);

    // Select the contents of the div
    const selection = window.getSelection();
    const range = document.createRange();
    range.selectNodeContents(copyDiv);
    selection.removeAllRanges();
    selection.addRange(range);

    // Copy the contents of the div to the clipboard
    navigator.clipboard.write([
      new ClipboardItem({
        'text/html': new Blob([copyDiv.innerHTML], { type: 'text/html' })
      })
    ]);

    // Clear the selection
    selection.removeAllRanges();
  }
});
