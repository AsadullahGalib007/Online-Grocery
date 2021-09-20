<?php
	include('../config/constants.php');
    include('partials/getV_id.php');
?>

<div class="main-content">
    <div class="wrapper">
        <h1>Delete Profile</h1>
        <br>
        <h4>**Enter your username and password to delete your profile**</h4>

        <br><br>
        <form action="" method="POST">

            <table class="tbl-30">

                <tr>
                    <td>Username: </td>
                    <td>
                        <input type="text" name="username" placeholder="Your Username">
                    </td>
                </tr>
                
                <tr>
                    <td>Current Password: </td>
                    <td>
                        <input type="password" name="current_password" placeholder="Current Password">
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <input type = "submit" name = "submit" value = "Delete Profile">
                    </td>
                </tr>

            </table>

        </form>
    </div>
</div>

<?php
if(isset($_POST['submit'])){
    $username = $_POST['username'];
    $current_password =md5($_POST['current_password']);

    $sqlE = "SELECT * FROM tbl_vendor WHERE id=$id AND password='$current_password'";
    $resE = mysqli_query($conn, $sqlE);
    
    if($resE== true){
        //If a vendor is deleted, all his things should be deleted
    $sql2 = "DELETE FROM tbl_food WHERE id = (SELECT tbl_v_f.f_id FROM tbl_v_f WHERE v_id = $id)";
    $res2 = mysqli_query($conn, $sql2);
    
    $sql3 = "DELETE FROM tbl_category WHERE id = (SELECT tbl_v_c.c_id FROM tbl_v_c WHERE v_id = $id)";
    $res3 = mysqli_query($conn, $sql3);
    
    $sql4 = "DELETE FROM tbl_order WHERE id = (SELECT tbl_v_o.o_id FROM tbl_v_o WHERE v_id = $id)";
    $res4 = mysqli_query($conn, $sql4);

    //2. create sql query to delete vendor
    $sql = "DELETE FROM tbl_vendor WHERE id = $id AND password = '$current_password'";
    $res = mysqli_query($conn, $sql);


    //3. redirecting to the manage admin page with message(success/error)
    if($res == TRUE){
        $_SESSION['delete'] = "<div class = 'success'>Vendor Deleted Successfully</div>";
        session_destroy(); //If a vendor is deleted, the session should destroy
    }

    else{
        $_SESSION['delete'] = "<div class = 'error'>Failed to Delete Vendor</div>";
        //Redirect to Delete Admin page
        header("location:".SITEURL.'vendor/manage-profile.php');
    }
    }

    else{
        $_SESSION['delete'] = "<div class = 'error'>Username or Password didn't match</div>";
        //Redirect to Delete Admin page
        header("location:".SITEURL.'vendor/manage-profile.php');
    }
}
?>
<?php include('partials/footer.php');?>