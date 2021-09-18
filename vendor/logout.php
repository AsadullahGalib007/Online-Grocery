<?php 
    //Include constants.php for SITEURL
    include('../config/constants.php');
    //1. Destory the Session
    session_destroy(); //Unsets $_SESSION['user']
    if (file_exists('store.txt')) {
    }

    //2. REdirect to Login Page
    header('location:'.SITEURL.'vendor/login.php');

?>