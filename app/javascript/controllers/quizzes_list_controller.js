import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quizzes-list"
export default class extends Controller {
  static values = { answer: String }

  showAnswer() {
    this.element.textContent = this.answerValue
    this.element.classList.remove("text-blue-400")
  }
}
