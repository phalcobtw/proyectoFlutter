import 'package:flutter_application_1/dominio/problemas.dart';

class ImagenFormada{
  late String id;
  ImagenFormada._({required this.id});

  factory ImagenFormada.constructor({required String idPropuesto}){
    if (idPropuesto.trim().isEmpty) throw ImagenMalFormada();
    return ImagenFormada._(id: idPropuesto);
  }
}