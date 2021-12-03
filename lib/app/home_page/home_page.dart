import 'package:consulte_cep/app/bloc/cep_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cepController = TextEditingController();

  var bloc = CepBloc();

  @override
  void dispose() {
    cepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cep"),
      ),
      body: Column(
        children: [
          BlocBuilder<CepBloc, CepState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is CepInitialState) {
                return Column(
                  children: [Text(state.cep["cep"])],
                );
              } else if (state is CepLoadedState) {
                return Column(
                  children: [
                    Text(state.cep["cep"]),
                    Text(state.cep["logradouro"]),
                    Text(state.cep["uf"]),
                    Text(state.cep["localidade"]),
                    Text(state.cep["bairro"]),
                  ],
                );
              } else if (state is CepErroState) {
                return Text(state.message);
              } else {
                return const Text("algo diferente");
              }
            },
          ),
          Column(
            children: [
              TextFormField(
                controller: cepController,
              ),
              ElevatedButton(
                  onPressed: () {
                    bloc.add(CepSendEvent(cep: cepController.text));
                  },
                  child: const Text("Pesquisar"))
            ],
          )
        ],
      ),
    );
  }
}
