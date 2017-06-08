<?php 


$con=@mysqli_connect('localhost', 'root', '', 'obras');

  if(!$con)
  {
      die("imposible conectarse: ".mysqli_error($con));
  }
  if (@mysqli_connect_errno())
  {
      die("Connect failed: ".mysqli_connect_errno()." : ". mysqli_connect_error());
  }

function get_obras()
{
    global $con;
    $ID = $_SESSION['id_administrador'];

    $sql = "SELECT obra.id_obra,obra.nombre FROM ADMINISTRADOR INNER JOIN obra_x_admin on administrador.id_administrador= obra_x_admin.id_admin inner join obra on obra_x_admin.id_obra=obra.id_obra WHERE administrador.id_administrador='$ID'";

    $query = mysqli_query($con,$sql);
    return $query;
}
