import 'package:app_aula_oficial/model/contato.dart';
import 'package:app_aula_oficial/sqlite/contato_helper.dart';
import 'package:app_aula_oficial/sqlite/contatos_edit_page.dart';
import 'package:app_aula_oficial/util/dialogos.dart';
import 'package:flutter/material.dart';

class ContatosListPage extends StatefulWidget {
  const ContatosListPage({super.key, this.title});
  final String? title;

  @override
  State<ContatosListPage> createState() => _ContatosListPageState();
}

class _ContatosListPageState extends State<ContatosListPage> {
  final contatosDb = ContatoHelper();
  List<Contato> contatos = List.empty();
  Contato? selecionado;

  void _getAllContacts() {
    contatosDb.obterTodos().then((list) {
      setState(() {
        contatos = list;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllContacts();
  }

  selecionar(int selecao) {
    selecionado = contatos[selecao];
    _showContactPage();
  }

  void _incluir() {
    selecionado = Contato();
    _showContactPage();
  }

  void _showContactPage() async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContatosEditPage(
                  selecionado: selecionado,
                )));
    if (result != null) {
      if (result == 'Salvar') {
        if (selecionado!.id == null) {
          contatosDb.inserir(selecionado!).then((_) {
            _getAllContacts();
            Dialogos.showAlertDialog(context, 'Dados inseridos com sucesso!');
          });
        } else {
          contatosDb.alterar(selecionado!).then((_) {
            _getAllContacts();
            Dialogos.showAlertDialog(context, 'Dados alterados com sucesso!');
          });
        }
      } else if (result == 'Excluir') {
        contatosDb.excluir(selecionado!.id!).then((_) {
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
        title: const Text("Listagem"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemCount: contatos.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Row(children: <Widget>[
                  Text('${contatos[index].id}'),
                  const SizedBox(width: 20),
                  Text(contatos[index].nome!),
                  

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
