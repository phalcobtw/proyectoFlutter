import 'package:flutter_application_1/dominio/nick_formado.dart';
import 'package:flutter_application_1/dominio/problemas.dart';
import 'package:flutter_application_1/dominio/registro_juego.dart';
import 'package:flutter_application_1/dominio/registro_usuario.dart';
import 'package:xml/xml.dart';
import 'package:fpdart/fpdart.dart';

final partidas =
      """<plays username="benthor" userid="597373" total="1737" page="1" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
          <play id="34017961" date="2019-02-21" quantity="1" length="0" incomplete="0" nowinstats="0" location="">
          <item name="The Dwarf King" objecttype="thing" objectid="85250">
          <subtypes>
          <subtype value="boardgame"/>
          </subtypes>
          </item>
          </play>
          <play id="34017955" date="2019-02-21" quantity="1" length="0" incomplete="0" nowinstats="0" location="">
          <item name="Takenoko" objecttype="thing" objectid="70919">
          <subtypes>
          <subtype value="boardgame"/>
          </subtypes>
          </item>
          </play>
          <play id="34004213" date="2019-02-13" quantity="1" length="0" incomplete="0" nowinstats="0" location="">
          <item name="RoboRally" objecttype="thing" objectid="18">
          <subtypes>
          <subtype value="boardgame"/>
          </subtypes>
          </item>
          </play>
          </plays>""";
  final nombreJuego = 'name';
abstract class RepositorioVerificacionJuego {
  Either<Problema, RegistroJuego> obtenerRegistroJuego();
}

class RepositorioPruebasVerificacionJuego extends RepositorioVerificacionJuego{
  @override
  Either<Problema, RegistroJuego> obtenerRegistroJuego() {
    
    throw UnimplementedError();
  }
  List<String> obtenerRegistroJuegoDesdeXML(){

  }

}