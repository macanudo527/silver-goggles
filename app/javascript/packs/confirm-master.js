$("td.master_entry_link").on('click', function(){
	console.log($(this).closest('tr').attr('id'));
	$(this).off( event );
});