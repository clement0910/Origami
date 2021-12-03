import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ['connected', 'unconnected']

    connectSpotify() {
        this.connectedTarget.classList.remove('none')
        this.unconnectedTarget.classList.add('none')
    }
}