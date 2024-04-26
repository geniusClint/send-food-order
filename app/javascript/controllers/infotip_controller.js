import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tool-tip"
export default class extends Controller {

  static targets = ["infoTip"];


  mouseOver() {
    this.infoTipTarget.classList.remove("invisible", "opacity-0");
    this.infoTipTarget.classList.add("opacity-100", "visible");;
  }

  mouseOut() {
    this.infoTipTarget.classList.remove("opacity-100", "visible");
    this.infoTipTarget.classList.add("invisible", "opacity-0");

  }
}
