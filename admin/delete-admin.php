<?php

	include('../config/constants.php');

	//1. get the ID of Admin to be deleted
	echo $id = $_GET['id'];

	//2. create sql query to delete admin
	$sql = "DELETE FROM tbl_admin WHERE id = $id";
	$res = mysqli_query($conn, $sql);

	//3. redirecting to the manage admin page with message(success/error)
	if($res == TRUE){
		$_SESSION['delete'] = "<div class = 'success'>Admin Deleted Successfully</div>";
		//Redirect to Manage Admin page
		header("location:".SITEURL.'admin/manage-admin.php');
	}

	else{
		$_SESSION['delete'] = "<div class = 'error'>Failed to Delete Admin</div>";
		//Redirect to Delete Admin page
		header("location:".SITEURL.'admin/delete-admin.php');
	}

?>