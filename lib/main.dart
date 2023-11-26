import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefas_flutter/providers/tarefas_provider.dart';
import 'package:tarefas_flutter/screens/home_screen.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TarefasProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
