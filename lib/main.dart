import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefas_flutter/providers/tarefas_provider.dart';
import 'package:tarefas_flutter/screens/home_screen.dart';

void main() {
  runApp(
    const App(title: 'Tarefas'),
  );
}

class App extends StatelessWidget {
  final String title;

  const App({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TarefasProvider(),
        ),
      ],
      child: MaterialApp(
        title: title,
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: HomeScreen(title: title),
      ),
    );
  }
}
