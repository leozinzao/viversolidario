import 'package:flutter/material.dart';

class DoacoesScreen extends StatefulWidget {
  const DoacoesScreen({Key? key}) : super(key: key);

  @override
  _DoacoesScreenState createState() => _DoacoesScreenState();
}

class _DoacoesScreenState extends State<DoacoesScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _mensagemController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _valorController.dispose();
    _mensagemController.dispose();
    super.dispose();
  }

  void _enviarDoacao() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simular processamento (ex.: enviar para API)
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Mostrar feedback
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Obrigado!'),
          content: const Text('Sua doação foi enviada com sucesso.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _limparCampos();
              },
              child: const Text('Fechar'),
            )
          ],
        ),
      );
    }
  }

  void _limparCampos() {
    _nomeController.clear();
    _emailController.clear();
    _valorController.clear();
    _mensagemController.clear();
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doações'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Faça sua doação',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _nomeController,
                label: 'Nome',
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Informe seu nome' : null,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe seu email';
                  }
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Informe um email válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _valorController,
                label: 'Valor da Doação',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o valor';
                  }
                  final double? valor = double.tryParse(value);
                  if (valor == null || valor <= 0) {
                    return 'Informe um valor válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _mensagemController,
                label: 'Mensagem (opcional)',
                maxLines: 3,
              ),
              const SizedBox(height: 30),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _enviarDoacao,
                      child: const Text('Doar'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}