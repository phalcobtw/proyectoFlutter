import 'package:flutter_application_1/clases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  blocTest<ClaseBloc, EstadoVerificacion>(
    'emits [MyState] when MyEvent is added.',
    build: () => ClaseBloc(),
    act: (bloc) => bloc.add(Creo()),
    expect: () => const [isA<SolicitandoNombre>],
  );
}