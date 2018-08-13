<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!-- <header>
	<h2 style="color: gray;">HEADER kasama menu at logout</h2>
	<ul>
		<li id="maintenance"><a href="#">Maintenance</a></li>
		<li id="issueSupplies"><a href="#">Issue Supplies</a></li>
		<li id="addStocks"><a href="#">Add Stocks</a></li>
		<li id="reports"><a href="#">Reports</a></li>
	</ul>
	<input id="logoutBtn" type="button" style="float: right;" value="Logout"/>
</header> -->

<script>var contextPath = "${pageContext.request.contextPath}";</script>
<header>
	<link rel="stylesheet" href="../css/style.css" type="text/css">
	<script type="text/javascript" src="../js/prototype.js"></script>
	<div id="headerTitle" style="cursor: pointer;"><h2 style="color: black;">Supplies Management System</h2></div>
	<div id=borderDesign></div>
	<ul>
		<li class="dropdown" id="maintenance">
			<div class="dropbtn">Maintenance</div>
				<div class="dropdown-content">
					<a id="supplyMaintenance">Supply Maintenance</a>
					<a id="userMaintenance">User Maintenance</a>
				</div>
		</li>
		<li><div class="primary" id="issueSupplies">Issue Supplies</div></li>
		<li><div class="primary" id="addStocks">Add Stocks</div></li>
		
		<li class="dropdown">
			<div class="dropbtn">Hi ${currentUserFN}</div>
				<div class="dropdown-content">
					<a id="userprofileMaintenance">Update Profile</a>
					<a id="logoutBtn">Logout</a>
				</div>
		</li>
	</ul>
</header>



<c:if test="${empty currentUserId}">
	<script>
		window.location.assign(contextPath);
	</script>
</c:if>

<c:if test="${currentUserId == currentPassword}">
	<script>
		window.location.assign(contextPath+"/changepass");
	</script>
</c:if>

<c:if test="${currentAccessLevel == 'U'}">
	<script>
		$('maintenance').hide();
		$('reports').hide();
	</script>
</c:if>	