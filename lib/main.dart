import 'package:flutter/material.dart';
import 'package:viversolidario/screens/home_screen.dart';
import 'package:viversolidario/screens/doacoes_screen.dart';
import 'package:viversolidario/screens/cadastro_screen.dart';
import 'package:viversolidario/screens/login_screen.dart';
import 'package:viversolidario/screens/recuperar_senha_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/doacoes': (context) => const DoacoesScreen(),
        '/cadastro': (context) => const CadastroScreen(),
        '/login': (context) => const LoginScreen(),
        '/recuperar-senha': (context) => const RecuperarSenhaScreen(),
      },
    );
  }
}