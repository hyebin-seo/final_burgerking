const closeBtn = document.querySelector(".btn_close");
const popup = document.querySelector(".popWrap");

closeBtn.addEventListener('click', offPopup);

function offPopup() {
	popup.style.display ='none';
}