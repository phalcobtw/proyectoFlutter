import 'package:flutter/material.dart';
import 'package:flutter_application_1/clases.dart';
import 'package:flutter_application_1/vista_creandose.dart';
import 'package:flutter_application_1/vista_esperando_nombre.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  //runApp(const MyApp());
  runApp(const AplicacionInyectada());
}
class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        ClaseBloc blocVerificacion=ClaseBloc();
        Future.delayed(Duration(seconds: 2),(){
          blocVerificacion.add(Creado());
        });
        return blocVerificacion;
      },
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: Builder(builder: (context){
          var estado = context.watch<ClaseBloc>().state;
          if(estado is Creandose){
            return VistaCreandose();
          }
          if(estado is SolicitandoNombre){
            return VistaSolicitandoNombreSTF();
          }
          return const Center(child: Text('Si estas viendo esto algo salio mal, HUYE'));

        }),
      )
    );
  }
}