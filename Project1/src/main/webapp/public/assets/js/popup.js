function showPopup() {
	const popup = document.querySelector('#popup');

	popup.classList.add('has-filter');
  
  	popup.classList.remove('hide');
}

function closePopup() {
	const popup = document.querySelector('#popup');
  popup.classList.add('hide');
}