import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ['email', 'password', 'name', 'gender', 'birthday', 'city', 'photo'];

    showPassword(event) {
        if (event.keyCode === 13) {
            this.emailTarget.classList.toggle('none');
            this.passwordTarget.classList.toggle('none')
        }
    }

    showName() {
        this.passwordTarget.classList.toggle('none');
        this.nameTarget.classList.toggle('none')
    }
    showGender() {
        this.nameTarget.classList.toggle('none');
        this.genderTarget.classList.toggle('none')
    }
    showCity() {
        this.genderTarget.classList.toggle('none');
        this.cityTarget.classList.toggle('none')
    }
    showBirthday() {
        this.cityTarget.classList.toggle('none');
        this.birthdayTarget.classList.toggle('none')
    }
    showPhoto() {
        this.birthdayTarget.classList.toggle('none');
        this.photoTarget.classList.toggle('none')
    }



}