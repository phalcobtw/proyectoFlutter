

import 'package:fpdart/fpdart.dart';
import 'package:xml/xml.dart';

import '../../../dominio/problemas.dart';
import 'package:http/http.dart' as http;

abstract class RepositorioImagen{
  Either<Problema, String> obtenerImagenJuego();
}

class RepositorioImagenPruebas extends RepositorioImagen{
  final String takenokoImg = """
<?xml version="1.0" encoding="utf-8"?><items termsofuse="https://boardgamegeek.com/xmlapi/termsofuse"><item type="boardgame" id="70919">
         <thumbnail>https://cf.geekdo-images.com/uvz-5V6A2R6dp2oWIXmj_g__thumb/img/vz9Ec1xB2b4JJQlZFijUsuCvfkQ=/fit-in/200x150/filters:strip_icc()/pic1912529.jpg</thumbnail>
      <image>https://cf.geekdo-images.com/uvz-5V6A2R6dp2oWIXmj_g__original/img/HxMG1z7bIVGCGPI6u6ciVO0Oubk=/0x0/filters:format(jpeg)/pic1912529.jpg</image>
                                     				
				<name type="primary" sortindex="1" value="Takenoko" />
			
						                               				
				<name type="alternate" sortindex="1" value="Такеноко" />
			    				
				<name type="alternate" sortindex="1" value="טקנוקו" />
			    				
				<name type="alternate" sortindex="1" value="تاکنوکو" />
			    				
				<name type="alternate" sortindex="1" value="ทาเคโนโกะ" />
			    				
				<name type="alternate" sortindex="1" value="タケノコ" />
			    				
				<name type="alternate" sortindex="1" value="御竹園" />
			
						               													<description>A long time ago at the Japanese Imperial court, the Chinese Emperor offered a giant panda bear as a symbol of peace to the Japanese Emperor. Since then, the Japanese Emperor has entrusted his court members (the players) with the difficult task of caring for the animal by tending to his bamboo garden.&amp;#10;&amp;#10;In Takenoko, the players will cultivate land plots, irrigate them, and grow one of the three species of bamboo (Green, Yellow, and Pink) with the help of the Imperial gardener to maintain this bamboo garden. They will have to bear with the immoderate hunger of this sacred animal for the juicy and tender bamboo. The player who manages his land plots best, growing the most bamboo while feeding the delicate appetite of the panda, will win the game.&amp;#10;&amp;#10;</description>
										      	               				<yearpublished value="2011" />
						               				<minplayers value="2" />
						               				<maxplayers value="4" />
						      			<poll name="suggested_numplayers" title="User Suggested Number of Players" totalvotes="403">
			
		<results numplayers="1">		
					<result value="Best" numvotes="0" />
					<result value="Recommended" numvotes="6" />
					<result value="Not Recommended" numvotes="232" />
				</results>					
			
		<results numplayers="2">		
					<result value="Best" numvotes="77" />
					<result value="Recommended" numvotes="254" />
					<result value="Not Recommended" numvotes="22" />
				</results>					
			
		<results numplayers="3">		
					<result value="Best" numvotes="224" />
					<result value="Recommended" numvotes="122" />
					<result value="Not Recommended" numvotes="3" />
				</results>					
			
		<results numplayers="4">		
					<result value="Best" numvotes="134" />
					<result value="Recommended" numvotes="179" />
					<result value="Not Recommended" numvotes="20" />
				</results>					
			
		<results numplayers="4+">		
					<result value="Best" numvotes="0" />
					<result value="Recommended" numvotes="3" />
					<result value="Not Recommended" numvotes="191" />
				</results>					
	</poll> 			               				<playingtime value="45" />
						               				<minplaytime value="45" />
						               				<maxplaytime value="45" />
						               				<minage value="8" />
						      			<poll name="suggested_playerage" title="User Suggested Player Age" totalvotes="189">
			<results>		
					<result value="2" numvotes="0" />
					<result value="3" numvotes="1" />
					<result value="4" numvotes="1" />
					<result value="5" numvotes="16" />
					<result value="6" numvotes="48" />
					<result value="8" numvotes="90" />
					<result value="10" numvotes="30" />
					<result value="12" numvotes="3" />
					<result value="14" numvotes="0" />
					<result value="16" numvotes="0" />
					<result value="18" numvotes="0" />
					<result value="21 and up" numvotes="0" />
				</results>					
	</poll> 			      			<poll name="language_dependence" title="Language Dependence" totalvotes="89">
			
		<results>		
					<result level="1" value="No necessary in-game text" numvotes="89" />
					<result level="2" value="Some necessary text - easily memorized or small crib sheet" numvotes="0" />
					<result level="3" value="Moderate in-game text - needs crib sheet or paste ups" numvotes="0" />
					<result level="4" value="Extensive use of text - massive conversion needed to be playable" numvotes="0" />
					<result level="5" value="Unplayable in another language" numvotes="0" />
				</results>					
	</poll> 			      			 			      				
		 			

			
		
					<link type="boardgamecategory" id="1089" value="Animals" />
		
									
				
		 			

			
		
					<link type="boardgamecategory" id="1084" value="Environmental" />
		
									
				
		 			

			
		
					<link type="boardgamecategory" id="1013" value="Farming" />
		
									
				
		 			

			
		
					<link type="boardgamecategory" id="1086" value="Territory Building" />
		
									
			

			      				
		 			

			
		
					<link type="boardgamemechanic" id="2001" value="Action Points" />
		
									
				
		 			

			
		
					<link type="boardgamemechanic" id="2912" value="Contracts" />
		
									
				
		 			

			
		
					<link type="boardgamemechanic" id="2072" value="Dice Rolling" />
		
									
				
		 			

			
		
					<link type="boardgamemechanic" id="2875" value="End Game Bonuses" />
		
									
				
		 			

			
		
					<link type="boardgamemechanic" id="2676" value="Grid Movement" />
		
									
				
		 			

			
		
					<link type="boardgamemechanic" id="2026" value="Hexagon Grid" />
		
									
				
		 			

			
		
					<link type="boardgamemechanic" id="2011" value="Modular Board" />
		
									
				
		 			

			
		
					<link type="boardgamemechanic" id="2081" value="Network and Route Building" />
		
									
				
		 			

			
		
					<link type="boardgamemechanic" id="2048" value="Pattern Building" />
		
									
				
		 			

			
		
					<link type="boardgamemechanic" id="2004" value="Set Collection" />
		
									
				
		 			

			
		
					<link type="boardgamemechanic" id="2002" value="Tile Placement" />
		
									
			

			      				
		 			

			
		
					<link type="boardgamefamily" id="20718" value="Animals: Pandas" />
		
									
				
		 			

			
		
					<link type="boardgamefamily" id="5607" value="Components: 3-Dimensional (3D)" />
		
									
				
		 			

			
		
					<link type="boardgamefamily" id="25158" value="Components: Miniatures" />
		
									
				
		 			

			
		
					<link type="boardgamefamily" id="68769" value="Components: Wooden pieces &amp; boards" />
		
									
				
		 			

			
		
					<link type="boardgamefamily" id="10634" value="Country: Japan" />
		
									
				
		 			

			
		
					<link type="boardgamefamily" id="70360" value="Digital Implementations: Board Game Arena" />
		
									
				
		 			

			
		
					<link type="boardgamefamily" id="48865" value="Theme: Gardening" />
		
									
				
		 			

			
		
					<link type="boardgamefamily" id="48871" value="Theme: Nature" />
		
									
				
		 			

			
		
					<link type="boardgamefamily" id="57181" value="Theme: Trees and Forests" />
		
									
				
		 			

			
		
					<link type="boardgamefamily" id="28947" value="Theme: Weather" />
		
									
			

			      				
		 			

			
		
					<link type="boardgameexpansion" id="174095" value="Takenoko: Chibis" />
		
									
			

			      			

			      			

			      			

			      				
		 			

			
		
					<link type="boardgamecompilation" id="319765" value="타케노코: 빅 박스 (Takenoko Big Box)" />
		
									
			

			      			

			      			

			      	      	      				
		 			

			
		
					<link type="boardgamedesigner" id="9714" value="Antoine Bauza" />
		
									
			

			      				
		 			

			
		
					<link type="boardgameartist" id="12935" value="Nicolas Fructus" />
		
									
				
		 			

			
		
					<link type="boardgameartist" id="54125" value="Picksel" />
		
									
				
		 			

			
		
					<link type="boardgameartist" id="48431" value="Yuio" />
		
									
			

			      	      				
		 			

			
		
					<link type="boardgamepublisher" id="19260" value="Bombyx" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="5400" value="Matagot" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="157" value="Asmodee" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="15889" value="Asterion Press" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="6784" value="Bergsala Enigma (Enigma)" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="26638" value="Bureau de Juegos" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="5657" value="Filosofia Éditions" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="19047" value="FoxMind Israel" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="33618" value="Fractal Juegos" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="15605" value="Galápagos Jogos" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="45134" value="Geekach Games" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="8820" value="Gém Klub Kft." />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="1391" value="Hobby Japan" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="18852" value="Hobby World" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="6214" value="Kaissa Chess &amp; Games" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="25203" value="Lex Games" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="48236" value="Mostafil Games" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="39" value="Pegasus Spiele" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="7466" value="Rebel Sp. z o.o." />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="21053" value="REXhry" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="50269" value="Salta da Caixa" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="39058" value="Surfin' Meeple" />
		
									
				
		 			

			
		
					<link type="boardgamepublisher" id="39774" value="Tower Tactic Games" />
		
									
			

			
	

	

	
	
	
   
	
          
</item>
</items>""";

  @override
  Either<Problema, String> obtenerImagenJuego(){
    try {
      /* final respuesta = await http.get(Uri.parse('https://boardgamegeek.com/xmlapi2/thing?id=$id')); */
      XmlDocument documento = XmlDocument.parse(takenokoImg);
      final urlImg = documento.findAllElements('thumbnail').map((e) => e.text);
      return Right(urlImg.first.trim());
/*       final conjuntoIterable = elementosImg.map((e) {
        String urlImg = e.getAttribute('thumbnail')!;
        //innertext en vez de getAttribute
      }); */


    } catch (e) {
      return Left(VersionIncorrectaXml());
    }
  }
  
}