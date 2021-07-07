const toggleBtn = document.querySelector(".delivery_navbar_toggleBtn");
const menu = document.querySelector(".delivery_navbar_menu_div");
const closeDiv = document.querySelector(".menu_div_close");
//const icons = document.querySelector(".delivery_navbar_icons");

/*toggleBtn.addEventListener("click", () => {
	//menu.classList.toggle("active");
	//icons.classList.toggle("active");
	
});*/

toggleBtn.addEventListener('click', onClick);
closeDiv.addEventListener('click', offClick);

function onClick() {
	menu.style.display ='block';
}

function offClick() {
	menu.style.display ='none';
}