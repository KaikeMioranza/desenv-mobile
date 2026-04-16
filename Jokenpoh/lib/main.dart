import 'package:flutter/material.dart';
import 'selecao_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SelecaoScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}