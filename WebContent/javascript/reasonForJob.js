if($('input[name=reasonforjob]:checked').val() == "Other")
{
    $('.ifOther').attr("required", "true");
    $('.ifOther').removeAttr("disabled", false);
} 
else 
{
    $('.ifOther').removeAttr("required", "true");
    $('.ifOther').attr("disabled", true);
}

$('input[name=reasonforjob]').change(function () {
    if($(this).val() == "Other")
    {
        $('.ifOther').attr("required", "true");
        $('.ifOther').removeAttr("disabled", false);
    } 
    else 
    {
        $('.ifOther').removeAttr("required", "true");
        $('.ifOther').attr("disabled", true);
    }
});