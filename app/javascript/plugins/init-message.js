const scroll = () => {
    if (/[a-zA-Z].+chatrooms.\d+/.test(document.location.href.split('#')[0])) {
        const objDiv = document.getElementById("messages");
        objDiv.scrollTop = objDiv.scrollHeight;
    }
}

export { scroll };
