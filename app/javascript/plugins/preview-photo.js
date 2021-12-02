const input = document.querySelector('.input-photo')
const img = document.querySelector('#img-preview')
const plus = document.querySelector('#img-plus')
input.addEventListener('change', evt => {
    const file = input.files[0]
    console.log("cici")
    console.log(file)
    if (file) {
        img.src = URL.createObjectURL(file)
        plus.classList.add('none')
    }
})