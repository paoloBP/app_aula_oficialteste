import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial'),
      ),
      body: const Center(
        child: Text(
            ' Calculando a frequência cardíaca máxima (FCMáx)\n\n Podemos calcular a frequência cardíaca \n\n máxima de algumas formas.\n\n Utilize Nosso aplicativo para obter o cálculo FCMax \n\n ideal para você.\n\n Passo 1: Insira seu nome\n\n Passo 2: Insira sua idade.\n\n Passo 3: Calcule\n\n'),
      ),
    );
  }
}
