import 'package:app_aula_oficial/api/frequencias_edit_page.dart';
import 'package:app_aula_oficial/model/Frequencia.dart';
import 'package:app_aula_oficial/sqlite/frequencia_helper.dart';
import 'package:app_aula_oficial/util/dialogos.dart';
import 'package:flutter/material.dart';

class FrequenciasListPage extends StatefulWidget {
  const FrequenciasListPage({super.key, this.title});
  final String? title;

  @override
  State<FrequenciasListPage> createState() => _FrequenciasListPageState();
}

class _FrequenciasListPageState extends State<FrequenciasListPage> {
  final frequenciasDb = FrequenciaHelper();
  List<Frequencia> frequencias = List.empty();
  Frequencia? selecionado;

  void _getAllContacts() {
    frequenciasDb.obterTodos().then((list) {
      setState(() {
        frequencias = list;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllContacts();
  }

  selecionar(int selecao) {
    selecionado = frequencias[selecao];
    _showContactPage();
  }

  void _incluir() {
    selecionado = Frequencia();
    _showContactPage();
  }

  void _showContactPage() async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FrequenciasEditPage(
                  selecionado: selecionado,
                )));
    if (result != null) {
      if (result == 'Salvar') {
        if (selecionado!.id == null) {
          frequenciasDb.inserir(selecionado!).then((_) {
            _getAllContacts();
            Dialogos.showAlertDialog(context, 'Dados inseridos com sucesso!');
          });
        } else {
          frequenciasDb.alterar(selecionado!).then((_) {
            _getAllContacts();
            Dialogos.showAlertDialog(context, 'Dados alterados com sucesso!');
          });
        }
      } else if (result == 'Excluir') {
        frequenciasDb.excluir(selecionado!.id!).then((_) {
          _getAllContacts();
          Dialogos.showAlertDialog(context, 'Dados excluídos com sucesso!');
        });
      } else if (result == 'Cancelar') {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listagem Do Cálculo De Frequência"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemCount: frequencias.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Row(children: <Widget>[
                  Wrap(
                    children: [
                      Text(frequencias[index]
                          .calculaFreqAlvo()
                          .toString()
                          .replaceAll('.', ',')),
                    ],
                  ),
                ]),
                onTap: () => selecionar(index),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incluir,
        tooltip: 'incluir',
        child: const Icon(Icons.add),
      ),
    );
  }
}
