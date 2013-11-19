<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />

<h3>Create Rate</h3>

<form name="createRate" action="createRateController.jsp" method="POST">

	<table class="table">
		<tr>
			<td>Type</td>
			<td><input class="form-control" type="text" placeholder="Type" name="rateType" pattern="[a-zA-Z0-9_. ,-]{0,45}" title="Letters only" required/></td>
		</tr>
		<tr>
			<td>Rate</td>
			<td><div class="input-group"><span class="input-group-addon">$</span>
				<input class="form-control" type="text" placeholder="100.00" name="ratePrice" pattern="\d+(\.\d{2})?" required></div></td>

		</tr>
		<tr>
			<td>Description</td>
			<td><textarea class="form-control" placeholder="Description" rows="4" cols="50" name="description" required maxlength="1000"></textarea></td>
		</tr>
	</table>
	<div class="text-center">
	<button type="submit" data-toogle="tooltip" data-placement="right" title="Create this rate" data-loading-text='<i class="fa fa-spinner"></i> Creating...' onclick="loading()" class="btn btn-success btn-lg"><i class="fa fa-check"></i> Create</button>
	</div>
</form>

<script>
function loading()
{
	$('.btn').button('loading');
	setTimeout(function () 
	{
		$('.btn').button('reset');
    }, 3000);
}
</script>

<jsp:include page="../includes/footer.jsp" />