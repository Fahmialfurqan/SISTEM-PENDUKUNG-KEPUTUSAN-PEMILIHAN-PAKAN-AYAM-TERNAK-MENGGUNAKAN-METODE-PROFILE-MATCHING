<?php
$db_host = 'localhost';
$db_user = 'root';
$db_password = '';
$db_name = 'profile_matching3';
session_start();
$con = @mysqli_connect($db_host, $db_user, $db_password) or die('<center><strong>Gagal koneksi ke server database</strong></center>');
mysqli_select_db($con, $db_name) or die('<center><strong>Database tidak ditemukan</strong></center>');

$link_data = '?page=pengguna';
$link_update = '?page=update_pengguna';
$action = empty($_GET['action']) ? 'add' : $_GET['action'];

$username = '';
$password = '';
$level = '';
$nama = '';
$email = '';
if (isset($_POST['save'])) {
    $error = '';
    $id = $_POST['id'];
    $action = $_POST['action'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $ulangi = $_POST['ulangi'];
    $nama = $_POST['nama_lengkap'];
    $email = $_POST['email'];
    $success = '';
    $level = 'user';
    if ($password != $ulangi) {
        $error .= 'Password tidak sama';
    } elseif ($password == $ulangi) {
        if ($action == "add") {
        $password = $_POST['password'];
         }
   

        if ($action == 'add') {
            if (mysqli_num_rows(mysqli_query($con, "select * from pengguna where username='" . $username . "'")) > 0) {
            $error = 'Username sudah ada';
             } 
             elseif (mysqli_num_rows(mysqli_query($con, "select * from pengguna where email='" . $email . "'")) > 0){
                $error = 'email sudah ada';
             }
             else {
            $q = "insert into pengguna(nama_lengkap,email,username,password,level) values ('" . $nama . "','" . $email . "','" . $username . "','" . $password . "','" . $level . "')";
            mysqli_query($con, $q);
            $success = 'Registrasi Berhasil ';
            }
        }
    
    }
} 
?>
<?php error_reporting (E_ALL ^ E_NOTICE);?>
<!DOCTYPE html>
<html>

<head>
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
<div class="box box-default">
    <div class="box-header with-border">
        <div class="col-sm-4">
        <h3 class="box-title">Data Pengguna</h3>
        </div>
    </div>
    <form class="form-horizontal" action="<?php echo $link_update; ?>" method="post">
        <input name="id" type="hidden" value="<?php echo $id; ?>">
        <input name="action" type="hidden" value="<?php echo $action; ?>">
        <div class="box-body">
        <?php if (!empty($error)) {
                echo '<div class="alert bg-danger" role="alert">' . $error . '</div>';
                }?>
            <?php if (!empty($success)) {?>
                <?php echo '<div class="alert alert-info" role="alert"><strong>' . $success . '</strong>
                <a href="index.php" class="alert-link">Login here</a>
                </div>';?>
                <!--<footer>Already a member? <a href="index.php">Login here</a></footer>-->
                <?php } ?>
            <div class="form-group">
                <label for="nama_lengkap" class="col-sm-2 control-label">Nama Lengkap</label>
                <div class="col-sm-4">
                    <input name="nama_lengkap" id="nama_lengkap" class="form-control" required type="text" value="<?php echo $nama; ?>">
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-4">
                    <input name="email" id="email" class="form-control" required type="text" value="<?php echo $email; ?>">
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">Username</label>
                <div class="col-sm-4">
                    <input name="username" id="username" class="form-control" required type="text" value="<?php echo $username; ?>">
                </div>
            </div>
            <?php if ($action == "add") { ?>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-4">
                        <input name="password" id="password" required type="password" class="form-control" value="<?php echo $password; ?>">
                    </div>
                </div>
            <?php } ?>
            <div class="form-group">
                 <label for="ulangi" class="col-sm-2 control-label">Repeat Password</label>
                 <div class="col-sm-4">
                    <input name="ulangi" id="ulangi" class="form-control" required type="password" value="">
                </div>
             </div>
           <!--  <div class="form-group">
                <label for="username" class="col-sm-2 control-label">Level</label>
                <div class="col-sm-4">
                <div class="card-body" ?php echo $level == 'User' ? 'selected' : '' ?>>user</div>
                    <select name="level" class="form-control" required>
                        <option value="">- Pilih -</option>
                        <option value="User" ?php echo $level == 'User' ? 'selected' : '' ?>>User</option>
                       
                    </select>
                </div>
            </div>-->
         </div>
         <div class="box-footer">
            <div class="text-center col-sm-6">
                <button type="submit" name="save" class="btn btn-success">Simpan</button>
                <a href="index.php" class="btn btn-danger">Kembali</a>
            </div>
                
        </div>
    </form>
</div>
</body>
</html>