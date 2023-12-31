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
$did=$_POST['did'];
$dname=$_POST['dname'];
$mid=$_POST['mid'];
$mname=$_POST['mname'];
$sql="INSERT INTO  tbldoctor(did,dname,mid,mname) VALUES(:did,:dname,:mid,:mname)";
$query = $dbh->prepare($sql);
$query->bindParam(':did',$did,PDO::PARAM_STR);
$query->bindParam(':dname',$dname,PDO::PARAM_STR);
$query->bindParam(':mid',$mid,PDO::PARAM_STR);
$query->bindParam(':mname',$mname,PDO::PARAM_STR);

$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
$_SESSION['msg']="uccessfull";
header('location:manage-doctors.php');
}
else 
{
$_SESSION['error']="Something went wrong. Please try again";
header('location:manage-doctors.php');
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
    <title>Military Management System | </title>
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
                <h4 class="header-line">Add Doctor</h4>
                
                            </div>

</div>
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"">
<div class="panel panel-info">
<div class="panel-heading">
Doctor Info
</div>
<div class="panel-body">
<form role="form" method="post">
<div class="form-group">
<label>DID<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="did" autocomplete="off"  required />
</div>

<div class="form-group">
<label>DName<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="dname" autocomplete="off"  required />
</div>

<div class="form-group">
<label>Medicine Id<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="mid"  required="required" autocomplete="off"  />
</div>

 <div class="form-group">
 <label>Medicine Name<span style="color:red;">*</span></label>
 <input class="form-control" type="text" name="mname" autocomplete="off"   required="required" />
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
