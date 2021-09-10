const btn = document.querySelector(".clear");
const flash = document.querySelector(".flash");

btn.addEventListener("click", () => {
  flash.classList.toggle("hidden");
});
