// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {

 	$('#record_type').on('change', function() {
		if(this.value == "MX"){			
			$('.prio').removeClass("hidden");	
		}
		else{
		  	$('.prio').addClass("hidden");
		}

	});
	
	$('#domain_name_input').on('input', function() {
		var inputval  = $('#domain_name_input').val();
		if (gon.domainname == inputval){			
			$('#delete_button').removeClass("disabled");	
		}
		else{
		  	$('#delete_button').addClass("disabled");
		} 

	});
 
});
$(document).ready(function() {

      
});