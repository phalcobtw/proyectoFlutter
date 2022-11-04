import 'dart:io';

import 'package:flutter_application_1/dominio/nick_formado.dart';
import 'package:fpdart/fpdart.dart';
import 'package:xml/xml.dart';

import '../../dominio/problemas.dart';
import 'package:http/http.dart' as http;

abstract class RepositorioXml{
  Future<Either<Problema,List<String>>> obtenerXml(NickFormado nick);
}

class RepositorioXmlReal extends RepositorioXml{
  @override
  Future<Either<Problema, List<String>>> obtenerXml(NickFormado nick) async {
    try {
      final respuesta = await http.get(Uri.parse('https://boardgamegeek.com/xmlapi2/plays?username=${nick.valor}'));
      String elXml = respuesta.body;
      int cuantasPaginas = _obtenerCuantasPaginasDesdeXmlReal(elXml);
      List<String> nombresPaginas = _obtenerNombresPaginas(cuantasPaginas, nick);
      List<String> resultado = [];
      for (var pagina in nombresPaginas) {
        final requestpagina = await http.get(Uri.parse(pagina));
        resultado.add(requestpagina.body);
      }
      return Right(resultado);
    } catch (e) {
      return Left(VersionIncorrectaXml());
    }
  }
  List<String> _obtenerNombresPaginas(cuantasPaginas, NickFormado nick){
    var base = 'https://boardgamegeek.com/xmlapi2/plays?username=${nick.valor}';
    List<String> lista = [];
    for (var i = 1; i <= cuantasPaginas; i++) {
      lista.add(base+'&page='+'$i');
    }
    return lista;

}

  int _obtenerCuantasPaginasDesdeXmlReal(String xml){
  XmlDocument documento = XmlDocument.parse(xml);
  String cadenaNumero = documento.getElement('plays')!.getAttribute('total')!;
  int numero = int.parse(cadenaNumero);
  return (numero / 100).ceil();
}

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

