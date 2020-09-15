import Swal from 'sweetalert2'

$("a.master_entry_link").on('click', function(){
	Swal.fire({
		title: 'Master this Word',
		html: 
			'By mastering this word, it will no longer appear in this or future study lists.' +
			'However, you can add them back in at any time from your profile page.',
		icon: 'warning',
		input: 'checkbox',
		inputPlaceholder: "<small>Please don't show this warning again.</small>",
		showCancelButton: true,
		confirmButtonText: 'Master it'
	}).then((result) => {
		if (result.isConfirmed) {
			$.ajax({ url: '/study_records/master.json', type: 'POST',
		  		beforeSend: function(xhr) {
		  			if (xhr && xhr.overrideMimeType) {
		  				xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
		  				xhr.overrideMimeType('application/json;charset=utf-8');}
		  			},
		  		data: { study_record: {entry_id: $(this).attr('data-entryid') } },
		  		dataType: 'json',
		  		success: function(data, status, jqXHR) {// success callback
		 			$(`#entry-${data}`).remove();
		  		}
			}); 
			
			if (result.value) {
				$.ajax({ url: '/user_settings.json', type: 'POST',
					beforeSend: function(xhr) {
						if (xhr && xhr.overrideMimeType) {
							xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
							xhr.overrideMimeType('application/json;charset=utf-8');}
						},
						data: { user_setting: {setting_id: 1, unconstrained_value: "false" } },
						dataType: 'json',
			  		success: function(data, status, jqXHR) {// success callback
			  			
			  		}
		  		}); 

		  		//Prevent the master warning from showing without refreshing page
		  		$("a.master_entry_link").off('click');			
			}

		}
	})
	$(this).off( event );
	return false;
});