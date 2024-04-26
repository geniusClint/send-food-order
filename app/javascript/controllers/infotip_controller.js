import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tool-tip"
export default class extends Controller {

  static targets = ["infoTip"];


  mouseOver() {
    this.infoTipTarget.classList.remove("invisible");
  }

  mouseOut() {
    this.infoTipTarget.classList.add("invisible");

  }
}
