$(document).ready(function () {
	
	alert("alive");
	
	$(".accountSelect").click(function(){
				//getting PK of account from TD id
				var account_id = $(this).attr('id').replace(/\D/g,'');
				//change value of account-input to match clicked account's PK
				document.getElementById('inAccountName').value = account_id;
				//alert(account_id);
			});
	$(".institutionSelect").click(function(){
				//getting PK of institution from TD id
				var place_id = $(this).attr('id').replace(/\D/g,'');
				//change value of institution-input to match clicked place's PK
				document.getElementById('inInstitutionName').value = place_id;
				//alert(institution_id);
			});			
});