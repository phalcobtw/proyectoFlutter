const String mensajeRegistroUsuario = 'Error de registro de usuario';
const String mensajeCampoVacio = 'Sin Valor';

class RegistroUsuario{
  late int anioRegistro;
  late String nombre;
  late String apellidos;
  late String pais;
  late String estado;
  RegistroUsuario._(this.anioRegistro, this.nombre, this.apellidos, this.pais, this.estado);
factory RegistroUsuario.constructor(
  {required String propuestaAnio, 
  required String propuestaNombre, 
  required String propuestaApellidos, 
  required String propuestaPais, 
  required String propuestaEstado}){
    int? valorAnio = int.tryParse(propuestaAnio);
    if (valorAnio == null) {
      throw mensajeRegistroUsuario;
    }
    if (propuestaNombre.trim().isEmpty) {
      throw mensajeRegistroUsuario;
    }
    propuestaApellidos = propuestaApellidos.trim().isEmpty ? mensajeCampoVacio : propuestaApellidos;
    propuestaPais = propuestaPais.trim().isEmpty ? mensajeCampoVacio : propuestaPais;
    propuestaEstado = propuestaEstado.trim().isEmpty ? mensajeCampoVacio : propuestaEstado;


  final resultado = RegistroUsuario._(valorAnio, propuestaNombre, 
  propuestaApellidos, propuestaPais, propuestaEstado);

  return resultado;
}
}


