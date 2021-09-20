
<?php include('partials/menu.php'); ?>
<!-- Main Content Section Starts -->
<div class="main-content">
	<div class="wrapper">
		<h1>Dashboard</h1>
		<br><br>
		<?php 
			include('partials/getV_id.php');
		?>
		<br><br>
		<?php 
			if(isset($_SESSION['login']))
			{
				echo $_SESSION['login'];
				unset($_SESSION['login']);
			}
		?>

		<div class="col-4 text-center">

			<?php 
				//Sql Query
				$sql1 = "SELECT DISTINCT tbl_category.id FROM tbl_category 
				INNER JOIN tbl_v_c ON tbl_category.id = tbl_v_c.c_id 
				INNER JOIN tbl_vendor ON tbl_v_c.v_id = ".$id;
				//Execute Query
				$res1 = mysqli_query($conn, $sql1);
				//Count Rows
				$count1 = mysqli_num_rows($res1);
			?>

			<h1><?php echo $count1; ?></h1>
			<br />
			Categories
		</div>


		<div class="col-4 text-center">

			<?php 
				//Sql Query 
				$sql2 = "SELECT DISTINCT tbl_food.id FROM tbl_food 
				JOIN tbl_v_f ON tbl_food.id = tbl_v_f.f_id 
				JOIN tbl_vendor ON tbl_v_f.v_id = ".$id;
				//Execute Query
				$res2 = mysqli_query($conn, $sql2);
				//Count Rows
				$count2 = mysqli_num_rows($res2);
			?>

			<h1><?php echo $count2; ?></h1>
			<br />
			Foods
		</div>

		<div class="col-4 text-center">
			
			<?php 
				//Sql Query 
				$sql3 = "SELECT DISTINCT tbl_order.id FROM tbl_order 
				INNER JOIN tbl_v_o ON tbl_order.id = tbl_v_o.o_id 
				INNER JOIN tbl_vendor ON tbl_v_o.v_id = ".$id;
				//Execute Query
				$res3 = mysqli_query($conn, $sql3);
				//Count Rows
				$count3 = mysqli_num_rows($res3);
			?>

			<h1><?php echo $count3; ?></h1>
			<br />
			Total Orders
		</div>

		<div class="col-4 text-center">
			
			<?php 
				//Creat SQL Query to Get Total Revenue Generated
				//Aggregate Function in SQL
				$sql4 = "SELECT SUM(total) AS Total FROM tbl_order 
				INNER JOIN tbl_v_o ON tbl_order.id = tbl_v_o.o_id 
				INNER JOIN tbl_vendor ON tbl_v_o.v_id = ".$id." WHERE status = 'Delivered' ";

				//Execute the Query
				$res4 = mysqli_query($conn, $sql4);

				//Get the VAlue
				$row4 = mysqli_fetch_assoc($res4);
				
				//GEt the Total REvenue
				$total_revenue = $row4['Total'];

			?>

			<h1>$<?php echo $total_revenue; ?></h1>
			<br />
			Revenue Generated
		</div>

		<div class="clearfix"></div>

	</div>
</div>
<!-- Main Content Setion Ends -->

<?php include('partials/footer.php') ?>