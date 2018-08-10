<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stocks</title>
<script src="js/script.js"></script>
<style>
	input[type="text"] {
		width: 200px;
	}
	input[type="button"] {
		width: 100px;
		margin: 3px;
	}
	.link {
		color: blue;
		text-decoration: underline;
		cursor: pointer;
	}
	
	#bottom {
		display: inline-block;
	}
	 
	#container {
		padding-left: 10%;
		padding-right: 10%;
		padding-bottom: 20px;
  		display: flex;
  		flex-flow: row nowrap;
  		justify-content: space-between;
	}
	
	#stocksTable {
		margin-top: 20px;
		border-collapse: collapse;
	}
	
	#stocksTable td, th {
		padding: 5px;
		width: 200px;
		border: 1px solid gray;
		text-align: center;
	}
</style>
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>
</head>
<body>
<div id="mainContents">
<h3>Stocks</h3>
	<div id="container">
		<div id="left">
		<table>
			<tr>
				<td>Item Name</td>
				<td><select id="itemName" disabled>
					<c:forEach var="item" items="${suppliesItemList}">
						<option value="${item.supplyId}"><c:out value="${item.itemName}"/></option>
					</c:forEach>
					</select></td>
			</tr>
			<tr>
				<td>Quantity</td>
				<td><input type="text" name="txtQuantity" id="txtQuantity" disabled></td>
			</tr>
			<tr>
				<td>Reference No.</td>
				<td><input type="text" name="txtReferenceNo" id="txtReferenceNo" disabled></td>
			</tr>
			<tr>
				<td>Date Added</td>
				<td><input type="text" name="txtDateAdded" id="txtDateAdded" disabled></td>
			</tr>
			<tr>
				<td>Purchase Date<br> <sub>(mm/dd/yyyy):</sub></td>
				<td><input type="text" name="txtPurchaseDate" id="txtPurchaseDate" disabled></td>
			</tr>
		</table>
		</div>
		<div id="right">
			<input type="button" id="addBtn" value="Add Stocks"><br>
			<input type="button" id="cancelBtn" value="Cancel"><br>
		</div>
	</div>
	<div id="bottom">
		<input type="text" name="txtSearch" id="txtSearch">
		<input type="button" id="searchBtn" value="Search">
		<table id="stocksTable">
			<tr>
				<th>Stock ID</th>
				<th>Item Name</th>
				<th style="display: none;"></th>
				<th>Qty</th>
				<th>Reference No.</th>
				<th>Date Added</th>
				<th>Purchase Date</th>
				<th>Last Updated By</th>
				<th>Last Update</th>
			</tr>
			<c:if test="${stocksList == '[]'}">
			<tr>
				<td colspan="8"><c:out value="No records found"></c:out></td>
			</tr>
			</c:if>
			<c:forEach var="stocks" items="${stocksList}">
				<tr class="tablerow">
					<td><a class="link"><c:out value="${stocks.stockId}"/></a></td>
					<td><c:out value="${stocks.itemName}"/></td>
					<td style="display: none;"><c:out value="${stocks.supplyId}"/></td>
					<td><c:out value="${stocks.quantity}"/></td>
					<td><c:out value="${stocks.referenceNo}"/></td>
					<td><fmt:formatDate pattern="M/dd/yyyy" value="${stocks.dateAdded}"/></td>
					<td><fmt:formatDate pattern="M/dd/yyyy" value="${stocks.purchaseDate}"/></td>
					<td><c:out value="${stocks.lastUser}"/></td>
					<td><fmt:formatDate pattern="M/dd/yyyy" value="${stocks.lastUpdate}"/></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
<script>
	$("addBtn").observe("click", function() {
		action = "AddRecord";
		
		new Ajax.Request(contextPath + "/nextPage", {
			method: "POST",
			parameters: {
				action: "displayNextPage"
			},
			onComplete: function(response){
				 $("mainContents").update(response.responseText);
			}
		});
	});
	
	$("searchBtn").observe("click", function() {
		if($F("txtSearch") == "" || $F("txtSearch") == null) {
			window.location.reload();
		} else {
			searchSuppliesStocksRecord();
		}
	});
	
	$("cancelBtn").observe("click", function() {
		cancelSuppliesStocksRecord();
	});
	
	Event.observe(this, "load", function() {
		$("itemName").value = "";
		$("txtQuantity").value = "";
		$("txtReferenceNo").value = "";
		$("txtDateAdded").value = "";
		$("txtPurchaseDate").value = "";
		$("txtSearch").value = "";
	});
	
var flag = false;

	$$(".tablerow").forEach(function(param) {
		param.down('a' ,0).observe("click", function() {
			flag = true;
			action = "UpdateRecord";
			 new Ajax.Request(contextPath + "/nextPage", {
					method: "POST",
					parameters: {
							action: "displayNextPage",
							stockId: param.down('td', 0).down('a').innerHTML,
							supplyId: param.down('td', 2).innerHTML,
							quantity: param.down('td', 3).innerHTML,
							referenceNo: param.down('td', 4).innerHTML,
							dateAdded: param.down('td', 5).innerHTML,
							purchaseDate: param.down('td', 6).innerHTML
					},
					onComplete: function(response){
						 $("mainContents").update(response.responseText);
					}
				}); 
		});

		param.observe("click", function() {
			if(flag == false) {
				$("itemName").value = param.down('td', 2).innerHTML;
				$("txtQuantity").value = param.down('td', 3).innerHTML;
				$("txtReferenceNo").value = param.down('td', 4).innerHTML;
				$("txtDateAdded").value = param.down('td', 5).innerHTML;
				$("txtPurchaseDate").value = param.down('td', 6).innerHTML;
			}
		});
	});
	
</script>
</html>