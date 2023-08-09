import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button","value"];

  connect(){
    // console.log("hello from your stimulus controller", this.element);
  }
  select(){
    const element = this.buttonTarget;
    element.classList.add("blue-switch");
    // console.log("hello", this.element);
    // comsole.log("hello value", this.valueElement);
  }

  copy(){
    const templateId = this.valueTarget.innerText;
    console.log(templateId);
  }



}
