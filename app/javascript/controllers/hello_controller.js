import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("asda");
    this.element.textContent = "Hello World!"
  }
}
