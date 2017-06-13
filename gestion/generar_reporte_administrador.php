<?php 

require('../fpdf181/fpdf.php');

  $con=@mysqli_connect('localhost', 'root', '', 'obras');

  if(!$con)
  {
      die("imposible conectarse: ".mysqli_error($con));
  }
  if (@mysqli_connect_errno())
  {
      die("Connect failed: ".mysqli_connect_errno()." : ". mysqli_connect_error());
  }

   $id = $_GET['idobraadministrador'];

    $pdf = new FPDF();
    $pdf->AddPage();
    $pdf->SetFont('Arial','B',16);
    $pdf->Cell(40,10,$id,0,1,'R');
    $pdf->Output();  


?>