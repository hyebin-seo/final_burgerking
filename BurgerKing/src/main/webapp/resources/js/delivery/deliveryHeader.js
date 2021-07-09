const toggleBtn = document.querySelector(".delivery_navbar_toggleBtn");
const menu = document.querySelector(".delivery_navbar_menu_div");
const closeDiv = document.querySelector(".menu_div_close");

//햄버거 버튼을 클릭하면 메뉴 출력
toggleBtn.addEventListener('click', onClick);
//메뉴 안의 X버튼 클릭시 메뉴 숨김
closeDiv.addEventListener('click', offClick);

function onClick() {
	menu.style.display ='block';
}

function offClick() {
	menu.style.display ='none';
}