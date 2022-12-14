import 'package:app_aula_oficial/api/frequencias_list_page.dart';
import 'package:app_aula_oficial/pages/home.dart';
import 'package:app_aula_oficial/pages/tutorial.dart';
import 'package:app_aula_oficial/sqlite/frequencias_list_page.dart'
    as frequencias_list_page_sqlite;
import 'package:app_aula_oficial/api/frequencias_list_page.dart'
    as frequencias_list_page_api;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/tutorial': (context) => const TutorialPage(),
        '/frequenciasSqLite': (context) =>
            const frequencias_list_page_sqlite.FrequenciasListPage(
                title: 'Frequências SQLite'),
        '/frequenciasApi': (context) =>
            const frequencias_list_page_api.FrequenciasListPage(
                title: 'Frequências API'),
      },
    );
  }
}
