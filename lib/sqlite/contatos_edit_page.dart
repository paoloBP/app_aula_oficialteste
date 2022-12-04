import 'package:app_aula_oficial/model/contato.dart';
import 'package:flutter/material.dart';

class ContatosEditPage extends StatefulWidget {
  const ContatosEditPage({super.key, this.selecionado});

  final Contato? selecionado;

  @override
  State<ContatosEditPage> createState() => _ContatosEditPageState();
}

class _ContatosEditPageState extends State<ContatosEditPage> {
  final _nomeCon = TextEditingController();
  final _emailCon = TextEditingController();
  final _telefoneCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomeCon.text = widget.selecionado!.nome!;
    _emailCon.text = widget.selecionado!.email!;
    _telefoneCon.text = widget.selecionado!.telefone!;
  }

  void salvar() {
    widget.selecionado!.nome = _nomeCon.text;
    widget.selecionado!.email = _emailCon.text;
    widget.selecionado!.telefone = _telefoneCon.text;
    Navigator.pop(context, 'Salvar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edição de contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _nomeCon,
              keyboardType: TextInputType.text,
              maxLength: 20,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
            ),
            TextFormField(
              controller: _emailCon,
              keyboardType: TextInputType.text,
              maxLength: 20,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: _telefoneCon,
              keyboardType: TextInputType.text,
              maxLength: 20,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Telefone',
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Salvar'),
                    onPressed: () {
                      salvar();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Excluir'),
                    onPressed: () {
                      Navigator.pop(context, 'Excluir');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Cancelar'),
                    onPressed: () {
                      Navigator.pop(context, 'Cancelar');
                    },
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
