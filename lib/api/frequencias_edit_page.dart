import 'package:app_aula_oficial/model/Frequencia.dart';
import 'package:flutter/material.dart';

class FrequenciasEditPage extends StatefulWidget {
  const FrequenciasEditPage({super.key, this.selecionado});

  final Frequencia? selecionado;

  @override
  State<FrequenciasEditPage> createState() => _FrequenciasEditPageState();
}

class _FrequenciasEditPageState extends State<FrequenciasEditPage> {
  final _nomeCon = TextEditingController();
  final _idadeCon = TextEditingController();
  final _sexoCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomeCon.text = widget.selecionado!.nome!;
    _idadeCon.text = widget.selecionado!.idade!;
    _sexoCon.text = widget.selecionado!.sexo!;
  }

  void salvar() {
    widget.selecionado!.nome = _nomeCon.text;
    widget.selecionado!.idade = _idadeCon.text;
    widget.selecionado!.sexo = _sexoCon.text;
    Navigator.pop(context, 'Salvar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edição de Frequencia'),
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
              controller: _idadeCon,
              keyboardType: TextInputType.text,
              maxLength: 20,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Idade',
              ),
            ),
            TextFormField(
              controller: _sexoCon,
              keyboardType: TextInputType.text,
              maxLength: 20,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sexo',
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
