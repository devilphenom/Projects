<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{ 

if(isset($_POST['issue']))
{
$tid=$_POST['tid'];
$tname=$_POST['tname'];
$ttype=$_POST['ttype'];
$sql="INSERT INTO  tbltransport(tid,tname,ttype) VALUES(:tid,:tname,:ttype)";
$query = $dbh->prepare($sql);
$query->bindParam(':tid',$tid,PDO::PARAM_STR);
$query->bindParam(':tname',$tname,PDO::PARAM_STR);
$query->bindParam(':ttype',$ttype,PDO::PARAM_STR);
$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
$_SESSION['msg']="Successfull";
header('location:manage-transportation.php');
}
else 
{
$_SESSION['error']="Something went wrong. Please try again";
header('location:manage-transportation.php');
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
    <title>Military Management System | Transportation</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<script>
// function for get student name
function getstudent() {
$("#loaderIcon").show();
jQuery.ajax({
url: "get_student.php",
data:'studentid='+$("#studentid").val(),
type: "POST",
success:function(data){
$("#get_student_name").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}



</script> 
<style type="text/css">
  .others{
    color:red;
}

</style>


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
                <h4 class="header-line">Transportation</h4>
                
                            </div>

</div>
<div class="row">
<div class="col-md-10 col-sm-6 col-xs-12 col-md-offset-1"">
<div class="panel panel-info">
<div class="panel-heading">
Transportation
</div>
<div class="panel-body">
<form role="form" method="post">

<div class="form-group">
<label>Transport Id<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="tid" id="tid"  autocomplete="off"  required />
</div>

<div class="form-group">
<label>Transport Name<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="tname" id="tname"  autocomplete="off"  required />
</div>

<div class="form-group">
<label>Transport Type<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="ttype" id="ttype"  autocomplete="off"  required />
</div>

<button type="submit" name="issue" id="submit" class="btn btn-info">Add Details </button>

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
