<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{ 

if(isset($_POST['add']))
{
$wid=$_POST['wid'];
$wname=$_POST['wname'];
$issued=$_POST['issued'];
$types=$_POST['types'];
$sql="INSERT INTO  tblweapons(wid,wname,issued,types) VALUES(:wid,:wname,:issued,:types)";
$query = $dbh->prepare($sql);
$query->bindParam(':wid',$wid,PDO::PARAM_STR);
$query->bindParam(':wname',$wname,PDO::PARAM_STR);
$query->bindParam(':issued',$issued,PDO::PARAM_STR);
$query->bindParam(':types',$types,PDO::PARAM_STR);

$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
$_SESSION['msg']="Book Listed successfully";
header('location:manage-weapons.php');
}
else 
{
$_SESSION['error']="Something went wrong. Please try again";
header('location:manage-weapons.php');
}

}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Online Library Management System | Add Book</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
      <!------MENU SECTION START-->
<?php include('includes/header.php');?>
<!-- MENU SECTION END-->
    <div class="content-wra
    <div class="content-wrapper">
         <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">Add Book</h4>
                
                            </div>

</div>
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"">
<div class="panel panel-info">
<div class="panel-heading">
Weapon Info
</div>
<div class="panel-body">
<form role="form" method="post">
<div class="form-group">
<label>WID<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="wid" autocomplete="off"  required />
</div>

<div class="form-group">
<label>WName<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="wname" autocomplete="off"  required />
</div>

<div class="form-group">
<label>Issued To<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="issued"  required="required" autocomplete="off"  />
</div>

 <div class="form-group">
 <label>Types<span style="color:red;">*</span></label>
 <input class="form-control" type="text" name="types" autocomplete="off"   required="required" />
 </div>
<button type="submit" name="add" class="btn btn-info">Add </button>

                                    </form>
                            </div>
                        </div>
                            </div>

        </div>
   
    </div>
    </div>
     <!-- CONTENT-WRAPPER SECTION END-->
  <?php include('includes/footer.php');?>
      <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
<?php } ?>
