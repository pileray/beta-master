import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="line-notification"
export default class extends Controller {
  connect() {
  }

  submit() {
    const form = this.element.closest('form');
    form.requestSubmit();
  }
}
