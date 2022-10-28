import 'package:flutter_application_1/caracteristicas/verificacion/repositorio_xml.dart';
import 'package:flutter_application_1/dominio/nick_formado.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Si le paso benthor me debe regresar 1 solo xml', () async{
    RepositorioXml repositorio = RepositorioXmlPruebas();
    final resultado = await repositorio.obtenerXml(NickFormado.constructor('Benthor'));
    resultado.match((l) { expect(true, equals(false));
    }
    , (r) {
      expect(r.length, equals(1));
    });
  });
  test('fokuleh debe de tener 3 paginas', () async {
    RepositorioXmlPruebas repositorio = RepositorioXmlPruebas();
    final resultado = await repositorio.obtenerXml(NickFormado.constructor('fokuleh'));
    resultado.match((l) {
      expect(true, equals(false));
    }, (r) => expect(r.length, equals(3)));
  });
  }