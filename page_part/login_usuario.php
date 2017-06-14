<?php 


session_start();
$con=@mysqli_connect('localhost', 'root', '', 'obras');

    if(!$con)
    {
        die("imposible conectarse: ".mysqli_error($con));
    }
    if (@mysqli_connect_errno())
    {
        die("Connect failed: ".mysqli_connect_errno()." : ". mysqli_connect_error());
    }

    $usuario = $_POST['usuario'];
    $pass = $_POST['pass'];

    $sql = "SELECT id_administrador,nombre,correo,password FROM ADMINISTRADOR WHERE '$usuario'=correo and '$pass'=password";

    $query = mysqli_query($con,$sql);
    $vec_datos = mysqli_fetch_row($query);

    if(count($vec_datos)!=0)
    {
      $_SESSION['id_administrador']=$vec_datos[0];
      $_SESSION['nombre']=$vec_datos[1];
      echo json_encode(array(
        'login'=>true
      ));
    }
    else
    {
      echo json_encode(array(
        'login'=>false
      ));
    }


function geterror()
{
  return 
  "<div class='alert alert-danger' role='alert'>
    <button type='button' class='close' data-dismiss='alert'>&times;</button>
        <strong>Error!</strong>
    </div>";
}
