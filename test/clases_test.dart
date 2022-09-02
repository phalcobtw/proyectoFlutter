import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  blocTest<SubjectBloc, SubjectState>(
    'emits [MyState] when MyEvent is added.',
    build: () => SubjectBloc(),
    act: (bloc) => bloc.add(MyEvent),
    expect: () => const <SubjectState>[MyState],
  );
}