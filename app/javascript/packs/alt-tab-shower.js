// hide all the alternative tabs initially
$('.alt-tab').click(function(){	
	var $altTableSection = ".nav-".concat(event.srcElement.id.substring(4));
	if (!$($altTableSection).is(':visible')) {
		$($altTableSection).show().find('td').wrapInner('<div style="display: none;" />').parent().find('td > div').slideDown(700, function() {
			var $set = $(this);
			$set.replaceWith($set.contents());
		});	
	} else {
		$($altTableSection).find('td').css("padding","0 5px").wrapInner('<div style="display: block;" />').parent().find('td > div').slideUp(700, function(){
			$($altTableSection).hide();
			var $set = $(this);
			$set.replaceWith($set.contents());
		});


	};
});