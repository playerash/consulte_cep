import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'cep_event.dart';
part 'cep_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  CepBloc() : super(CepInitialState()) {
    on<CepSendEvent>((event, emit) async {
      String cep = "https://viacep.com.br/ws/${event.cep}/json/";
      final urlhttp = Uri.parse(cep);
      var response = await http.get(urlhttp);
      Map<String, dynamic> map = jsonDecode(response.body);
      if (map["cep"] == null) {
        emit(CepErroState());
      }else{
        emit(CepLoadedState(cep: map));
      }     
    });
  }
}
