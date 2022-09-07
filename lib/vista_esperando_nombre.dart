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

class VistaSolicitandoNombreSTF extends StatefulWidget {
  const VistaSolicitandoNombreSTF({super.key});

  @override
  State<VistaSolicitandoNombreSTF> createState() => _VistaSolicitandoNombreSTFState();
}

class _VistaSolicitandoNombreSTFState extends State<VistaSolicitandoNombreSTF> {
  bool isButtonActive = true;
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
          controller.clear();
        }:null, child: Text('Algo debe decir aqui'))
      ],
    );
  }
}