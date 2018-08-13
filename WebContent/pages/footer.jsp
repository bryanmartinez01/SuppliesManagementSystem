<footer>
<link rel="stylesheet" href="../css/style.css" type="text/css">
	<div id=borderDesign></div>
	<div id="footerContainer">
		<br>Computer Professionals Inc. 2018 &copy;
		<br>Group 2
	</div>
</footer>
<script>
	$('logoutBtn').observe('click', function(){
		logout();
	});

	function logout(){
		new Ajax.Request(contextPath + "/login", {
			method: "GET",
			parameters: {
					/* userId: $F('userId'),
					password: $F('password') */
			},
			onComplete: function(response){
				window.location.assign(contextPath);	
			}
		});
}
</script>