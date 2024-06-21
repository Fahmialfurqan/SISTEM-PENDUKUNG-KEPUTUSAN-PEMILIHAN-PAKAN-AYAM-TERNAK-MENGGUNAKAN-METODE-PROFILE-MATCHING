<?php
$page = isset($_GET['page']) ? $_GET['page'] : "";
$level = isset($_SESSION['LOG_LEVEL']) ? $_SESSION['LOG_LEVEL'] : "";
?>
<li <?php if ($page == "") echo 'class="active"'; ?>><a href="./"><i class="fa fa-home"></i> <span>Home</span></a></li>

<?php if ($level == 'Admin') { ?>
    <li <?php if ($page == "jenis" || $page == "update_jenis") echo 'class="active"'; ?>><a href="?page=jenis"><i class="fa fa-tags"></i> <span>Jenis Kriteria</span></a></li>
    <li <?php if ($page == "selisih" || $page == "update_selisih") echo 'class="active"'; ?>><a href="?page=selisih"><i class="fa fa-list"></i> <span>Selisih</span></a></li>
    <li <?php if ($page == "kriteria" || $page == "update_kriteria" || $page == "subkriteria" || $page == "update_subkriteria") echo 'class="active"'; ?>><a href="?page=kriteria"><i class="fa fa-th"></i> <span>Kriteria</span></a></li>
    <li <?php if ($page == "alternatif" || $page == "update_alternatif" || $page == "lihat_alternatif") echo 'class="active"'; ?>><a href="?page=alternatif"><i class="fa fa-check"></i> <span>Alternatif</span></a></li>
    <li <?php if ($page == "pengguna" || $page == "update_pengguna") echo 'class="active"'; ?>><a href="?page=pengguna"><i class="fa fa-users"></i> <span>Pengguna</span></a></li>

<?php } elseif ($level == 'User') { ?>
    <li <?php if ($page == "alternatif" || $page == "update_alternatif" || $page == "lihat_alternatif") echo 'class="active"'; ?>><a href="?page=alternatif_user"><i class="fa fa-check"></i> <span>Alternatif</span></a></li>
    <li <?php if ($page == "penilaian") echo 'class="active"'; ?>><a href="?page=penilaian"><i class="fa fa-check-square"></i> <span>Penilaian</span></a></li>
    <li <?php if ($page == "laporan") echo 'class="active"'; ?>><a href="?page=laporan"><i class="fa fa-print"></i> <span>Laporan</span></a></li>
<?php } ?>

<li <?php if ($page == "password") echo 'class="active"'; ?>><a href="?page=password"><i class="fa fa-unlock-alt"></i> <span>Ubah Password</span></a></li>
<li><a href="logout.php"><i class="fa fa-sign-out"></i> <span>Logout</span></a></li>