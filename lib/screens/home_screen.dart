import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Helper widget to create a section with a header, description and a list of actions.
  Widget _buildSection({
    required String title,
    required String description,
    required List<Widget> actions,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          // Section Description
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 12),
          // Actions, displayed using Wrap to allow line breaks.
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: actions,
          ),
        ],
      ),
    );
  }

  // Drawer widget to provide lateral navigation to additional sections.
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: Center(
                child: Text(
                  'Outras Seções',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: () {
                // Navegar para a tela "Sobre"
                Navigator.pushNamed(context, '/sobre');
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Eventos'),
              onTap: () {
                // Navegar para a tela de "Eventos"
                Navigator.pushNamed(context, '/eventos');
              },
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Doações'),
              onTap: () {
                // Navegar para a tela de "Doações"
                Navigator.pushNamed(context, '/doacoes');
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_support),
              title: const Text('Suporte'),
              onTap: () {
                // Navegar para a tela de "Suporte"
                Navigator.pushNamed(context, '/suporte');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Unified button style with a yellow (amber) and white theme.
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      backgroundColor: Colors.white, // Button background
      foregroundColor: Colors.amber, // Text and icon color
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Viver Solidário'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      drawer: _buildDrawer(context),
      body: Container(
        // Using a subtle gradient from white to a light yellow.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xfffff9c4)], // white to light yellow
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 20),
            // Welcome message – always visible at the top.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Faça parte desta história de amor ao próximo! Para apoiar a Viver e as crianças e adolescentes beneficiados pela instituição, escolha uma das opções abaixo:',
                style: TextStyle(fontSize: 18, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(height: 30, thickness: 1.2),
            // Section: Pix Donation
            _buildSection(
              title: 'Fazer um Pix para a Viver',
              description:
                  'O Pix é uma forma rápida de ajudar a Viver em suas demandas financeiras. Clique no botão para copiar a chave e ajudar agora mesmo!',
              actions: [
                ElevatedButton.icon(
                  style: buttonStyle,
                  onPressed: () {
                    // Ação para copiar a chave Pix
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Chave Pix copiada!')),
                    );
                  },
                  icon: const Icon(Icons.qr_code, color: Colors.amber),
                  label: const Text('Copiar chave'),
                ),
              ],
            ),
            const Divider(height: 30, thickness: 1.2),
            // Section: Online Donation
            _buildSection(
              title: 'Doação Online',
              description:
                  'Doe de forma prática: clique no botão para informar o valor que deseja doar e faça a sua contribuição pelo app.',
              actions: [
                ElevatedButton.icon(
                  style: buttonStyle,
                  onPressed: () {
                    Navigator.pushNamed(context, '/doacoes');
                  },
                  icon: const Icon(Icons.payment, color: Colors.amber),
                  label: const Text('Doe Agora'),
                ),
              ],
            ),
            const Divider(height: 30, thickness: 1.2),
            // Section: Other Methods
            _buildSection(
              title: 'Outras Formas de Doação',
              description:
                  'Você pode também colaborar pelo Paypal ou PicPay. Escolha a opção que for melhor para você.',
              actions: [
                ElevatedButton.icon(
                  style: buttonStyle,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Redirecionando para o Paypal...')),
                    );
                  },
                  icon: const Icon(Icons.account_balance_wallet, color: Colors.amber),
                  label: const Text('Paypal'),
                ),
                ElevatedButton.icon(
                  style: buttonStyle,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Redirecionando para o PicPay...')),
                    );
                  },
                  icon: const Icon(Icons.mobile_screen_share, color: Colors.amber),
                  label: const Text('PicPay'),
                ),
              ],
            ),
            const Divider(height: 30, thickness: 1.2),
            // Section: Luz e Carnê Solidário
            _buildSection(
              title: 'Doação via Conta de Luz ou Carnê Solidário',
              description:
                  'Apoie a Viver com doações recorrentes a partir de R\$ 15,00 mensais. Deixe seus dados e entraremos em contato!',
              actions: [
                ElevatedButton.icon(
                  style: buttonStyle,
                  onPressed: () {
                    Navigator.pushNamed(context, '/contato');
                  },
                  icon: const Icon(Icons.contact_mail, color: Colors.amber),
                  label: const Text('Enviar dados'),
                ),
              ],
            ),
            const Divider(height: 30, thickness: 1.2),
            // Section: Outros Tipos de Doação
            _buildSection(
              title: 'Doar Produtos e Serviços',
              description:
                  'A Viver precisa de produtos e serviços para seu dia a dia. Entre em contato para fazer a diferença!',
              actions: [
                ElevatedButton.icon(
                  style: buttonStyle,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Entre em contato com a Viver!')),
                    );
                  },
                  icon: const Icon(Icons.handshake, color: Colors.amber),
                  label: const Text('Contate-nos'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // WhatsApp Bottom Call-to-Action
            Center(
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Abrindo WhatsApp...')),
                  );
                },
                child: const Text(
                  'Fale com a Viver pelo WhatsApp',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.amber,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}