import 'package:flutter/material.dart';
import 'HomeScreen.dart';

void main() {
  runApp(const ViverSolidarioApp());
}

class ViverSolidarioApp extends StatelessWidget {
  const ViverSolidarioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viver Solidário',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontFamily: 'Poppins'),
          bodyText2: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontFamily: 'Poppins'),
          bodyText2: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/doacoes': (context) => const Scaffold(
              appBar: AppBar(title: Text('Doações')),
              body: Center(child: Text('Tela de Doações')),
            ),
        '/contato': (context) => const Scaffold(
              appBar: AppBar(title: Text('Contato')),
              body: Center(
                  child: Text(
                      'Tela de Contato para doação via Conta de Luz ou Carnê Solidário')),
            ),
        // Additional routes for the Drawer sections:
        '/sobre': (context) => const Scaffold(
              appBar: AppBar(title: Text('Sobre')),
              body: Center(child: Text('Tela Sobre a Viver Solidário')),
            ),
        '/eventos': (context) => const Scaffold(
              appBar: AppBar(title: Text('Eventos')),
              body: Center(child: Text('Tela de Eventos')),
            ),
        '/suporte': (context) => const Scaffold(
              appBar: AppBar(title: Text('Suporte')),
              body: Center(child: Text('Tela de Suporte')),
            ),
      },
    );
  }
}