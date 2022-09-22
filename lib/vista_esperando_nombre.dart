import 'package:flutter/material.dart';
import 'package:flutter_application_1/clases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './caracteristicas/verificacion/vistas/repositorio_verificacion.dart';

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

class VistaSolicitandoNombreSTF extends StatefulWidget {
  const VistaSolicitandoNombreSTF({super.key});

  @override
  State<VistaSolicitandoNombreSTF> createState() => _VistaSolicitandoNombreSTFState();
}

class _VistaSolicitandoNombreSTFState extends State<VistaSolicitandoNombreSTF> {
  bool isButtonActive = false;
  late TextEditingController controller;
  @override
  void initState(){
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;

      setState(() => this.isButtonActive = isButtonActive);
    });
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Dame el nombre'),
        TextField(
          controller: controller,
        ),
        TextButton(onPressed: isButtonActive ? () {
          setState(() => isButtonActive = false,);
          var bloc = context.read<ClaseBloc>();
          bloc.add(NombreRecibido(controller.text));
          controller.clear();
        }:null, child: Text('Siguiente'))
      ],
    );
  }
}