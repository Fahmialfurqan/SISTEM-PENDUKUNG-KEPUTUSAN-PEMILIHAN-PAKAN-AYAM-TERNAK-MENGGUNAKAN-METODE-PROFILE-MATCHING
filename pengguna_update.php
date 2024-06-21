<?php
$link_data = '?page=pengguna';
$link_update = '?page=update_pengguna';

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
    $nama = $_POST['nama_lengkap'];
    $email = $_POST['email'];
    if ($action == "add") {
        $password = $_POST['password'];
    }
    $level = $_POST['level'];

    if ($action == 'add') {
        if (mysqli_num_rows(mysqli_query($con, "select * from pengguna where username='" . $username . "'")) > 0) {
            $error = 'Username sudah ada';
        } else {
            $q = "insert into pengguna(nama_lengkap,email,username,password,level) values ('" . $nama . "','" . $email . "','" . $username . "','" . $password . "','" . $level . "')";
            mysqli_query($con, $q);
            exit("<script>location.href='" . $link_data . "';</script>");
        }
    }
    if ($action == 'edit') {
        $q = mysqli_query($con, "select * from pengguna where id_pengguna='" . $id . "'");
        $r = mysqli_fetch_array($q);
        $username_tmp = $r['username'];
        if (mysqli_num_rows(mysqli_query($con, "select * from pengguna where username='" . $username . "' and username<>'" . $username_tmp . "'")) > 0) {
            $error = 'Username sudah ada';
        } else {
            $q = "update pengguna set nama_lengkap='" . $nama . "',email='" . $email . "', username='" . $username . "',level='" . $level . "' where id_pengguna='" . $id . "'";
            mysqli_query($con, $q);
            exit("<script>location.href='" . $link_data . "';</script>");
        }
    }
} else {
    $action = empty($_GET['action']) ? 'add' : $_GET['action'];
    if ($action == 'edit') {
        $id = $_GET['id'];
        $q = mysqli_query($con, "select * from pengguna where id_pengguna='" . $id . "'");
        $r = mysqli_fetch_array($q);
        $nama = $r['nama_lengkap'];
        $email = $r['email'];
        $username = $r['username'];
        $level = $r['level'];
    }
    if ($action == 'delete') {
        $id = $_GET['id'];
        mysqli_query($con, "delete from pengguna where id_pengguna='" . $id . "'");
        exit("<script>location.href='" . $link_data . "';</script>");
    }
}
?>
<div class="box box-default">
    <div class="box-header with-border">
        <h3 class="box-title">Data Pengguna</h3>
    </div>
    <form class="form-horizontal" action="<?php echo $link_update; ?>" method="post">
        <input name="id" type="hidden" value="<?php echo $id; ?>">
        <input name="action" type="hidden" value="<?php echo $action; ?>">
        <div class="box-body">
            <?php
            if (!empty($error)) {
                echo '<div class="alert bg-danger" role="alert">' . $error . '</div>';
            }
            ?>
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
                <label for="username" class="col-sm-2 control-label">Level</label>
                <div class="col-sm-4">
                    <select name="level" class="form-control" required>
                        <option value="">- Pilih -</option>
                        <option value="Admin" <?php echo $level == 'Admin' ? 'selected' : '' ?>>Admin</option>
                        <option value="User" <?php echo $level == 'User' ? 'selected' : '' ?>>User</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="box-footer">
            <div class="text-center col-sm-6">
                <button type="submit" name="save" class="btn btn-success">Simpan</button>
                <a href="<?php echo $link_data; ?>" class="btn btn-danger">Batal</a>
            </div>
        </div>
    </form>
</div>