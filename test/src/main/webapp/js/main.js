//selectors

let mainNav = document.querySelector('#mainNav');


window.addEventListener('scroll', function(){
        let windowPosition = window.scrollY > 0;
        mainNav.classList.toggle('active', windowPosition)
})


