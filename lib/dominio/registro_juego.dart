const String mensajeRegistroJuego = 'Error de registro de juego';
const String mensajeCampoVacio = 'Sin Valor';

class RegistroJuego{
  late String nombreJuego;
  RegistroJuego._(this.nombreJuego);
factory RegistroJuego.constructor(
  {required String propuestaJuego}){
    if (propuestaJuego.trim().isEmpty) {
      throw mensajeRegistroJuego;
    }
    propuestaJuego = propuestaJuego.trim().isEmpty ? mensajeCampoVacio : propuestaJuego;

  final resultado = RegistroJuego._(propuestaJuego);

  return resultado;
}
}