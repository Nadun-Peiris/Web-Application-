window.addEventListener('scroll', function () {
    const header = document.querySelector('header');
    // Check if the page is scrolled to the top or not
    if (window.scrollY === 0) {
        header.style.backgroundColor = 'rgba(0, 0, 0, 0)'; // Transparent background when at the top
    } else {
        header.style.backgroundColor = 'rgba(0, 0, 0, 1)'; // Opaque background when scrolled down
    }
});
