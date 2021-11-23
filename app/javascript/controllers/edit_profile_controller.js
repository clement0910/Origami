import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ['btn', 'form', 'profile']

    displayForm() {
        this.btnTarget.classList.add('none')
        this.formTarget.classList.remove('none')
    }

    update(event) {
        event.preventDefault();
        const url = this.formTarget.action
        fetch(url, {
            method: 'PATCH',
            headers: { 'Accept': 'text/plain' },
            body: new FormData(this.formTarget)
        })
            .then(response => response.text())
            .then((data) => {
                console.log(data);
                this.profileTarget.outerHTML = data
            })
    }
}