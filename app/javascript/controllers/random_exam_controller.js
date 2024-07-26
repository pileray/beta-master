import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="random-exam"
export default class extends Controller {
  static values = { answer: String }
  static targets = [ "answer" ]

  showAnswer() {
    this.answerTarget.textContent = this.answerValue
    this.answerTarget.classList.remove("text-blue-400")
  }
}
