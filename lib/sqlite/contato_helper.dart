import 'dart:async';

import 'package:app_aula_oficial/model/contato.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContatoHelper {
  static final ContatoHelper _instance = ContatoHelper.internal();
  factory ContatoHelper() => _instance;
  ContatoHelper.internal();
  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDb();
      return _db!;
    }
  }

  Future<Database> initDb() async {
    final path = join(await getDatabasesPath(), "contatos_base.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newVers) async {
      await db.execute("CREATE TABLE contato(id TEXT PRIMARY KEY, " +
          "nome TEXT, email TEXT, telefone TEXT)");
    });
  }

  Future<List<Contato>> obterTodos() async {
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery("SELECT * FROM contato");
    List<Contato> listContact = List.empty(growable: true);
    for (Map<String, dynamic> m in listMap) {
      Contato c = Contato.fromMap(m);
      listContact.add(c);
    }
    return listContact;
  }

  Future<Contato> inserir(Contato contact) async {
    Database dbContact = await db;
    int? idNew = Sqflite.firstIntValue(
        await dbContact.rawQuery("SELECT MAX(id) FROM contato"));
    if (idNew == null) {
      idNew = 1;
    } else {
      idNew = idNew + 1;
    }
    contact.id = idNew.toString();
    await dbContact.insert('contato', contact.toMap());
    return contact;
  }

  Future<int> alterar(Contato obj) async {
    Database dbContact = await db;
    return await dbContact
        .update('contato', obj.toMap(), where: "id = ?", whereArgs: [obj.id]);
  }

  Future<int> excluir(String idDel) async {
    Database dbContact = await db;
    return await dbContact
        .delete('contato', where: "id = ?", whereArgs: [idDel]);
  }

  Future<Contato?> getObjeto(String idFind) async {
    Database dbContact = await db;
    List<Map<String, dynamic>> maps = await dbContact.query('contato',
        columns: ['id', 'nome'], where: "id = ?", whereArgs: [idFind]);
    if (maps.isNotEmpty) {
      return Contato.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int?> getNumber() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(
        await dbContact.rawQuery("SELECT COUNT(*) FROM contato"));
  }

  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }
}
