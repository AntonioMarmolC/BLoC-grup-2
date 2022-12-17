part of 'practica_bloc.dart';

@immutable
abstract class FrasesState {}

class FraseNoCargada extends FrasesState {}

class FraseCargada extends FrasesState {
  final String frase;

  FraseCargada(this.frase);
}
