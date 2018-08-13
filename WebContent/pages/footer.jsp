<!-- <footer>
	<h4  style="color: maroon;">Footer lang</h4>
</footer> -->

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
	
	$('addStocks').observe('click', function(){
		window.location.assign(contextPath + "/addStocks");
	});
	
	$('userMaintenance').observe('click', function(){
		window.location.assign(contextPath + "/userMaintenance");
	});
	
	$('issueSupplies').observe('click', function(){
		window.location.assign(contextPath + "/issueSupplies");
	});
	
	$('headerTitle').observe('click', function(){
		window.location.assign(contextPath);
	});
	
	$('userprofileMaintenance').observe('click', function(){
		window.location.assign(contextPath + "/userMaintenance");
	});
	
	$('supplyMaintenance').observe('click', function(){
		window.location.assign(contextPath + "/suppliesmaintenance");
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