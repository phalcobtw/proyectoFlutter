import 'package:flutter/material.dart';

class Aplicacion extends StatelessWidget {
  const Aplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: CircularProgressIndicator(),
    );
  }
}