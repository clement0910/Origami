
const scroll = () => {
    if (/[a-zA-Z].+chatrooms.\d+/.test(document.location.href.split('#')[0])) {
        document.getElementById(`${window.location.hash.replace('#', '')}`).scrollIntoView()
    }
}

export { scroll };