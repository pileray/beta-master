import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="random-exam"
export default class extends Controller {
  static values = { answer: String, body: String, initialBody: String }
  static targets = [ "answer", "body" ]

  connect() {
    this.currentLength = 0;
    this.fullLength = this.bodyValue.length;
    this.initialText = this.initialBodyValue;
    this.fullText = this.bodyValue;
    this.bodyTarget.textContent = "";
    this.typeWriterEffect();
  }

  showAnswer() {
    this.answerTarget.textContent = this.answerValue;
    this.answerTarget.classList.remove("text-blue-400");
  }

  showBody() {
    this.currentLength = this.fullLength;
    this.bodyTarget.textContent = this.fullText;
  }

  addCharacters() {
    if (this.currentLength < this.fullLength) {
      this.currentLength = Math.min(this.currentLength + 5, this.fullLength);
      this.updateBodyText();
    }
  }

  updateBodyText() {
    const displayedText = this.fullText.slice(0, this.currentLength);
    const suffix = (this.currentLength < this.fullLength) ? "/" : "";
    this.bodyTarget.textContent = displayedText + suffix;
  }

  typeWriterEffect() {
    this.interval = setInterval(() => {
      if (this.currentLength < this.initialText.length) {
        this.currentLength += 1;
        this.bodyTarget.textContent = this.initialText.slice(0, this.currentLength) + "/";
      } else {
        clearInterval(this.interval);
      }
    }, 100);
  }
}
