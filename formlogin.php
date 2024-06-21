<?php
include "ceklogin.php";

?>
<!DOCTYPE html>
<html>

<head>
    <style>
    .myDiv {
  border: 1px outset lightblue;
  background-color: lightblue;    
  text-align: center;
}
    </style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SPK Metode Profile Matching</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/AdminLTE.min.css">
    <!-- <link rel="shortcut icon" href="assets/images/icon.png" type="image/x-icon" /> -->
</head>

<body class="hold-transition login-page">
<p></p>
<div class="myDiv">
  <h2>SISTEM PENDUKUNG KEPUTUSAN PEMILIHAN PAKAN AYAM TERNAK</h2>
  <p><h2>MENGGUNAKAN METODE PROFILE MATCHING</h2></p>
</div>

    <div class="login-box">
        <div class="login-box-body">
            <?php
            if (!empty($error)) {
                echo '<div class="alert bg-danger text-center" role="alert">' . $error . '</div>';
            }
            ?>

            <form action="" method="post">
                <div class="form-group has-feedback">
                    <input type="text" name="username" class="form-control" placeholder="Username" required>
                    <span class="fa fa-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" name="password" class="form-control" placeholder="Password" required>
                    <span class="fa fa-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                    </div>
                    <div class="text-center col-sm-6">
                        <button type="submit" name="login"class="btn btn-primary">Login</button>
                        <a href="daftar.php" class="btn btn-primary">Daftar</a>
                    </div>
                   
                </div>
            </form>
        </div>

    </div>

    <script src="assets/js/jQuery-2.1.4.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
</body>

</html>