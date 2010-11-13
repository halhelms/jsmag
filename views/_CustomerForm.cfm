<cfoutput>

<form id="new_customer" method="post" action="Customer.cfc?method=#formAction#">
	<input type="hidden" name="id" value="#customer.id#">

	<div class="field">
		<label for="firstName">First Name</label>
		<input type="text" name="firstName" value="#customer.firstName#" />
	</div>
	<div class="field">
		<label for="email">Email</label>
		<input type="text" name="email" value="#customer.lastName#" />
	</div>
	<div class="submit">
		<input type="submit" value="Add Customer" />
	</div>
</form>

</cfoutput>
