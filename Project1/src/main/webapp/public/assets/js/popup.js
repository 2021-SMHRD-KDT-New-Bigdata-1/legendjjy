function showPopup() {
	const popup = document.querySelector('#popup');

	popup.classList.add('has-filter');

	popup.classList.remove('hide');
}

function closePopup() {
	const popup = document.querySelector('#popup');
	popup.classList.add('hide');
}

function showModify(){
	const popup = document.querySelector('#content_modify');
	
	popup.classList.remove('modify_hide')
}