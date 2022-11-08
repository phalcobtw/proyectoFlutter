import 'package:flutter/material.dart';
import 'package:flutter_application_1/clases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dominio/juego_jugado.dart';




class VistaListaJuegos extends StatelessWidget {
  const VistaListaJuegos(
      {Key? key, required this.setJuegos, required this.nombre})
      : super(key: key);
  final String nombre;
  final Set<JuegoJugado> setJuegos;
  @override
  Widget build(BuildContext context) {
    List<JuegoJugado> listaJuegos = setJuegos.toList();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: setJuegos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text((index + 1).toString()),
                subtitle: Text(listaJuegos[index].id.toString()),
                title: Text(listaJuegos[index].nombre.toString()),
              );
            },
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            var bloc = context.read<ClaseBloc>();
            bloc.add(Creado());
          },
          child: const Text('Regresar'),
        )
      ],
    );
  }
}