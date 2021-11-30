import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ['modal']

    showModal() {
        this.modalTarget.classList.remove('none')
    }

    closeModal() {
        this.modalTarget.classList.add('none')
    }
}