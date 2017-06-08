
$(document).ready(function()
{
	$('.nombre-perfil').on('click', function()
	{
		$('.submenu-hijo').slideToggle('slow');
	});
});

$('#registroIng').validate({
	rules:{
		nombreing :{required:true },
		apellidoing:{required:true},
		email:{required:true,email:true},
		fecha:{required:true},
		cedula:{required:true,number:true},
		password:{required:true},
		password_re:{required:true, equalTo:"#password"}
	},
	messages:
  {
    nombreing :"Nombre Vacio",
		apellidoing:"Apellido vacio",
		email:"Email vacio o no valido",
		fecha:"fecha vacia",
		cedula:"Cedula vacia",
		password:"contraseña vacia",
		password_re:"contraseñas no coinciden"
	},
submitHandler: function(form){
	console.log('llegamos hast aqui');


		$.ajax({
			url: $('#registroIng').attr('action'),
			method:'post',
			data:$('#registroIng').serialize(),
			success : function(data)
			{
				$('#success').html(data); // cambiar los .val
				// $('#user').val('')
				// $('#email').val('')
				// $('#direccion').val('')
				// $('#telefono').val('')
				// $('#cedula').val('')
				// $('#password').val('')
				// $('#password_re').val('')
				// //$('#myModalRegistro').modal('hide')
			}
		});
 }
});

$('#loginData').validate({
	rules:{
		usuario :{required:true , email:true},
		pass:{required:true },
	},
	messages:
	{
		usuario : "Email vacio o invalido",
		pass: "Contraseña Vacia"
	},
submitHandler: function(form){
	var formulario = $('#loginData');	
	console.log('llegamos a logi');
 $.ajax({
	url: formulario.attr('action'),
	method:'post',
	data:formulario.serialize(),
 success : function(data)
	{
		var obj = JSON.parse(data);
    if(obj.login==true)
    {
      document.location.href='perfil_ing.php';
    } 
		else
		{
			$('#div_error_login').html(obj.error);
			$('#usuario').val('')
			$('#pass').val('')
		}
	}
});
}
});

// Permite abrir el modal con la informacion de una obra
$('#modalobra').on('show.bs.modal', function(event){

	debugger
	var este=$(this);
  console.log('actualizaa');
  var button=$(event.relatedTarget);
	var id=button.data('id');
	var nombre = button.data('nombre');
	var fechaini = button.data('fechaini');
	var fechafin = button.data('fechafin');

	console.log(nombre);
	console.log(fechafin);
	console.log(fechaini);

	var modal = $('#modalobra')	;

  modal.find('#ID').val(id);	
	modal.find('#nombreobra').val(nombre);
	modal.find('#iniobra').val(fechaini);
	modal.find('#finobra').val(fechafin);
});


// Permite modificar una obra
$('#modificarObra').validate({
	rules:{
		nombreobra :{required:true},
		iniobra:{required:true},
		finobra:{required:true },
	},
	messages:
	{
		nombreobra : "Nombre vacio",
		iniobra: "Fecha Vacia",
		finobra: "Fecha Vacia",
	},
submitHandler: function(form){
	var formulario = $('#modificarObra');	
	console.log('llegamos a modificar');
 $.ajax({
	url: formulario.attr('action'),
	method:'post',
	data:formulario.serialize(),
 success : function(data)
	 {
			$('#div_ajax_update').html(data);

	 }
  });
 }
});

// permite registrar una obra
$('#registrarobra').validate({
	rules:{
		nameobra :{required:true},
		inicioobra:{required:true},
		finalobra:{required:true },
	},
	messages:
	{
		nameobra : "Nombre vacio",
		inicioobra: "Fecha Vacia",
		finalobra: "Fecha Vacia",
	},
submitHandler: function(form){
	var formulario = $('#registrarobra');	
	console.log('llegamos a registrar');
 $.ajax({
	url: formulario.attr('action'),
	method:'post',
	data:formulario.serialize(),
 success : function(data)
	 {
			$('#div_ajax_registro').html(data);
	 }
  });
 }
});
