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

  $nombre = $_POST['nameobra'];
  $fechaini = $_POST['inicioobra'];
  $fechafin = $_POST['finalobra'];
  $auto_inc = "SELECT MAX(id_obra) AS ID FROM OBRA";
  $consulta = mysqli_query($con,$auto_inc);
  $vec = mysqli_fetch_row($consulta);
  $var= (int)$vec[0];

  $ID = $var+1;

  $sql_insert = "INSERT INTO OBRA (id_obra,nombre,fecha_inicio,fecha_fin) VALUES ('$ID','$nombre','$fechaini','$fechafin')";

  $query_insert = mysqli_query($con,$sql_insert);

  if($query_insert)
      {
        $msg[]="Se registro Correctamente la obra";
      }
      else
      {
        $errors[]="No se registro de forma correcta la obra" . mysqli_error($con);
      }

  if (isset($errors))
  {
    ?>
    <div class="alert alert-danger" role="alert">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Error!</strong>
        <?php
          foreach ($errors as $error)
          {
            echo $error;
          }
        ?>
    </div>
    <?php
  }


 else if (isset($msg)){
    ?>
    <div class="alert alert-success" role="alert">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
       <strong>¡Bien hecho!</strong><br>
        <?php
          foreach ($msg as $messages) {
           echo $messages;
          }
        ?>
    </div>
    <?php
  }


