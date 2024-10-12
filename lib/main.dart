import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'repostas': ['Vermelho', 'Preto', 'Rosa', 'Amarelo'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'repostas': ['Leão', 'Jabuti', 'Arara', 'sapo'],
      },
      {
        'texto': 'Qual é o seu jogo favorito?',
        'repostas': ['Pokemon', 'COD', 'Fifa', 'Final Fantasy'],
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto'] as String),
            Resposta('Resposta 1', _responder),
            Resposta('Resposta 3', _responder),
            Resposta('Resposta 3', _responder),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
