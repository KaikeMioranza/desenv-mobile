import 'package:flutter/material.dart';
import 'game_model.dart';
import 'circulo_opcao.dart';
import 'resultado_screen.dart';

class SelecaoScreen extends StatelessWidget {
  const SelecaoScreen({super.key});

  void _jogar(BuildContext context, Opcao escolhaUsuario) {
    final escolhaApp = GameModel.sortearEscolha();
    final resultado = GameModel.calcularResultado(escolhaUsuario, escolhaApp);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultadoScreen(
          escolhaUsuario: escolhaUsuario,
          escolhaApp: escolhaApp,
          resultado: resultado,
        ),
      ),
    );
  }

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
          CirculoOpcao(imagemPath: GameModel.imagemPadrao),
          const Spacer(),
          const Text(
            'Sua escolha:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: Opcao.values
                .map(
                  (opcao) => CirculoOpcao(
                    imagemPath: opcao.imagemPath,
                    onTap: () => _jogar(context, opcao),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
