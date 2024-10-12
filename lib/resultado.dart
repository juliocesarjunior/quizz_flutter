import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  // Construtor que inicializa pontuacao
  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});

  // Getter para fraseResultado
  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue, // Cor do texto
          ),
        ),
      ],
    );
  }
}
