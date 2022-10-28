import 'dart:io';

import 'package:flutter_application_1/dominio/nick_formado.dart';
import 'package:fpdart/fpdart.dart';
import 'package:xml/xml.dart';

import '../../dominio/problemas.dart';

abstract class RepositorioXml{
  Future<Either<Problema,List<String>>> obtenerXml(NickFormado nick);
}

class RepositorioXmlPruebas extends RepositorioXml{
  final int tamanoPagina = 2;
  @override
  Future<Either<Problema, List<String>>> obtenerXml(NickFormado nick)async{
    if (!['benthor','fokuleh'].contains(nick.valor)) return Left(UsuarioNoRegistrado());
    try {
      String elXml = File('./lib/caracteristicas/${nick.valor.toLowerCase()}1.xml').readAsStringSync();
      int cuantasPaginas = _obtenerCuantasPaginasDesdeXml(elXml);
      List<String> nombresPaginas = _obtenerNombresPaginas(cuantasPaginas, nick);
      return Right(nombresPaginas.map((e) => File(e).readAsStringSync()).toList());
    } catch (e) {
      return Left(VersionIncorrectaXml());
    }
  }
int _obtenerCuantasPaginasDesdeXml(String elXml) {
  XmlDocument documento = XmlDocument.parse(elXml);
  String cadenaNumero = documento.getElement('plays')!.getAttribute('total')!;
  int numero = int.parse(cadenaNumero);
  return (numero / tamanoPagina).ceil();
}
List<String> _obtenerNombresPaginas(cuantasPaginas, NickFormado nick){
  final base = './lib/caracteristicas/${nick.valor}';
  List<String> lista = [];
  for (var i = 1; i <= cuantasPaginas; i++) {
    lista.add('$base'+'$i'+'.xml');
  }
  return lista;

}
}

