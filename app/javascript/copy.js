// copy.js

const imageContainers = document.querySelectorAll('.image-container');

imageContainers.forEach(imageContainer => {
  const copyButton = imageContainer.querySelector('#copy-button');
  const image = imageContainer.querySelector('#image');
  const imageLink = imageContainer.querySelector('#image-link');

  copyButton.addEventListener('click', () => {
    // Change the 'copy' text to 'copied'
    copyButton.textContent = 'Copied!';
    setTimeout(() => {
    copyButton.textContent = 'Copy';
    }, 2000); // reset the text after 2 seconds (2000 milliseconds)

    // Create a new div element
    const copyDiv = document.createElement('div');

    // Create copies of the image and its hyperlink
    const imageCopy = image.cloneNode(true);
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
  });
});
