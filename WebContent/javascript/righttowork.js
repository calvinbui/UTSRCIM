if($('input[name=righttowork]:checked').val() == "Temporary Resident")
{
    $('.tempRes').attr("required", "true");
    $('.tempRes').removeAttr("disabled", false);
} 
else 
{
    $('.tempRes').removeAttr("required", "true");
    $('.tempRes').attr("disabled", true);
}

$('input[name=righttowork]').change(function () {
	if($(this).val() == "Temporary Resident")
    {
        $('.tempRes').attr("required", "true");
        $('.tempRes').removeAttr("disabled", false);
    } 
	else 
	{
        $('.tempRes').removeAttr("required", "true");
        $('.tempRes').attr("disabled", true);

    	$('.tempRes').val("");
    }
});