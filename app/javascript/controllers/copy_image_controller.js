// import { Controller } from '@hotwired/stimulus';

// console.log('the controller is loading')

// export default class extends Controller {
//   connect() {
//     console.log('Copy image controller connected');
//     // Other code for the connect method
//   }
//   static targets = ['image', 'imageLink'];

//   copyImage(event) {
//     console.log('copy button clicked')
//     event.preventDefault();

//     // Get the image and its hyperlink
//     const image = this.imageTarget;
//     const imageLink = this.imageLinkTarget;

//     // Create a new div element
//     const copyDiv = document.createElement('div');

//     // Append the image and its hyperlink to the div
//     copyDiv.appendChild(image);
//     copyDiv.appendChild(imageLink);

//     // Select the contents of the div
//     const selection = window.getSelection();
//     const range = document.createRange();
//     range.selectNodeContents(copyDiv);
//     selection.removeAllRanges();
//     selection.addRange(range);

//     // Copy the contents of the div to the clipboard
//     navigator.clipboard.write([
//       new ClipboardItem({
//         'text/html': new Blob([copyDiv.innerHTML], { type: 'text/html' })
//       })
//     ]);

//     // Clear the selection
//     selection.removeAllRanges();
//   }
// }
