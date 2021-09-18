<!-- 
    DECLARE @MemberId int

INSERT INTO Member (name) VALUES ('hello');

SET @MemberId = SCOPE_IDENTITY()

INSERT INTO Member_Detail (pk, name) VALUES (@MemberId, 'hello again')
 -->

 <?php include('partials/menu.php'); ?>

<div class="main-content">
    <div class="wrapper">
        <h1>Add Category</h1>

        <br><br>

        <?php

            include('partials/getV_id.php');
        
            if(isset($_SESSION['add']))
            {
                echo $_SESSION['add'];
                unset($_SESSION['add']);
            }

            if(isset($_SESSION['upload']))
            {
                echo $_SESSION['upload'];
                unset($_SESSION['upload']);
            }
        
        ?>

        <br><br>

        <!-- Add CAtegory Form Starts -->
        <form action="" method="POST" enctype="multipart/form-data">

            <table class="tbl-30">
                <tr>
                    <td>Title: </td>
                    <td>
                        <input type="text" name="title" placeholder="Category Title">
                    </td>
                </tr>

                <tr>
                    <td>Select Image: </td>
                    <td>
                        <input type="file" name="image">
                    </td>
                </tr>

                <tr>
                    <td>Featured: </td>
                    <td>
                        <input type="radio" name="featured" value="Yes"> Yes 
                        <input type="radio" name="featured" value="No"> No 
                    </td>
                </tr>

                <tr>
                    <td>Active: </td>
                    <td>
                        <input type="radio" name="active" value="Yes"> Yes 
                        <input type="radio" name="active" value="No"> No 
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <input type="submit" name="submit" value="Add Category" class="btn-secondary">
                    </td>
                </tr>

            </table>

        </form>
        <!-- Add CAtegory Form Ends -->

        <?php 
        
            //CHeck whether the Submit Button is Clicked or Not
            if(isset($_POST['submit']))
            {
                //echo "Clicked";

                //1. Get the Value from CAtegory Form
                $title = $_POST['title'];

                //For Radio input, we need to check whether the button is selected or not
                if(isset($_POST['featured']))
                {
                    //Get the VAlue from form
                    $featured = $_POST['featured'];
                }
                else
                {
                    //SEt the Default VAlue
                    $featured = "No";
                }

                if(isset($_POST['active']))
                {
                    $active = $_POST['active'];
                }
                else
                {
                    $active = "No";
                }

                //Check whether the image is selected or not and set the value for image name accoridingly
                //print_r($_FILES['image']);

                //die();//Break the Code Here

                if(isset($_FILES['image']['name']))
                {
                    //Upload the Image
                    //To upload image we need image name, source path and destination path
                    $image_name = $_FILES['image']['name'];
                    
                    // Upload the Image only if image is selected along with a suitable title. 
                    if($title !="" AND $image_name != "")
                    {

                        // //Auto Rename our Image
                        // //Get the Extension of our image (jpg, png, gif, etc) e.g. "specialfood1.jpg"
                        // $ext = end(explode('.', $image_name));

                        // //Rename the Image
                        // $image_name = "Food_Category_".rand(000, 999).'.'.$ext; // e.g. Food_Category_834.jpg
                        

                        $source_path = $_FILES['image']['tmp_name'];

                        $destination_path = "../images/category/".$image_name;

                        //Finally Upload the Image
                        $upload = move_uploaded_file($source_path, $destination_path);

                        //Check whether the image is uploaded or not
                        //And if the image is not uploaded then we will stop the process and redirect with error message
                        if($upload==false)
                        {
                            //SEt message
                            $_SESSION['upload'] = "<div class='error'>Failed to Upload Image. </div>";
                            //Redirect to Add CAtegory Page
                            header('location:'.SITEURL.'vendor/add-category.php');
                            //STop the Process
                            die();
                        }

                    }
                }
                else
                {
                    //SEt message
                    $_SESSION['upload'] = "<div class='error'>Failed to Update. Please select an image and a suitable title</div>";
                    //Redirect to Add CAtegory Page
                    header('location:'.SITEURL.'vendor/manage-category.php');
                    //STop the Process
                    die();
                }

                //2. Create SQL Query to Insert Category into Database as well as the linking table(tbl_v_c)
                $sql = 
                "INSERT INTO tbl_category SET 
                title='$title',
                image_name='$image_name',
                featured='$featured',
                active='$active'
                ";

                //3. Execute the Query and Save in Database
                $res = mysqli_query($conn, $sql);
                
                $sql2 = 
                "SELECT LAST_INSERT_ID();
                ";

                $res2 = mysqli_query($conn, $sql2); 
                $result = mysqli_fetch_row($res2);
                $c_id = $result['0'];
                // print_r(c_id);

                $sql3 =
                "INSERT INTO tbl_v_c (v_id, c_id) VALUES (".$id.", ".$c_id.");
                ";

                $res3 = mysqli_query($conn, $sql3);

                //4. Check whether the query executed or not and data added or not
                if($res==true)
                {
                    //Query Executed and Category Added
                    $_SESSION['add'] = "<div class='success'>Category Added Successfully.</div>";
                    //Redirect to Manage Category Page
                    header('location:'.SITEURL.'vendor/manage-category.php');
                }
                else
                {
                    //Failed to Add CAtegory
                    $_SESSION['add'] = "<div class='error'>Failed to Add Category.</div>";
                    //Redirect to Manage Category Page
                    header('location:'.SITEURL.'vendor/add-category.php');
                }
            }
        
        ?>

    </div>
</div>

<?php include('partials/footer.php'); ?>