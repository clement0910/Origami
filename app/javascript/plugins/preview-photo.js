
const previewPhoto = () => {

    const input = document.querySelector('.input-photo')
    const img = document.querySelector('#img-preview')
    const plus = document.querySelector('#img-plus')

    if (input) {
        input.addEventListener('change', evt => {
            const file = input.files[0]
            if (file) {
                img.src = URL.createObjectURL(file)
                plus.classList.add('none')
            }
        })
    }
}
export { previewPhoto };