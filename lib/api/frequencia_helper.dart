import 'dart:async';
import 'package:app_aula_oficial/model/frequencia.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FrequenciaHelper {
  String uri = 'http://localhost:3000';

  Future<List<Frequencia>> obterTodos() async {
    final res = await http.get(Uri.parse('$uri/frequencia'));
    if (res.statusCode == 200) {
      List jsonList = json.decode(res.body);
      List<Frequencia> listContact = List.empty(growable: true);
      for (Map<String, dynamic> m in jsonList) {
        Frequencia c = Frequencia.fromMap(m);
        listContact.add(c);
      }
      return listContact;
    } else {
      throw Exception('Erro ao recuperar os objetos.');
    }
  }

  Future<Frequencia> inserir(Frequencia contact) async {
    final res = await http.post(Uri.parse('$uri/frequencia'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(contact.toMap()));
    return Frequencia();
  }

  Future<int> alterar(Frequencia obj) async {
    final res = await http.put(Uri.parse('$uri/frequencia'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(obj.toMap()));
    return 0;
  }

  Future<int> excluir(String idDel) async {
    final res = await http.delete(Uri.parse('$uri/frequencia/$idDel'));
    return 0;
  }

  Future<Frequencia?> getObjeto(String idFind) async {
    final res = await http.get(Uri.parse('$uri/frequencia/$idFind'));
    if (res.statusCode == 200) {
      Frequencia c = Frequencia.fromMap(jsonDecode(res.body));
      return c;
    } else {
      throw Exception('Erro ao recuperar o objeto.');
    }
  }
}
