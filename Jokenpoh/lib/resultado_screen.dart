import 'package:flutter/material.dart';
import 'game_model.dart';
import 'circulo_opcao.dart';

class ResultadoScreen extends StatelessWidget {
  final Opcao escolhaUsuario;
  final Opcao escolhaApp;
  final Resultado resultado;

  const ResultadoScreen({
    super.key,
    required this.escolhaUsuario,
    required this.escolhaApp,
    required this.resultado,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pedra, Papel, Tesoura',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do APP',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          CirculoOpcao(imagemPath: escolhaApp.imagemPath),
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Sua Escolha',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          CirculoOpcao(imagemPath: escolhaUsuario.imagemPath),
          const Spacer(),
          Text(
            GameModel.textoResultado(resultado),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Image(
              image: AssetImage('assets/images/resultado_extra.png'),
              height: 100,
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
            ),
            child: const Text(
              'Jogar novamente',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}