import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ['email', 'password'];

    switchPage() {
        this.emailTarget.classList.toggle('none');
        this.passwordTarget.classList.toggle('none')
    }

}