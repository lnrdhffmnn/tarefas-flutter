import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:tarefas_flutter/components/tarefa_tile.dart';
import 'package:tarefas_flutter/models/tarefa.dart';
import 'package:tarefas_flutter/providers/tarefas_provider.dart';
import 'package:tarefas_flutter/screens/home_screen.dart';
import 'tarefas_screen_test.mocks.dart';

@GenerateMocks([TarefasProvider])
void main() {
  testWidgets('Lista de tarefas deve iniciar vazia', (widgetTester) async {
    final MockTarefasProvider tarefasProvider = MockTarefasProvider();
    when(tarefasProvider.tarefas).thenReturn([]);

    final Widget app = MultiProvider(
      providers: [
        ChangeNotifierProvider<TarefasProvider>(
            create: (context) => tarefasProvider),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
    await widgetTester.pumpWidget(app);

    expect(find.text('Nenhuma tarefa encontrada.'), findsOne);
  });

  testWidgets('Deve exibir uma tarefa', (widgetTester) async {
    final MockTarefasProvider tarefasProvider = MockTarefasProvider();
    const String title = 'Teste';
    when(tarefasProvider.tarefas).thenReturn([Tarefa(title: title)]);

    final Widget app = MultiProvider(
      providers: [
        ChangeNotifierProvider<TarefasProvider>(
            create: (context) => tarefasProvider),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
    await widgetTester.pumpWidget(app);

    expect(find.byType(TarefaTile), findsOne);
    expect(find.text(title), findsOne);
  });

  testWidgets(
    'O campo deve ser limpo após adicionar uma tarefa',
    (widgetTester) async {
      final MockTarefasProvider tarefasProvider = MockTarefasProvider();
      when(tarefasProvider.tarefas).thenReturn([]);

      final Widget app = MultiProvider(
        providers: [
          ChangeNotifierProvider<TarefasProvider>(
            create: (context) => tarefasProvider,
          ),
        ],
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      );
      await widgetTester.pumpWidget(app);

      await widgetTester.enterText(find.byType(TextFormField), 'Teste');
      await widgetTester.tap(find.byIcon(Icons.add));
      await widgetTester.pump();

      expect(find.text('Teste'), findsNothing);
    },
  );
}
