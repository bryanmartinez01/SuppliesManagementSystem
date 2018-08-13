<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<script type="text/javascript" src="../js/prototype.js"></script>

</head>

<jsp:include page="header.jsp" />

<!-- first login, redirect to change password page -->


<body>
	<%-- <h3><c:out value="Hello " /><a href='../userMaintenance'><c:out value="${currentUserFN}" /></a>!</h3> --%>

<%-- 	<c:if test="${currentAccessLevel == 'U'}">
		<script>
			$('maintenance').hide();
			$('reports').hide();
		</script>
	</c:if> --%>
	<div style="width: 100%; overflow: hidden;">
		<div style="width: 300px; text-align:center; font-family: Ubuntu-Regular; float: left; cursor: pointer;" id=issueIcon>
			<img src="../images/icons/issuance.jpg"  id=icons  width="260" height="300"/>
			<br><p style="font-size:22px"><b>Issue Supplies</b></p>
			<p style="font-size:16px">Issuance of Supplies to respective departments.</p>
		</div>
		
		<div style="margin-left:50px; text-align:center; font-family: Ubuntu-Regular; float: left; cursor: pointer;" id=addStockIcon>
			<img src="../images/icons/addStocks.jpg"  id=icons  width="300" height="300" />
			<br><p style="font-size:22px"><b>Add Stocks</b></p>
			<p style="font-size:16px">Adding of Stocks to supply storage.</p>
		</div>
		
		<div style="text-align:center; font-family: Ubuntu-Regular; float: right; cursor: pointer;" id=userMaintenanceIcon>
			<img src="../images/icons/usermaint.jpg"  id=icons  width="280" height="280" />
			<br><p style="font-size:22px"><b>User Maintenance</b></p>
			<p style="font-size:16px">Modify user details, and change password.</p>
		</div>
	</div>

	<c:if test="${currentAccessLevel == 'U'}">
		<script>
			$('maintenance').hide();
			$('reports').hide();
		</script>
	</c:if>
</body>
<jsp:include page="footer.jsp"></jsp:include>
<script>
$("issueIcon").observe("click", function(){
	window.location.assign(contextPath+"/issueSupplies");
})

$("addStockIcon").observe("click", function(){
	window.location.assign(contextPath+"/addStocks");
})

$("userMaintenanceIcon").observe("click", function(){
	window.location.assign(contextPath+"/userMaintenance");
})
</script>
</html>
