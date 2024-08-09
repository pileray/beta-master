import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static values = { id: String }

  connect() {
  }

  show() {
    document.getElementById(this.idValue).showModal();
  }
}
