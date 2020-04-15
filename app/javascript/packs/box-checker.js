
// Grab all the toggle switches, find the checkboxes associated with each
$("input[id$='switch']").each(function (_, el) {
            var checkboxes = $(`table.${el.id.replace('_switch','')} input[type=checkbox]`);

            // Assign a click event to the toggle switches
            $(`#${el.id}`).click(function () {  

				// Perform function on each checkbox
				$(checkboxes).each(function (_,ol) {

                  	// If toggle is checked, check all, otherwise uncheck
                    if ($(`#${el.id}`).prop('checked')) {
                        $(`#${ol.id}`).prop('checked', true);
                    } else {
                        $(`#${ol.id}`).prop('checked', false);
					};                       
                });
            });
});