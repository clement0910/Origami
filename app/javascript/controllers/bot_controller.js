import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ['form', 'profile']

    proposition() {
        console.log('coucou')
    }
}