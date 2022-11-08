import 'dart:io';

import 'package:flutter_application_1/caracteristicas/verificacion/vistas/repositorio_verificacion.dart';
import 'package:flutter_application_1/dominio/nick_formado.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dominio/juego_jugado.dart';
import 'dominio/problemas.dart';

class EventoVerificacion{}

class Creado extends EventoVerificacion{}

class NombreRecibido extends EventoVerificacion{
  final String nombreAProcesar;
  NombreRecibido(this.nombreAProcesar);
}

class NombreConfirmado extends EventoVerificacion{}

class JuegosRecibidos extends EventoVerificacion {
  final String nombre;

  JuegosRecibidos(this.nombre);
}






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

class MostrarJuegos extends EstadoVerificacion {
  final Set<JuegoJugado> setJuegos;
  final String nombre;

  MostrarJuegos(this.setJuegos, this.nombre);
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
      String path = "";
      if (event.nombreAProcesar == 'benthor') {
        try {
         path = File('./lib/caracteristicas/benthor.txt').readAsStringSync(); 
        } catch (e) {
          path = "juego1, 1\njuego2, 2";
        }
      }
      if (event.nombreAProcesar == 'fokuleh') {
        try {
         path = File('./lib/caracteristicas/fokuleh.txt').readAsStringSync(); 
        } catch (e) {
          path = "juego1, 1\njuego2, 2";
        }
      }
      Set<JuegoJugado> setJuegos = {};
      for (var juego in path.split('\n')) {
        if (juego != "") {
          String nombreJuego = juego.split(' - ')[0];
          String id = juego.split(' - ')[1];
          setJuegos.add(JuegoJugado.constructor(nombrePropuesto: nombreJuego, idPropuesto: id));
        }
      }
      emit(MostrarJuegos(setJuegos, event.nombreAProcesar));
    }));
  }
}


