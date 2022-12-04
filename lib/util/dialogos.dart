import 'package:flutter/material.dart';

class Dialogos {
  static showAlertDialog(BuildContext context, String mensagem) {
    // configura o button
    Widget okButton = ElevatedButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: const Text("Alerta"),
      content: Text(mensagem),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  static showConfirmDialog(
      BuildContext context, String mensagem, Function simFunction) {
    Widget naoButton = ElevatedButton(
      child: const Text("Não"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget simButton = ElevatedButton(
      child: const Text("Sim"),
      onPressed: () {
        Navigator.of(context).pop();
        simFunction();
      },
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Confirmação"),
      content: Text(mensagem),
      actions: [
        simButton,
        naoButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
