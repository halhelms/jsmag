<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
test
<script type="text/javascript">
	$.post(
		'test2.cfc?method=test',
		{
			context: 'context',
			id : 'id',
			payload : {
				firstName : "Hal",
				lastName : "Helms"
			}
		},
		function (response) {
			alert( response );
		}
	)
</script>
