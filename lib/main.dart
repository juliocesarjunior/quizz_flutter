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
        'respostas': ['Vermelho', 'Preto', 'Rosa', 'Amarelo'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Leão', 'Jabuti', 'Arara', 'sapo'],
      },
      {
        'texto': 'Qual é o seu jogo favorito?',
        'respostas': ['Pokemon', 'COD', 'Fifa', 'Final Fantasy'],
      }
    ];

    //List<String> respostas = perguntas[_perguntaSelecionada]['respostas'];
    List<String> respostas =
        (perguntas[_perguntaSelecionada]['respostas'] as List<dynamic>)
            .cast<String>();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto'] as String),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
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
