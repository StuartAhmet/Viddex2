import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="video-select"
export default class extends Controller {
  connect() {
    console.log("video select controller connected", this.element);
  }
}
