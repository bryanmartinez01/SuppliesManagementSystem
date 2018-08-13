<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stocks</title>
<style>
	input[type="text"], #itemName{
		width: 200px;
	}
	
	input[type="button"] {
		width: 100px;
		margin: 3px;
	}
</style>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<script src="js/prototype.js"></script>
<script src="js/script.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>

<c:if test="${empty currentUserId}">
	window.location.assign(contextPath);
</c:if>

<c:if test="${currentAccessLevel == 'U'}">
	<script>
		$('maintenance').hide();
		$('reports').hide();
	</script>
</c:if>

</head>
<jsp:include page="header.jsp" />
<body>
<h3>Stocks</h3>
<div id="container" class="container-fluid">
	<div id="left">
		<input type="hidden" id="stockId" value="${stockId}">
		<table>
			<tr>
				<td>Item Name</td>
				<td><select id="itemName">
					<c:forEach var="item" items="${suppliesItemList}">
						<option value="${item.supplyId}" <c:if test="${selectedSupplyId == item.supplyId}"><c:out value="selected"/></c:if>>
							<c:out value="${item.itemName}"/></option>
					</c:forEach>
					</select></td>
			</tr>
			<tr>
				<td>Quantity</td>
				<td><input type="text" name="txtQuantity" id="txtQuantity" value="${quantity}"></td>
			</tr>
			<tr>
				<td>Reference No.</td>
				<td><input type="text" name="txtReferenceNo" id="txtReferenceNo" value="${referenceNo}"></td>
			</tr>
			<tr>
				<td>Date Added</td>
				<td><input type="text" name="txtDateAdded" id="txtDateAdded" value="${dateAdded}" disabled></td>
			</tr>
			<tr>
				<td>Purchase Date<br> <sub>(mm/dd/yyyy):</sub></td>
				<td><input type="text" name="txtPurchaseDate" id="txtPurchaseDate" value="${purchaseDate}"></td>
			</tr>
		</table>
	</div>
	<div id="right">
		<input type="button" id="saveBtn" value="Save"><br>
		<input type="button" id="cancelBtn" value="Cancel"><br>
	</div>
</div>
<jsp:include page="footer.jsp" />
</body>
<script>
	$("txtDateAdded").value = $F("txtDateAdded") == ""? mm + "/" + dd + "/" + yyyy : $F("txtDateAdded");

	if(action == "UpdateRecord") {
		$("txtQuantity").disable();
		$("itemName").disable();
	}
	
	$("cancelBtn").observe("click", function() {
		cancelSuppliesStocksRecord();
	});
	
	$("saveBtn").observe("click", function() {
		if(action == "UpdateRecord") {
			updateSuppliesStocksRecord();
		} else if(action == "AddRecord") {
		 	addSuppliesStocksRecord(); 
		}
	});

</script>
</html>