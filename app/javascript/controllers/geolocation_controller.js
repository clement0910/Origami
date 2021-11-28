
import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "link" ]

    geolocate() {
        if (!navigator.geolocation) {
            this.linkTarget.textContent = "Geolocation is not supported in this browser."
        } else {
            navigator.geolocation.getCurrentPosition(this.success.bind(this), this.error.bind(this))
        }
    }

    success(position) {
        this.linkTarget.textContent = `Latitude: ${position.coords.latitude}, Longitude: ${position.coords.longitude}`
    }

    error() {
        this.linkTarget.textContent = "Unable to get your location."
    }
}