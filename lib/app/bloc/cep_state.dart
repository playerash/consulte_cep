part of 'cep_bloc.dart';

@immutable
abstract class CepState {}

class CepInitialState extends CepState {
  final Map cep = {
    "cep": "",
    "logradouro": "",
    "bairro": "",
    "localidade": "",
    "uf": ""
  };
}

class CepLoadedState extends CepState {
  final Map<String, dynamic> cep;

  CepLoadedState({required this.cep});
}

class CepErroState extends CepState {
  final String message = "Cep não existe";
}
