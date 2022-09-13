
import 'package:flutter_application_1/dominio/nick_formado.dart';
import 'package:flutter_application_1/dominio/problemas.dart';
import 'package:flutter_application_1/dominio/registro_usuario.dart';
import 'package:xml/xml.dart';
import 'package:fpdart/fpdart.dart';

abstract class RepositorioVerificacion{
  Either<Problema,RegistroUsuario> obtenerRegistroUsuario(NickFormado nick);
}

class RepositorioPruebasVerificacion extends RepositorioVerificacion{
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
        @override
        Either<Problema,RegistroUsuario> obtenerRegistroUsuario(NickFormado nick){
          final documento = XmlDocument.parse(benthor);
          final nodo = documento.findAllElements('yearregistered');
          final String valor = nodo.first.getAttribute('value') ?? "";
          if (valor.isEmpty) {
            return Left(UsuarioNoRegistrado());
          }
          String nombre = documento.findAllElements('firstname').first.getAttribute('value') ?? '';
          String pais = documento.findAllElements('country').first.getAttribute('value') ?? '';
          String estado = documento.findAllElements('stateorprovince').first.getAttribute('value') ?? '';
          String apellidos = documento.findAllElements('lastname').first.getAttribute('value') ?? '';
          
            return Right(RegistroUsuario.constructor(propuestaAnio: valor,
            propuestaNombre: nombre, 
            propuestaApellidos: apellidos, 
            propuestaPais: pais, 
            propuestaEstado: estado));
           
  }

}
