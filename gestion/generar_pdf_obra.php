<?php

  require('../fpdf181/fpdf.php');

  $pdf=new FPDF('P','pt','Legal');
  $pdf->AddPage();
  $pdf->SetFont('Arial','B',12);
  $pdf->Cell(40,10,'¡Mi primera página pdf con FPDF!');
  $pdf->Output('I','prueba');

?>
