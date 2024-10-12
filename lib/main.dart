import 'package:flutter/material.dart';
import 'package:quizz_flutter/resultado.dart';
import './questionario.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  @override
  var _perguntaSelecionada = 0;
  final _title = 'Perguntas';
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Vermelho', 'pontuacao': 10},
        {'texto': 'Preto', 'pontuacao': 5},
        {'texto': 'Rosa', 'pontuacao': 3},
        {'texto': 'Amarelo', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Leão', 'pontuacao': 10},
        {'texto': 'Jabuti', 'pontuacao': 5},
        {'texto': 'Arara', 'pontuacao': 3},
        {'texto': 'Sapo', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu jogo favorito?',
      'respostas': [
        {'texto': 'Pokemon', 'pontuacao': 10},
        {'texto': 'COD', 'pontuacao': 5},
        {'texto': 'Fifa', 'pontuacao': 3},
        {'texto': 'Final Fantasy', 'pontuacao': 1},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (itemPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }

    //print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get itemPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: itemPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
