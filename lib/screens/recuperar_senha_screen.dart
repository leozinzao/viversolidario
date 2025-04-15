import 'package:flutter/material.dart';

class RecuperarSenhaScreen extends StatelessWidget {
  const RecuperarSenhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Digite seu e-mail para recuperar a senha',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para envio de e-mail aqui
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Link de recuperação enviado!')),
                );
              },
              child: const Text('Enviar'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navegar de volta para a tela de login
                Navigator.pop(context);
              },
              child: const Text('Voltar para Login'),
            ),
          ],
        ),
      ),
    );
  }
}