import 'dart:math';

import 'package:flutter_application_1/caracteristicas/verificacion/vistas/repositorio_verificacion.dart';
import 'package:flutter_application_1/dominio/nick_formado.dart';
import 'package:flutter_application_1/dominio/problemas.dart';
import 'package:flutter_application_1/dominio/registro_usuario.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

void main() {
  group('Prueba verificacion offline', (){
    test('Con benthor me regresa valor', (){
      RepositorioPruebasVerificacion repositorio =
      RepositorioPruebasVerificacion();
      var resultado = repositorio.obtenerRegistroUsuario(NickFormado.constructor('Benthor'));
      resultado.match(
        (l){
          expect(false, equals(true));
        },
        ((r){
          expect(r.anioRegistro, equals(2012));
          expect(r.nombre, equals('Benthor'));
          expect(r.apellidos, equals('Benthor'));
          expect(r.estado, equals(mensajeCampoVacio));
          expect(r.pais, equals(mensajeCampoVacio));
        })
      );
    });
    test('Con amlo me regresa error', (){
      RepositorioPruebasVerificacion repositorio =
      RepositorioPruebasVerificacion();
      var resultado = repositorio.obtenerRegistroUsuario(NickFormado.constructor('amlo'));
      resultado.match(
        (l){
          expect(true, equals(true));
        },
        ((r){
          expect(true, equals(false));
        })
      );
    });
    test('con xml incorrecto', () {
      RepositorioPruebasVerificacion repositorio =
      RepositorioPruebasVerificacion();
      var resultado = repositorio.obtenerRegistroUsuario(NickFormado.constructor('incorrecto'));
      resultado.match((l) { 
        expect(l, isA<VersionIncorrectaXml>());
      }, 
      (r) {
        assert(false);
      });
    });
  });
}