part of 'cep_bloc.dart';

@immutable
abstract class CepEvent {}

class CepSendEvent extends CepEvent {
  final String cep;
  CepSendEvent({required this.cep});
}
