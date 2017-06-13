<?php

require('../fpdf181/fpdf.php');
class PDF extends FPDF
{
    function Footer()
    {
        $this->SetY(-40);
        $this->SetFont('Arial','I',8);
        $this->Cell(0,10,'Universidad Francisco de Paula Santander','T',0,'L',$this->Image('../images/log.png',152,240,19));
        // $this->Cell(30,25,'',0,0,'R',$this->Image('../images/log.png',152,400,19));
    }
 
    function Header()
    {
        $this->SetFont('Arial','B',9);
        $this->Line(10,10,206,10);
        $this->Line(10,35.5,206,35.5);
        $this->Cell(30,25,'',0,0,'C',$this->Image('../images/ufps.png', 152,12,19));
        $this->Cell(111,25,'ALGÚN TÍTULO DE ALGÚN LUGAR',0,0,'C', $this->Image('../images/home.jpg',20,12,20));
        //$this->Cell(40,25,'',0,0,'C',$this->Image('images/logoDerecha.png', 175, 12, 19));
        //Se da un salto de línea de 25
        $this->Ln(25);
    }
}


  $con=@mysqli_connect('localhost', 'root', '', 'obras');

  if(!$con)
  {
      die("imposible conectarse: ".mysqli_error($con));
  }
  if (@mysqli_connect_errno())
  {
      die("Connect failed: ".mysqli_connect_errno()." : ". mysqli_connect_error());
  }

  $var = $_GET['idobraempleados'];

  $sql_empleados = "select id_obra, id_personal, nombre, apellido, salario \n". "from personal \n". "where id_obra = '$var'";

  $quey_emp = mysqli_query($con,$sql_empleados);

  $pdf = new PDF();
  $pdf->AddPage('P','Letter');
  $pdf->Output(); 




  
  ?>