// app/javascript/components/navbar.js
const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const showBg = document.querySelector('.navbar-collapse');
  if (navbar) {
    window.addEventListener('scroll', () => {
      // console.log(window.scrollY);
      if (window.scrollY >= 170)   {
        navbar.classList.add('navbar-lewagon-dark');
        if (showBg.classList.contains('show')) {
          showBg.style.backgroundColor = 'transparent';
        }
      } else {
        navbar.classList.remove('navbar-lewagon-dark');
        if (showBg.classList.contains('show')) {
          showBg.style.backgroundColor = 'rgba(0,0,0,.8)';
        }
      };
    });
  }
}

export { initUpdateNavbarOnScroll };
