import 'package:flutter_bloc/flutter_bloc.dart';

class EventoVerificacion{}

class Creado extends EventoVerificacion{}

class NombreRecibido extends EventoVerificacion{}

class NombreConfirmado extends EventoVerificacion{}






class EstadoVerificacion{}

class Creandose extends EstadoVerificacion{}

class SolicitandoNombre extends EstadoVerificacion{}

class  EsperandoConfirmacionNombre extends EstadoVerificacion{}

class MostrarNombre extends EstadoVerificacion{}

//Bloc

class ClaseBloc extends Bloc<EventoVerificacion, EstadoVerificacion> {
  ClaseBloc() : super(Creandose()) {
    on<Creado>((event, emit) {
      // TODO: implement event handler
    });
  }
}

