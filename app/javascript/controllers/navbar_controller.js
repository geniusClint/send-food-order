import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["userMenu", "mobileMenu", "hamburgerIcon", "closeIcon"];


  swapHamburgerCloseIcons() {
    this.hamburgerIconTarget.classList.toggle("hidden");
    this.hamburgerIconTarget.classList.toggle("block");

    this.closeIconTarget.classList.toggle("hidden");
    this.closeIconTarget.classList.toggle("block");
  }

  toggleMobileMenu() {
    this.swapHamburgerCloseIcons();
    this.mobileMenuTarget.classList.toggle("hidden");
  }

  toggleUserMenu() {
    this.userMenuTarget.classList.toggle("hidden");
  }
}