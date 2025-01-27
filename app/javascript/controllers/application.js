import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

var onload = () => {
  const root = document.documentElement;
  const toggle_btn = document.getElementById("mode-toggle");
  const cookie = document.cookie.split('; ').find(row => row.startsWith('color_scheme='));
  var colorScheme = (cookie ? cookie.split('=')[1] : null) || (window.matchMedia("(prefers-color-scheme: dark)").matches ? 'dark' : 'light');
  function colorSchemeChange(scheme) {
    if (scheme == 'dark') {
      root.style.setProperty('--bg', '#121f26');
      root.style.setProperty('--bg-foot', '#303846');
      root.style.setProperty('--primary', '#5bdec2');
      root.style.setProperty('--secondary', '#0c151a');
      root.style.setProperty('--neutral', '#addf00');
      root.style.setProperty('--suplimentary-1', '#68c5a2');
      root.style.setProperty('--suplimentary-2', '#778fb6');
      root.style.setProperty('--suplimentary-3', '#4f85a5');
      root.style.setProperty('--link', '#62a0e1');
      root.style.setProperty('--link-hover', '#abccee');
      root.style.setProperty('--color', '#ffffff');
      toggle_btn.innerHTML = "  ";
    } else {
      root.style.setProperty('--bg', '#ffffff');
      root.style.setProperty('--bg-foot', '#303846');
      root.style.setProperty('--primary', '#25c2a0');
      root.style.setProperty('--secondary', '#cbf4ec');
      root.style.setProperty('--neutral', '#addf00');
      root.style.setProperty('--suplimentary-1', '#68c5a2');
      root.style.setProperty('--suplimentary-2', '#778fb6');
      root.style.setProperty('--suplimentary-3', '#4f85a5');
      root.style.setProperty('--link', '#62a0e1');
      root.style.setProperty('--link-hover', '#abccee');
      root.style.setProperty('--color', '#000000');
      toggle_btn.innerHTML = "  ";
    }
  }
  colorSchemeChange(colorScheme);
  toggle_btn.addEventListener("click", () => {
    colorScheme = colorScheme == 'dark' ? 'light' : 'dark';
    colorSchemeChange(colorScheme);
    document.cookie = `color_scheme=${colorScheme}; path=/; max-age=${60 * 60 * 24 * 365}; samesite=lax`;
  })
}
document.addEventListener("turbo:render", () => {
  onload();
})
document.addEventListener("turbo:load", () => {
  onload();
})

export { application }
