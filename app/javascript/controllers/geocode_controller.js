
import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["geocoder"]

    geocode() {
        mapboxgl.accessToken = 'API_KEY';
        const geocoder = new MapboxGeocoder({
            accessToken: mapboxgl.accessToken,
            types: 'place'
        });

        geocoder.addTo('#geocoder');
    }
}