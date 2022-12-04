import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Frequência'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Zona de Frequência',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Tutorial'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/tutorial');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_pin_outlined),
              title: const Text('Frequência SQLite'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/frequenciasSqLite');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_pin_outlined),
              title: const Text('Frequência  APi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/frequenciasApi');
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Paolo Bonez Piovezan  161692\n\n'
            'Vinicius Spanholo  160857'),
      ),
    );
  }
}
