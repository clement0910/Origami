
const preventScroll = () => {
    if (/[a-zA-Z].+swiper/.test(document.location.href)) {
        document.addEventListener("touchmove", function (e) {
            e.preventDefault();
        }, {passive: false});
    }
};

export { preventScroll }
