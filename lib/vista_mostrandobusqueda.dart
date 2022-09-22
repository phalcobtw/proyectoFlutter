import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/clases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VistaMostrandoBusqueda extends StatelessWidget {
  const VistaMostrandoBusqueda({super.key, required this.mensaje});

  final String mensaje;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(mensaje),
          TextButton(onPressed: (){
            var bloc = context.read<ClaseBloc>();
            bloc.add(Creado());

          }, child: Text('Volver'))
        ],
      ),
    );
  }
}