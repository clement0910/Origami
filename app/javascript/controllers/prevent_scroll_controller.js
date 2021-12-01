import { Controller } from "stimulus";

export default class extends Controller {

    preventScroll() {
/*        document.addEventListener("touchmove", function (e) {
            e.preventDefault();
        }, {passive: false});*/
        console.log("coucou");
    }
}