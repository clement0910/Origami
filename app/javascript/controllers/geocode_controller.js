
import { Controller } from "stimulus"
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

export default class extends Controller {
    static targets = ["geocoder", "result"]

/*    geocode() {
        mapboxgl.accessToken = 'API_KEY';
        const geocoder = new MapboxGeocoder({
            accessToken: mapboxgl.accessToken,
            types: 'place'
        });

        geocoder.addTo('#geocoder');
    }*/

    geocode () {
        mapboxgl.accessToken = 'pk.eyJ1IjoiY2xlbWVudDA5MTAiLCJhIjoiY2t2a3FienIxMDQ5bDJ1bThhMHZqbnNleCJ9.p2lAdPybuzzvWpX87Zd6Xw';
        const geocoder = new MapboxGeocoder({
            accessToken: mapboxgl.accessToken,
            types: 'place'
        });

        geocoder.addTo('#geocoder');

        // Get the geocoder results container.
        const results = this.resultTarget;

        // Add geocoder result to container.
        geocoder.on('result', (e) => {
            results.innerText = JSON.stringify(e.result, null, 2);
        });

// Clear results container when search is cleared.
        geocoder.on('clear', () => {
            results.innerText = '';
        });

    }
}
