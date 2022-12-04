import 'dart:async';

import 'package:app_aula_oficial/model/Frequencia.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FrequenciaHelper {
  static final FrequenciaHelper _instance = FrequenciaHelper.internal();
  factory FrequenciaHelper() => _instance;
  FrequenciaHelper.internal();
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
    final path = join(await getDatabasesPath(), "Frequencias_base.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newVers) async {
      await db.execute("CREATE TABLE Frequencia(id TEXT PRIMARY KEY, " +
          "nome TEXT, idade TEXT, sexo TEXT)");
    });
  }

  Future<List<Frequencia>> obterTodos() async {
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery("SELECT * FROM Frequencia");
    List<Frequencia> listContact = List.empty(growable: true);
    for (Map<String, dynamic> m in listMap) {
      Frequencia c = Frequencia.fromMap(m);
      listContact.add(c);
    }
    return listContact;
  }

  Future<Frequencia> inserir(Frequencia contact) async {
    Database dbContact = await db;
    int? idNew = Sqflite.firstIntValue(
        await dbContact.rawQuery("SELECT MAX(id) FROM Frequencia"));
    if (idNew == null) {
      idNew = 1;
    } else {
      idNew = idNew + 1;
    }
    contact.id = idNew.toString();
    await dbContact.insert('Frequencia', contact.toMap());
    return contact;
  }

  Future<int> alterar(Frequencia obj) async {
    Database dbContact = await db;
    return await dbContact.update('Frequencia', obj.toMap(),
        where: "id = ?", whereArgs: [obj.id]);
  }

  Future<int> excluir(String idDel) async {
    Database dbContact = await db;
    return await dbContact
        .delete('Frequencia', where: "id = ?", whereArgs: [idDel]);
  }

  Future<Frequencia?> getObjeto(String idFind) async {
    Database dbContact = await db;
    List<Map<String, dynamic>> maps = await dbContact.query('Frequencia',
        columns: ['id', 'nome', 'idade', 'sexo'],
        where: "id = ?",
        whereArgs: [idFind]);
    if (maps.isNotEmpty) {
      return Frequencia.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int?> getNumber() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(
        await dbContact.rawQuery("SELECT COUNT(*) FROM Frequencia"));
  }

  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }
}
