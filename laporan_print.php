<?php
ob_start();
include 'koneksi.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            font-size: 14px;
        }

        th {
            height: 25px;
            text-align: center;
        }

        table,
        th,
        td {
            border: 1px solid black;
        }

        th,
        td {
            padding: 4px;
        }

        thead {
            background: lightgray;
        }

        .center {
            text-align: center;
        }

        .right {
            text-align: right;
        }

        .table-no-border {
            table-layout: fixed;
        }

        .table-no-border,
        .table-no-border th,
        .table-no-border td {
            border: none;
        }

        .mt-1 {
            margin-top: 20px;
        }

        .mt-2 {
            margin-top: 40px;
        }
    </style>
</head>

<body>
    <h3 class="center">
        LAPORAN DATA HASIL PENILAIAN<br>
        METODE PROFILE MATCHING
    </h3>
    <hr>
    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Alternatif</th>
                <th>Nilai</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $query = mysqli_query($con, "SELECT * FROM hasil ORDER BY nilai DESC");
            $no = 0;
            while ($data = mysqli_fetch_array($query)) {
                $r_alt = mysqli_fetch_array(mysqli_query($con, "select nama_alternatif from alternatif where id_alternatif='" . $data['id_alternatif'] . "'"));
            ?>
                <tr>
                    <td class="center"><?php echo ++$no ?></td>
                    <td><?php echo $r_alt['nama_alternatif']; ?></td>
                    <td class="center"><?php echo $data['nilai']; ?></td>
                </tr>
            <?php
            }
            ?>
        </tbody>
    </table>
    <table class="table-no-border mt-1">
        <tr>
            <td></td>
            <td></td>
            <td class="center">Jakarta, <?php echo date('d-m-Y'); ?><br>
                Pimpinan</td>
        </tr>
    </table>
    <table class="table-no-border mt-2">
        <tr>
            <td></td>
            <td></td>
            <td class="center">(________________)</td>
        </tr>
    </table>
</body>

</html>
<?php
$filename = "hasil-penilaian.pdf";
$content = ob_get_clean();

require 'vendor/autoload.php';

use Dompdf\Dompdf;

$dompdf = new Dompdf();
$dompdf->loadHtml($content);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream($filename, array("Attachment" => FALSE));
?>