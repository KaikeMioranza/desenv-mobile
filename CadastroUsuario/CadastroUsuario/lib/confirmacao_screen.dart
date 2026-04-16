import 'package:flutter/material.dart';

class ConfirmacaoScreen extends StatelessWidget {

  final String nome;
  final int idade;
  final String email;
  final String sexo;
  final bool termos;

  ConfirmacaoScreen({
    required this.nome,
    required this.idade,
    required this.email,
    required this.sexo,
    required this.termos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmação"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Nome: $nome"),
            Text("Idade: $idade"),
            Text("Email: $email"),
            Text("Sexo: $sexo"),
            Text("Termos aceitos: ${termos ? "Sim" : "Não"}"),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Voltar"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Editar"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}