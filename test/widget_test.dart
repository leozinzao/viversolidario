import 'package:flutter_test/flutter_test.dart';
import 'package:viversolidario/main.dart';

void main() {
  testWidgets('Teste inicial do aplicativo', (WidgetTester tester) async {
    await tester.pumpWidget(const ViverSolidarioApp());
    // Adicione mais testes aqui
  });
}