<?php 
    //Include Constants File
    include('../config/constants.php');

    //echo "Delete Page";
    //Check whether the id and image_name value is set or not
    if(isset($_GET['id']) AND isset($_GET['image_name']))
    {
        //Get the Value and Delete
        //echo "Get Value and Delete";
        $id = $_GET['id'];
        $image_name = $_GET['image_name'];
   
        $sql = "DELETE FROM tbl_food WHERE tbl_food.id = $id";

        //Execute the Query
        $res = mysqli_query($conn, $sql);

        if($res==true)
        {
            //SEt Success MEssage and REdirect
            $_SESSION['delete'] = "<div class='success'>Item Deleted Successfully.</div>";
            //Redirect to Manage Category
            header('location:'.SITEURL.'vendor/manage-food.php');
        }
        else
        {
            //SEt Fail MEssage and Redirecs
            $_SESSION['delete'] = "<div class='error'>Failed to Delete Item.</div>";
            //Redirect to Manage Category
            header('location:'.SITEURL.'vendor/manage-food.php');
        }
    }
    else
    {
        //redirect to Manage Category Page
        header('location:'.SITEURL.'vendor/manage-food.php');
    }
?>