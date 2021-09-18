<?php include('partials/menu.php'); ?>

<div class="main-content">
    <div class="wrapper">
        <h1>Manage Category</h1>

        <br /><br />
        <?php 
        
            if(isset($_SESSION['add']))
            {
                echo $_SESSION['add'];
                unset($_SESSION['add']);
            }

            include('partials/getV_id.php');

            if(isset($_SESSION['remove']))
            {
                echo $_SESSION['remove'];
                unset($_SESSION['remove']);
            }

            if(isset($_SESSION['delete']))
            {
                echo $_SESSION['delete'];
                unset($_SESSION['delete']);
            }

            if(isset($_SESSION['no-category-found']))
            {
                echo $_SESSION['no-category-found'];
                unset($_SESSION['no-category-found']);
            }

            if(isset($_SESSION['update']))
            {
                echo $_SESSION['update'];
                unset($_SESSION['update']);
            }

            if(isset($_SESSION['upload']))
            {
                echo $_SESSION['upload'];
                unset($_SESSION['upload']);
            }

            if(isset($_SESSION['failed-remove']))
            {
                echo $_SESSION['failed-remove'];
                unset($_SESSION['failed-remove']);
            }
        
        ?>
        <br><br>

                <!-- Button to Add Category -->
                <a href="<?php echo SITEURL; ?>vendor/add-category.php" class="btn-primary">Add Category</a>

                <br /><br /><br />

                <table class="tbl-full">
                    <tr class="text-center">
                        <th>S.N.</th>
                        <th>Title</th>
                        <th>Image</th>
                        <th>Featured</th>
                        <th>Active</th>
                        <th>Actions</th>
                    </tr>

                    <?php
                        //Query to Get all Categories from Database that are added by admin(s)
                        $sql = "SELECT * FROM `tbl_category`
                        WHERE tbl_category.id NOT IN
                        (
                            SELECT DISTINCT tbl_category.id FROM tbl_category 
                            INNER JOIN tbl_v_c ON tbl_category.id = tbl_v_c.c_id 
                            INNER JOIN tbl_vendor ON tbl_v_c.v_id = $id
                        )";

                        //Execute Query
                        $res = mysqli_query($conn, $sql);

                        //Count Rows
                        $count = mysqli_num_rows($res);
                       //Create Serial Number Variable and assign value as 1
                        $sn=1;

                        //Check whether we have data in database or not
                        if($count>0)
                        {
                            //We have data in database
                            //get the data and display
                            while($row=mysqli_fetch_assoc($res))
                            {
                                $cid = $row['id'];
                                $title = $row['title'];
                                $image_name = $row['image_name'];
                                $featured = $row['featured'];
                                $active = $row['active'];
                                ?>
                                    <tr class="text-center">
                                        <td><?php echo $sn++; ?>. </td>
                                        <td><?php echo $title; ?></td>
                                        <td>
                                            <?php  
                                                //Chcek whether image name is available or not
                                                if($image_name!="")
                                                {
                                                    //Display the Image
                                                    ?>                                                   
                                                    <img src="<?php echo SITEURL; ?>images/category/<?php echo $image_name; ?>" width="100px", height="90px" >    
                                                    <?php
                                                }
                                                else
                                                {
                                                    //DIsplay the MEssage
                                                    echo "<div class='error'>Image not Added.</div>";
                                                }
                                            ?>
                                        </td>
                                        <td><?php echo $featured; ?></td>
                                        <td><?php echo $active; ?></td>
                                        <td>
                                            <button class= "btn-danger"><h3>Admin access only</h3></button>
                                        </td>
                                    </tr>
                                <?php
                            }
                        }
                        else
                        {
                            //WE do not have data
                            //We'll display the message inside table
                            ?>
                            <tr>
                                <td colspan="6"><div class="error">No Category Added by Admin(s).</div></td>
                            </tr>
                            <?php
                        }

                        //Query to Get all Categories from Database if those are added by vendor himself
                        $sql2 = "SELECT DISTINCT tbl_category.* FROM tbl_category 
                        INNER JOIN tbl_v_c ON tbl_category.id = tbl_v_c.c_id 
                        INNER JOIN tbl_vendor ON tbl_v_c.v_id = ".$id;

                        //Execute Query
                        $res2 = mysqli_query($conn, $sql2);
                        $count2 = mysqli_num_rows($res2);

                        //Check whether we have data in database or not
                        if($count2>0)
                        {
                            //We have data in database
                            //get the data and display
                            while($row2=mysqli_fetch_assoc($res2))
                            {
                                $id = $row2['id'];
                                $title = $row2['title'];
                                $image_name = $row2['image_name'];
                                $featured = $row2['featured'];
                                $active = $row2['active'];
                                ?>
                                    <tr class="text-center">
                                        <td><?php echo $sn++; ?>. </td>
                                        <td><?php echo $title; ?></td>
                                        <td>
                                            <?php  
                                                //Chcek whether image name is available or not
                                                if($image_name!="")
                                                {
                                                    //Display the Image
                                                    ?>
                                                    <img src="<?php echo SITEURL; ?>images/category/<?php echo $image_name; ?>" width="100px", height="80px" >
                                                    <?php
                                                }
                                                else
                                                {
                                                    //DIsplay the MEssage
                                                    echo "<div class='error'>Image not Added.</div>";
                                                }
                                            ?>
                                        </td>
                                        <td><?php echo $featured; ?></td>
                                        <td><?php echo $active; ?></td>
                                        <td>
                                            <a href="<?php echo SITEURL; ?>vendor/update-category.php?id=<?php echo $id; ?>" class="btn-secondary">Update Category</a>
                                            <a href="<?php echo SITEURL; ?>vendor/delete-category.php?id=<?php echo $id; ?>&image_name=<?php echo $image_name; ?>" class="btn-danger">Delete Category</a>
                                        </td>
                                    </tr>

                                <?php

                            }
                        }
                        else
                        {
                            //WE do not have data
                            //We'll display the message inside table
                            ?>

                            <tr>
                                <td colspan="6"><div class="error">No Category Has Been Added by You.</div></td>
                            </tr>

                            <?php
                        }

                    ?>

                    
                </table>
    </div>
    
</div>

<?php include('partials/footer.php'); ?>