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

class PDF extends FPDF
{
    function Footer()
    {
        $this->SetY(-40);
        $this->SetFont('Arial','I',8);
        $this->Cell(0,10,'Universidad Francisco de Paula Santander','T',0,'L',$this->Image('../images/ufps.png',150,260,50));
        $this->ln(3);
        $this->Cell(0,10,'Norte de Santander',0,'L');
        $this->ln(3);
        $this->Cell(0,10,'San Jose De Cucuta',0,'L');
        $this->ln(3);
        $this->Cell(0,10,'2017',0,'L');
        // $this->Cell(30,25,'',0,0,'R',$this->Image('../images/log.png',152,400,19));
    }
 
    function Header()
    {
        $this->SetFont('Arial','B',15);
        $this->Line(10,10,206,10);
        $this->Line(10,35.5,206,35.5);
        $this->Cell(30,25,'',0,0,'C');//,$this->Image('', 152,12,19));
        $this->Cell(90,25,'Reporte de Proveedores - Constructora',0,0,'R',$this->Image('../images/log.png',170,11,19));
        //$this->Cell(40,25,'',0,0,'C',$this->Image('images/logoDerecha.png', 175, 12, 19));
        //Se da un salto de línea de 25
        $this->Ln(25);
    }

    function get_content($txt)
    {  
       $this->SetFont('Arial','',12);  

       while($row = mysqli_fetch_row($txt))
       {    
            $fila = $row[1] . '  ' . $row[2] . ' '. $row[3] . ' '. $row[4] . ' ' .$row[5] . '  ' .$row[6];   
            $this->MultiCell(0,5,$fila); 
       }     
       
    }
    

}
$pdf = new PDF();
$pdf->Output();  


?>