import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="random-exam"
export default class extends Controller {
  static values = { answer: String, body: String, initialLength: Number }
  static targets = [ "answer", "body" ]

  connect() {
    this.currentLength = this.initialLengthValue - 1;
    this.fullLength = this.bodyValue.length;
  }

  showAnswer() {
    this.answerTarget.textContent = this.answerValue;
    this.answerTarget.classList.remove("text-blue-400");
  }

  showBody() {
    this.currentLength = this.fullLength;
    this.bodyTarget.textContent = this.bodyValue;
  }

  addCharacters() {
    if (this.currentLength < this.fullLength) {
      this.currentLength = Math.min(this.currentLength + 5, this.fullLength);
      this.updateBodyText();
    }
  }

  updateBodyText() {
    const displayedText = this.bodyValue.slice(0, this.currentLength);
    const suffix = (this.currentLength < this.fullLength) ? "/" : "";
    this.bodyTarget.textContent = displayedText + suffix;
  }
}
