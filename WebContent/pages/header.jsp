<header>
	<link rel="stylesheet" href="../css/style.css" type="text/css">
	<script type="text/javascript" src="../js/prototype.js"></script>
	<div id="headerTitle"><h2 style="color: black;">Supplies Management System</h2></div>
	<div id=borderDesign></div>
	<ul>
		<li><div id="issueSupplies">Issue Supplies</div></li>
		<li><div id="addStocks">Add Stocks</div></li>
		<li class="dropdown" id="maintenance">
			<div class="dropbtn">Maintenance</div>
				<div class="dropdown-content">
					<a id="supplyMaintenance">Supply Maintenance</a>
					<a id="userMaintenance">User Maintenance</a>
				</div>
		</li>
		<li class="dropdown">
			<div class="dropbtn">Hi ${currentUserFN}</div>
				<div class="dropdown-content">
					<a id="userprofileMaintenance">Update Profile</a>
					<a id="logoutBtn">Logout</a>
				</div>
		</li>

	</ul>
</header>