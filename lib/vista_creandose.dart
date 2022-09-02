import 'package:flutter/material.dart';

class VistaCreandose extends StatelessWidget {
  const VistaCreandose({super.key});

  @override
  Widget build(BuildContext context) {
     return Center( 
      child: Container(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(),
      ),
    );
  }
}