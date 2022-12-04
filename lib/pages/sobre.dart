import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculo da Zona de Frequência '),
      ),
      body: const Center(
        child: Text(
            'Calculando a frequência cardíaca máxima (FCMáx)\n\nPodemos calcular a frequência cardíaca máxima de algumas formas.\n\nUtilize Nosso aplicativo para obter o cálculo FCMax ideal para você.\n\nPasso 1: Insira seu nome\n\n Passo 2: Insira sua idade.\n\nPasso 3: Calcule\n\n'),
      ),
    );
  }
}
