$(".dropbtn").click( function () {
	$("#deleteOrder").toggle();
});

window.onclick = function(event) {
	if (!event.target.matches('.dropbtn')) {
		$(".dropdown-content").hide();
	}
}