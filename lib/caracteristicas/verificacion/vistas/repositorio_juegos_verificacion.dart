import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/caracteristicas/verificacion/repositorio_xml.dart';
import 'package:flutter_application_1/dominio/juego_jugado.dart';
import 'package:flutter_application_1/dominio/nick_formado.dart';
import 'package:flutter_application_1/dominio/problemas.dart';
import 'package:flutter_application_1/dominio/registro_juego.dart';
import 'package:flutter_application_1/dominio/registro_usuario.dart';
import 'package:xml/xml.dart';
import 'package:fpdart/fpdart.dart';

final nombreJuego = 'name';

abstract class RepositorioJuegosJugados {
  Future<Either<Problema, Set<JuegoJugado>>> obtenerJuegosJugados(
      NickFormado nick);
  final RepositorioXml repositorio;
  RepositorioJuegosJugados(this.repositorio);
}

class RepositorioPruebasJuegosJugados extends RepositorioJuegosJugados {

  RepositorioPruebasJuegosJugados(RepositorioXml repositorio) : super(repositorio);
  
  @override
  Future<Either<Problema, Set<JuegoJugado>>> obtenerJuegosJugados(NickFormado nick) async {
    Either<Problema,List<String>> resultadoXml = await super.repositorio.obtenerXml(nick);
    return resultadoXml.match((l) {
      return Left(l);
    }, (r) {
      final resultado = _obtenerJuegosJugadosDesdeXml(r);
      return resultado;
    });
  }

  Either<Problema, Set<JuegoJugado>> _obtenerJuegosJugadosDesdeXml(
      List<String> elXml) {
    final resultado = elXml.map((e) => _obtenerUnSoloSet(e));
    if (resultado.any((element) => element is Problema)) {
      return Left(VersionIncorrectaXml());
    }
    final soloSets = resultado.map((e) => e.getOrElse((l) => {}));
    final conjunto = soloSets.fold<Set<JuegoJugado>>({}, (p, a) => p..addAll(a.toList()));
    return Right(conjunto);
    
  }

  Either<Problema, Set<JuegoJugado>> _obtenerUnSoloSet(String elXml) {
    try {
      XmlDocument documento = XmlDocument.parse(elXml);
      final losPlay = documento.findAllElements('item');
      final conjuntoIterable = losPlay.map((e) {
        String nombre = e.getAttribute('name')!;
        String id = e.getAttribute('objectid')!;
        return JuegoJugado.constructor(
            nombrePropuesto: nombre, idPropuesto: id);
      });
      final conjunto = Set<JuegoJugado>.from(conjuntoIterable);
      return Right(conjunto);
    } catch (e) {
      return Left(VersionIncorrectaXml());
    }
  }
}

