import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['email', 'emailbut', 'emailin', 'password', 'passwordin', 'passwordbut', 'passwordconfin', 'name', 'namein', 'namebut', 'gender', 'genderbut', 'genderin', 'birthday', 'birthdayin', 'birthdaybut', 'city', 'cityin', 'citybut', 'photo', 'submit'];

    showEmail(event) {
      if (event.keyCode === 13 || event.target.id === 'next') {
        this.emailTarget.classList.toggle('none');
        this.passwordTarget.classList.toggle('none')
      }
      if (event.keyCode > 0 && this.emailinTarget.value.match(/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/) != null) {
        this.emailbutTarget.classList = 'btn btn-color';
      }
    }

    showPassword(event) {
      if ((event.keyCode === 13 || event.target.id === 'next') && this.passwordinTarget.value.length >= 6) {
        this.passwordTarget.classList.toggle('none');
        this.nameTarget.classList.toggle('none')
      }
      if (event.keyCode > 0 && this.passwordinTarget.value.length >= 6 && this.passwordconfinTarget.value.length >= 6) {
        this.passwordbutTarget.classList = 'btn btn-color';
      }
    }

    showName(event) {
      if ((event.keyCode === 13 || event.target.id === 'next' ) && this.nameinTarget.value.length >= 2) {
        this.nameTarget.classList.toggle('none');
        this.genderTarget.classList.toggle('none')
      }
      if (event.keyCode > 0 && this.nameinTarget.value.length >= 2) {
        this.namebutTarget.classList = 'btn btn-color';
      }
    }

    showGender(event) {
      if (event.keyCode === 13 || event.target.id === 'next') {
        this.genderTarget.classList.toggle('none');
        this.cityTarget.classList.toggle('none')
      }
    }

    showCity(event) {
      if (event.keyCode === 13 || event.target.id === 'next') {
            this.cityTarget.classList.toggle('none');
            this.birthdayTarget.classList.toggle('none');
        }
      if (event.keyCode > 0 && this.cityinTarget.value.length >= 2) {
        this.citybutTarget.classList = 'btn btn-color';
      }
    }

    showBirthday(event) {
      if (event.keyCode === 13 || event.target.id === 'next') {
          this.birthdayTarget.classList.toggle('none');
          this.photoTarget.classList.toggle('none');
        }
    }
    showPhoto(event) {
      if (event.keyCode === 13 || event.target.id === 'next') {
            this.birthdayTarget.classList.toggle('none');
            this.photoTarget.classList.toggle('none');
            this.submitTarget.disabled = false;
        }
    }
}
