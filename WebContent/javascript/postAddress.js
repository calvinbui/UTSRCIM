$('#postalCheck').change(function () {
    if($(this).is(':checked')) 
    {
        $('.postalRequired').attr("required", "true");
        $('.postalRequired').removeAttr("disabled", false);
    } 
    else 
    {
        $('.postalRequired').removeAttr("required", "true");
        $('.postalRequired').attr("disabled", true);
    	$('.postalRequired').val("");
    }
});

if($('#postalCheck').is(':checked')) 
{
    $('.postalRequired').attr("required", "true");
    $('.postalRequired').removeAttr("disabled", false);
}
else 
{
	$('.postalRequired').removeAttr("required", "true");
	$('.postalRequired').attr("disabled", true);
}