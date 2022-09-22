import 'package:flutter_application_1/caracteristicas/verificacion/vistas/repositorio_verificacion.dart';
import 'package:flutter_application_1/dominio/nick_formado.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dominio/problemas.dart';

class EventoVerificacion{}

class Creado extends EventoVerificacion{}

class NombreRecibido extends EventoVerificacion{
  final String nombreAProcesar;
  NombreRecibido(this.nombreAProcesar);
}

class NombreConfirmado extends EventoVerificacion{}






class EstadoVerificacion{}

class Creandose extends EstadoVerificacion{}

class SolicitandoNombre extends EstadoVerificacion{}

class  EsperandoConfirmacionNombre extends EstadoVerificacion{}

class MostrarNombre extends EstadoVerificacion{
  final String nombre;
  final String pais;
  final String apellido;
  final String estado;
  final int anio;

  String mensaje = "";

  MostrarNombre(this.nombre, this.pais, this.apellido, this.estado, this.anio){
    mensaje = "Nombre: " + nombre + '\n' +
    "Pais: " + pais + '\n' +
    "Apellido: " + apellido + '\n' +
    "Estado: " + estado + '\n' + 
    "Año: " + anio.toString();
  }
}
class MostrarNombreNoConfirmado extends EstadoVerificacion{
  final Problema problema;
  late String mensaje = "";
  MostrarNombreNoConfirmado(this.problema){
    if (problema is VersionIncorrectaXml) {
      mensaje = "La version de XML no existe";
    }
    if (problema is UsuarioNoRegistrado) {
      mensaje = "El usuario no existe";
    }
  }
}

//Bloc

class ClaseBloc extends Bloc<EventoVerificacion, EstadoVerificacion> {
  ClaseBloc() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit (SolicitandoNombre());
    });
    on<NombreRecibido>(((event, emit) {
      RepositorioPruebasVerificacion repositorio = RepositorioPruebasVerificacion();
      var estadoUsuario = repositorio.obtenerRegistroUsuario(NickFormado.constructor(event.nombreAProcesar));
      estadoUsuario.match((l) => emit(MostrarNombreNoConfirmado(l)), (r) => emit(MostrarNombre(r.nombre,r.pais,r.apellidos,r.estado,r.anioRegistro)));
    }));
  }
}


