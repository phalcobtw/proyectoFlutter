import 'package:flutter_application_1/caracteristicas/verificacion/repositorio_xml.dart';
import 'package:flutter_application_1/caracteristicas/verificacion/vistas/repositorio_juegos_verificacion.dart';
import 'package:flutter_application_1/dominio/juego_jugado.dart';
import 'package:flutter_application_1/dominio/nick_formado.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('benthor 2 juegos', () async {
    RepositorioXmlPruebas repositorioPruebas = RepositorioXmlPruebas();
    RepositorioPruebasJuegosJugados repositorio = RepositorioPruebasJuegosJugados(repositorioPruebas);
    final resultado = await repositorio.obtenerJuegosJugados(NickFormado.constructor('benthor'));
    resultado.match((l) {
      expect(true, equals(false));
    }, (r) {
      expect(r.length, equals(2));
    });
  });

  test('monopoly no está entre los jugados', () async{
    RepositorioXmlPruebas repositorioPruebas = RepositorioXmlPruebas();
    RepositorioPruebasJuegosJugados repositorio = RepositorioPruebasJuegosJugados(repositorioPruebas);
    final monopoly = JuegoJugado.constructor(nombrePropuesto: 'Monopoly', idPropuesto: '21314');
    final resultado = await repositorio.obtenerJuegosJugados(NickFormado.constructor('Benthor'));
    resultado.match((l) {
      assert(false);
    }, (r) {
      expect(!r.contains(monopoly), equals(true));
    } );
  });

  test('takenoko está entre los jugados', () async {
    RepositorioXmlPruebas repositorioPruebas = RepositorioXmlPruebas();
    RepositorioPruebasJuegosJugados repositorio = RepositorioPruebasJuegosJugados(repositorioPruebas);
    final takenoko = JuegoJugado.constructor(nombrePropuesto: 'Takenoko', idPropuesto: '70919');
    final resultado = await repositorio.obtenerJuegosJugados(NickFormado.constructor('Benthor'));
    resultado.match((l) => null, (r) {
      expect(r.contains(takenoko), true);
    } );
  });

  test('fokuleh regresa 6 juegos jugados', () async {
    RepositorioXmlPruebas repositorioPruebas = RepositorioXmlPruebas();
    RepositorioPruebasJuegosJugados repositorio = RepositorioPruebasJuegosJugados(repositorioPruebas);
    final resultado = await repositorio.obtenerJuegosJugados(NickFormado.constructor('fokuleh'));
    resultado.match((l) {
      expect(true, equals(false));
    }, (r) {
      expect(r.length, equals(6));
    });
  });
}