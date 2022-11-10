import 'package:flutter_application_1/caracteristicas/verificacion/vistas/repositorio_imagen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TEST DE THUMBNAILS', () {
    test('obtengo link de thumbnail', () {
      RepositorioImagenPruebas repositorioImg = RepositorioImagenPruebas();
      final resultado = repositorioImg.obtenerImagenJuego();
      resultado.match((l) {
        expect(true, equals(false));
      }, (r) {
        expect(r.length, equals(141));
      });
    });
  });
}