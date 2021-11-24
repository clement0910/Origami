import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ['email', 'password', 'name', 'gender', 'birthday', 'city', 'photo', 'submit'];

    showPassword(event) {
        if (event.keyCode === 13) {
            this.emailTarget.classList.toggle('none');
            this.passwordTarget.classList.toggle('none')
        }
        else if ( event.target.id === 'next' ) {
            this.emailTarget.classList.toggle('none');
            this.passwordTarget.classList.toggle('none');
        }
    }

    showName(event) {
        if (event.keyCode === 13) {
            this.passwordTarget.classList.toggle('none');
            this.nameTarget.classList.toggle('none')
        }
        else if ( event.target.id === 'next' ) {
            this.passwordTarget.classList.toggle('none');
            this.nameTarget.classList.toggle('none');
        }
    }
    showGender(event) {
        if (event.keyCode === 13) {
            this.nameTarget.classList.toggle('none');
            this.genderTarget.classList.toggle('none')
        }
        else if ( event.target.id === 'next' ) {
            this.nameTarget.classList.toggle('none');
            this.genderTarget.classList.toggle('none');
        }
    }
    showCity(event) {
        if (event.keyCode === 13) {
            this.genderTarget.classList.toggle('none');
            this.cityTarget.classList.toggle('none');
        }
        else if ( event.target.id === 'next' ) {
            this.genderTarget.classList.toggle('none');
            this.cityTarget.classList.toggle('none');
        }
    }
    showBirthday(event) {
        if (event.keyCode === 13) {
            this.cityTarget.classList.toggle('none');
            this.birthdayTarget.classList.toggle('none');
        }
        else if ( event.target.id === 'next' ) {
            this.cityTarget.classList.toggle('none');
            this.birthdayTarget.classList.toggle('none');
        }
    }
    showPhoto(event) {
        if (event.keyCode === 13) {
            this.birthdayTarget.classList.toggle('none');
            this.photoTarget.classList.toggle('none');
            this.submitTarget.disabled = false;
        }
        else if ( event.target.id === 'next' ) {
            this.birthdayTarget.classList.toggle('none');
            this.photoTarget.classList.toggle('none');
            this.submitTarget.disabled = false;
        }
    }



}