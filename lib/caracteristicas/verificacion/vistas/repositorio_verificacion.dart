import 'package:flutter_application_1/dominio/nick_formado.dart';
import 'package:flutter_application_1/dominio/problemas.dart';
import 'package:flutter_application_1/dominio/registro_usuario.dart';
import 'package:xml/xml.dart';
import 'package:fpdart/fpdart.dart';

abstract class RepositorioVerificacion {
  Either<Problema, RegistroUsuario> obtenerRegistroUsuario(NickFormado nick);
}

class RepositorioPruebasVerificacion extends RepositorioVerificacion {
  @override
  final String benthor = """<?xml version="1.0" encoding="utf-8"?>
    <user id="597373" name="benthor" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
		<firstname value="Benthor" />		
    <lastname value="Benthor" />			
    <avatarlink value="N/A" />			
    <yearregistered value="2012" />			
    <lastlogin value="2022-05-31" />		
    <stateorprovince value="" />			
    <country value="" />			
    <webaddress value="" />			
    <xboxaccount value="" />			
    <wiiaccount value="" />			
    <psnaccount value="" />			
    <battlenetaccount value="" />			
    <steamaccount value="" />			
    <traderating value="0" />	
				</user>""";
  final _amlo = """<?xml version="1.0" encoding="utf-8"?>
        <user id="" name="" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
				<firstname value="" />			
        <lastname value="" />			
        <avatarlink value="N/A" />			
        <yearregistered value="" />			
        <lastlogin value="" />			
        <stateorprovince value="" />			
        <country value="" />			
        <webaddress value="" />			
        <xboxaccount value="" />			
        <wiiaccount value="" />			
        <psnaccount value="" />			
        <battlenetaccount value="" />			
        <steamaccount value="" />			
        <traderating value="362" />	
				</user>""";
  final _incorrecto = """<?xml version="1.0" encoding="utf-8"?>
        <user id="" name="" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
				<firstname value="" />			
        <lastname value="" />			
        <avatarlink value="N/A" />			
        <yearregistered vale="" />			
        <lastlogin value="" />			
        <stateooraprovince value="" />			
        <countrry value="" />			
        <webaddress value="" />			
        <xboxaccount value="" />			
        <wiiaccount value="" />			
        <psnaccount value="" />			
        <battlenetaccount value="" />			
        <steamaccount value="" />			
        <traderating value="362" />	
				</user>""";
  final campoNombre = 'firstname';
  final campoPais = 'country';
  final campoEstado = 'stateorprovince';
  final campoApellido = 'lastname';
  final campoAnio = 'yearregistered';
  final fechaPartida = 'date';


  @override
  Either<Problema, RegistroUsuario> obtenerRegistroUsuarioDesdeXml(
      XmlDocument documento) {
    final nodo = documento.findAllElements(campoAnio);
    Either<Problema, String> anioRegistrado = obtenerValorCampo(documento, campoAnio);
    Either<Problema, String> nombre = obtenerValorCampo(documento, campoNombre);
    Either<Problema, String> pais = obtenerValorCampo(documento, campoPais);
    Either<Problema, String> estado = obtenerValorCampo(documento, campoEstado);
    Either<Problema, String> apellidos = obtenerValorCampo(documento, campoApellido);
    if ([anioRegistrado, nombre, pais, estado, apellidos]
        .any((element) => element.isLeft())) {
      return Left(VersionIncorrectaXml());
    }
    final valoresRegistro = [anioRegistrado, apellidos, estado, nombre, pais]
        .map((e) => e.getOrElse((l) => ''))
        .toList();
    if (valoresRegistro[0].isEmpty) {
      return Left(UsuarioNoRegistrado());
    }
    return Right(RegistroUsuario.constructor(
        propuestaAnio: valoresRegistro[0],
        propuestaApellidos: valoresRegistro[1],
        propuestaEstado: valoresRegistro[2],
        propuestaNombre: valoresRegistro[3],
        propuestaPais: valoresRegistro[4]));
  }
  Either<Problema, String> obtenerValorCampo(
      XmlDocument documento, String campo) {
    const campoValor = 'value';
    final valoresEncontrados = documento.findAllElements(campo);
    if (valoresEncontrados.isEmpty) return Left(VersionIncorrectaXml());
    final String? valorARegresar = valoresEncontrados.first.getAttribute(campoValor);
    if (valorARegresar == null) {
      return Left(VersionIncorrectaXml());
    }
    return Right(valorARegresar);
  }

  Either<Problema, List> obtenerValorPartidas(XmlDocument documento, String campo){
    final valoresEncontrados = documento.findAllElements(campo);
    if (valoresEncontrados.isEmpty) return Left(VersionIncorrectaXml());
    final listaValores = [];
    for (var i = 0; i < valoresEncontrados.length; i++) {
      listaValores[i] = valoresEncontrados.first.getAttribute(campo) ?? "";
    }
    return Right(listaValores);
  }

  @override
  Either<Problema, RegistroUsuario> obtenerRegistroUsuario(NickFormado nick) {
    if (nick.valor == 'Benthor') {
      final documento = XmlDocument.parse(benthor);
      return obtenerRegistroUsuarioDesdeXml(documento);
    }
    if (nick.valor == 'amlo') {
      final documento = XmlDocument.parse(_amlo);
      return obtenerRegistroUsuarioDesdeXml(documento);
    }
    if (nick.valor == 'incorrecto') {
      final documento = XmlDocument.parse(_incorrecto);
      return obtenerRegistroUsuarioDesdeXml(documento);
    }
    return Left(UsuarioNoRegistrado());
  }
}
