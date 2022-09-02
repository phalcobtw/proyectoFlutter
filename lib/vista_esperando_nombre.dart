import 'package:flutter/material.dart';

class VistaSolicitandoNombre extends StatelessWidget {
  const VistaSolicitandoNombre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Dame el nombre'),
        TextField(),
        TextButton(onPressed: (){

        }, child: const Text('Algo debe decir aqui'))
      ]
    );
  }
}