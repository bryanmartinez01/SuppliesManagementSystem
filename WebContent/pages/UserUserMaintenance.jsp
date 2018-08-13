<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Maintenance - User</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<script src="js/prototype.js"></script>
<jsp:include page="header.jsp" />
</head>
<body>	
	<div id="userMainContents">
	<div id="usrDetails">
	<h3>&nbsp;&nbsp;&nbsp;User Maintenance - User</h3>
		<table>
			<tr>
				<td><label>User ID: </label></td>
				<td><input type="text" id="txtUserId" value="${currentUserId}" disabled="disabled"></td>
				<td><a href='#' id='changePwBtn'>Change Password</a></td>
			</tr>
			<tr>
				<td><label>First Name: </label></td>
				<td><input type="text" id="txtFirstName"></td>
				<td></td>
				<td><input type='button' id='btnUpdate' value='Update'></td>

			</tr>
			<tr>
				<td><label>Last Name: </label></td>
				<td><input type="text" id="txtLastName"></td>
				<td></td>
				<td><input type='button' id='btnCancel' value='Cancel'></td>
			</tr>

			<tr>
				<td><label>Middle Initial: </label></td>
				<td><input type="text" id="txtMI"></td>
			</tr>
			<tr>
				<td><label>Email: </label></td>
				<td><input type="text" id="txtEmail"></td>
				<td><input type="hidden" id="lastUserTxt" value="${currentUserId}"></td>
			</tr>
		</table>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp" />
<script>
	var id = 0;
	var currentRow = -1;
	var rec = [];
	var userIds = [];
	var hasKeyword = false;
	var keywordIdx = 0;
	

	$("changePwBtn").observe("click", function() {
		changePassword();
	});
	
	$("btnUpdate").observe("click", function() {
		updateRecord();
	});

	$("btnCancel").observe("click", function() {
		cancelUpdate();
	});


	function clearFields() {
		$("txtUserId").value = "";
		$("txtFirstName").value = "";
		$("txtLastName").value = "";
		$("txtMI").value = "";
		$("txtEmail").value = "";
		$("optAccessLevel").value = "";
	}


	/* UPDATE SCRIPT */
	function updateRecord() {
		var isNull = false;
		$w("txtUserId txtFirstName txtLastName txtMI txtEmail")
				.each(function(c) {
					if ($F(c) == null || $F(c) == "") {
						isNull = true;
					}
				})
		if (isNull) {
			alert("Fields cannot be null");
			return false;
		}

		new Ajax.Request(contextPath + "/updateRecord", {
			method : "POST",
			parameters : {
				action : "updateThisUser",
				userId : $F("txtUserId"),
				firstName : $F("txtFirstName"),
				lastName : $F("txtLastName"),
				middleInitial : $F("txtMI"),
				email : $F("txtEmail"),
				lastUser : $F("lastUserTxt")
			},
			onComplete : function(response) {
				alert("Record Updated!");
				window.location.reload();
			}
		});
	}

	function cancelUpdate() {
		new Ajax.Request(contextPath, {
			method : "POST",
			onComplete : function(response) {
				$("userMainContents").update(response.responseText);
			}
		});
	}
	
	function changePassword() {
		new Ajax.Request(contextPath + "/changepass", {
			method : "GET",
			parameters : {
				userId : $F("txtUserId")
			},
			onComplete : function(response) {
				$("userMainContents").update(response.responseText);
			}
		});
	}


</script>
</html>