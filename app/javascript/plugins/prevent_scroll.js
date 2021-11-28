
const preventScroll = () => {
    document.addEventListener("touchmove", function (e) {
        e.preventDefault();
    }, {passive: false});
};

export { preventScroll }
