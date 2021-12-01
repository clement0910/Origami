function detectMob() {
    return ( ( window.innerWidth <= 800 ) && ( window.innerHeight <= 600 ) );
}

const preventScroll = () => {
    if (detectMob) {
        document.addEventListener("touchmove", function (e) {
            if (/[a-zA-Z].+swiper/.test(document.location.href)) e.preventDefault();
        }, {passive: false});
    }
};

export { preventScroll }
