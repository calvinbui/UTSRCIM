$('#role').change(function () {
	if($(this).val() == "Marker")
    {
        $('.marker').attr("required", "true");
        $('.marker').removeAttr("disabled", false);
    } 
	else 
	{
        $('.marker').removeAttr("required", "true");
        $('.marker').attr("disabled", true);
    }
});