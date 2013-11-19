$('input[name=empType]').change(function(){
	if(!$(this).is(":checked"))
		return;

	$('.ifCas').fadeIn();
	$('.postalRequired').attr("required", "true");
	$('.tempRes').attr("required", "true");
	$('.resiPostal').attr("required", "true");
	$('.reasonforjob').attr("required", "true");
	$('.righttowork').attr("required", "true");
	$('.finDets').attr("required", "true");
	$('.emergContact').attr("required", "true");	

	if($(this).val() == "SC")
	{
		$('.ifCas').hide();
		$('.postalRequired').removeAttr("required", "true");
		$('.tempRes').removeAttr("required", "true");
		$('.resiPostal').removeAttr("required", "true");
		$('.reasonforjob').removeAttr("required", "true");
		$('.righttowork').removeAttr("required", "true");
		$('.finDets').removeAttr("required", "true");
		$('.emergContact').removeAttr("required", "true");	
	}
	else if($(this).val() == "SA")
	{
		$('.ifCas').hide();
		$('.postalRequired').removeAttr("required", "true");
		$('.tempRes').removeAttr("required", "true");
		$('.resiPostal').removeAttr("required", "true");
		$('.reasonforjob').removeAttr("required", "true");
		$('.righttowork').removeAttr("required", "true");
		$('.finDets').removeAttr("required", "true");
		$('.emergContact').removeAttr("required", "true");
	}
}).change();