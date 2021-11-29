import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['email', 'emailbut', 'emailin', 'password', 'passwordin', 'passwordbut', 'passwordconfin', 'name', 'namein', 'namebut', 'gender', 'genderbut', 'genderin', 'birthday', 'birthdayin', 'birthdaybut', 'city', 'cityin', 'citybut', 'photo', 'submit'];

    showEmail(event) {
      if ((event.keyCode === 13 || event.target.id === 'next') && this.emailinTarget.value.match(/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/) != null) {
        this.emailTarget.classList.toggle('none');
        this.passwordTarget.classList.toggle('none')
      }
      else if ((event.keyCode === 13 || event.target.id === 'next') && this.emailinTarget.classList.contains("red") === false) {
        this.emailinTarget.classList.toggle('red')
      }
      if (event.keyCode > 0 && this.emailinTarget.classList.contains("red")) {
        this.emailinTarget.classList.toggle('red')
      }
    }

    showPassword(event) {
      if ((event.keyCode === 13 || event.target.id === 'next') && this.passwordinTarget.value.length >= 6 && this.passwordconfinTarget.value.length >= 6 && this.passwordinTarget.value === this.passwordconfinTarget.value) {
        this.passwordTarget.classList.toggle('none');
        this.nameTarget.classList.toggle('none')
      }
      else if ((event.keyCode === 13 || event.target.id === 'next') && this.passwordinTarget.classList.contains("red") === false) {
        this.passwordinTarget.classList.toggle("red");
        this.passwordconfinTarget.classList.toggle("red")
      }
      if (event.keyCode > 0 && this.passwordinTarget.classList.contains("red")) {
        this.passwordinTarget.classList.toggle("red");
        this.passwordconfinTarget.classList.toggle("red")
      }
    }

    showName(event) {
      if ((event.keyCode === 13 || event.target.id === 'next' ) && this.nameinTarget.value.length >= 2) {
        this.nameTarget.classList.toggle('none');
        this.genderTarget.classList.toggle('none')
      }
      else if (event.keyCode === 13 || event.target.id === 'next') {
        this.nameinTarget.classList.toggle("red");
      }
      if (event.keyCode > 0 && this.nameinTarget.classList.contains("red")) {
        this.nameinTarget.classList.toggle("red");
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
