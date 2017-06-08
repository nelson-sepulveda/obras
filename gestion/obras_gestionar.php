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

   $ID = $_SESSION['id_administrador'];  
   $sql="SELECT obra.id_obra,obra.nombre,obra.fecha_inicio,obra.fecha_fin FROM ADMINISTRADOR INNER JOIN obra_x_admin on administrador.id_administrador= obra_x_admin.id_admin inner join obra on obra_x_admin.id_obra=obra.id_obra WHERE administrador.id_administrador='$ID'"; 

   $query = mysqli_query($con,$sql);
   
   if($query)
   {
    ?>
    <table class="table table-bordered">
        <thead>
          <tr>
            <th>Nombre de la obra</th>
            <th>Fecha Inicio</th>
            <th>Fecha Fin</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
    <?php   
    while($row = mysqli_fetch_row($query))
    {
     if(empty($row))
     {
      ?>
      <div class="alert alert-info" role="alert">
       <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong></strong>
        <?php
        echo "No se encontraron Resultados!";
        ?>
      </div>
 <?php
      break;
    }
    else
    {
 ?>
    <tr>
    <td><?php echo $row[1];?></td>
    <td><?php echo $row[2]; ?></td>
    <td><?php echo $row[3]; ?></td>
    <td>
        <button type="button" id="btnActualizar" data-toggle="modal" data-target="#modalobra" class="btn btn-info" data-id="<?php echo $row[0];?>" data-nombre="<?php echo $row[1];?>" data-fechaini="<?php echo $row[2]; ?>" data-fechafin="<?php echo $row[3];?>"><i class='glyphicon glyphicon-edit'></i> Modificar </button>
        <button type="button" id="btnEliminar" data-toggle="modal" data-target="#dataDelete"class="btn btn-danger" data-id="<?php echo $row[0];?>"><i class='glyphicon glyphicon-trash'></i>Eliminar</button>
        <button type="button" id="" class="btn btn-default" data-toggle="modal" data-target=""   >Administrar</button>
      </td>
     </tr>
    <?php
     }
    }
    ?>
     </tbody>
    </table>
    <?php
   }

   

