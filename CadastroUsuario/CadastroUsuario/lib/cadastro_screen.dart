import 'package:flutter/material.dart';
import 'confirmacao_screen.dart';

class CadastroScreen extends StatefulWidget {
  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {

  // Controllers
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final emailController = TextEditingController();

  // Variáveis de estado
  String? sexo;
  bool termos = false;

  void validar() {

    String nome = nomeController.text;
    String idadeTexto = idadeController.text;
    String email = emailController.text;

    int idade;

    if (nome.isEmpty) {
      erro("Nome não pode ser vazio");
      return;
    }

    if (idadeTexto.isEmpty) {
      erro("Idade não pode ser vazia");
      return;
    }

    try {
      idade = int.parse(idadeTexto);
    } catch (e) {
      erro("Idade deve ser número");
      return;
    }

    if (idade < 18) {
      erro("Idade deve ser maior ou igual a 18");
      return;
    }

    if (email.isEmpty || !email.contains("@") || !email.contains(".")) {
      erro("Email inválido");
      return;
    }

    if (sexo == null) {
      erro("Selecione o sexo");
      return;
    }

    if (!termos) {
      erro("Aceite os termos");
      return;
    }

    // Navegação
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmacaoScreen(
          nome: nome,
          idade: idade,
          email: email,
          sexo: sexo!,
          termos: termos,
        ),
      ),
    );
  }

  void erro(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        title: Text("Cadastro de Usuário"),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),

            child: Column(
              children: [

                Text(
                  "Preencha os campos abaixo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                TextField(
                  controller: nomeController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    hintText: "Digite seu nome",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: idadeController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Idade",
                    hintText: "Digite sua idade",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Digite seu email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  initialValue: sexo,
                  hint: Text("Selecione o sexo"),
                  items: ["Masculino", "Feminino", "Outro"]
                      .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
                      .toList(),
                  onChanged: (valor) {
                    setState(() {
                      sexo = valor;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    Checkbox(
                      value: termos,
                      onChanged: (valor) {
                        setState(() {
                          termos = valor!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text("Aceito os termos de uso"),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: validar,
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}