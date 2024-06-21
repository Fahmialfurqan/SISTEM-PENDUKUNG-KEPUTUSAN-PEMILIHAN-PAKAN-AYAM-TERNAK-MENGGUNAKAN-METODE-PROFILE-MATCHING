<?php
$link_data = '?page=alternatif';
$link_update = '?page=update_alternatif';
$link_lihat = '?page=lihat_alternatif';

$list_data = '';
$q = "select * from alternatif order by id_alternatif";
$q = mysqli_query($con, $q);
if (mysqli_num_rows($q) > 0) {
    while ($r = mysqli_fetch_array($q)) {
        $id = $r['id_alternatif'];
        $list_data .= '
		<tr>
		<td></td>
		<td>' . $r['nama_alternatif'] . '</td>
		<td>
		<a href="' . $link_lihat . '&id=' . $id . '" class="btn btn-info btn-xs" title="Lihat">Lihat</a> &nbsp;
		</td>
		</tr>';
    }
}
?>
<div class="box box-default">
    <div class="box-header with-border">
        <h3 class="box-title">Data Alternatif</h3>
        <div class="button-right">
        
        </div>
    </div>
    <div class="box-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered" id="dataTables1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Alternatif</th>
                        <th width="120">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php echo $list_data; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>