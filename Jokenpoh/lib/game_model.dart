import 'dart:math';

enum Opcao { pedra, papel, tesoura }

enum Resultado { vitoria, derrota, empate }

extension OpcaoExtension on Opcao {
  String get imagemPath => 'assets/images/$name.png';

  bool venceDe(Opcao outra) {
    return (this == Opcao.pedra && outra == Opcao.tesoura) ||
        (this == Opcao.tesoura && outra == Opcao.papel) ||
        (this == Opcao.papel && outra == Opcao.pedra);
  }
}

class GameModel {
  static const String imagemPadrao = 'assets/images/padrao.png';

  static Opcao sortearEscolha() {
    final valores = Opcao.values;
    return valores[Random().nextInt(valores.length)];
  }

  static Resultado calcularResultado(Opcao usuario, Opcao app) {
    if (usuario == app) return Resultado.empate;
    if (usuario.venceDe(app)) return Resultado.vitoria;
    return Resultado.derrota;
  }

  static String textoResultado(Resultado resultado) {
    switch (resultado) {
      case Resultado.vitoria:
        return 'Você Venceu! 🏆';
      case Resultado.derrota:
        return 'Você Perdeu! 😢';
      case Resultado.empate:
        return 'Empatamos! 🤝';
    }
  }
}
