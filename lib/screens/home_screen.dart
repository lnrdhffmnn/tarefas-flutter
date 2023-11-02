import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefas_flutter/components/tarefa_tile.dart';
import 'package:tarefas_flutter/models/tarefa.dart';
import 'package:tarefas_flutter/providers/tarefas_provider.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({
    super.key,
    required this.title,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void addTarefa() {
    String title = _titleController.text;
    if (title.isEmpty) return;
    Provider.of<TarefasProvider>(context, listen: false)
        .add(Tarefa(title: title));
    _titleController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Consumer<TarefasProvider>(
                builder: (context, tarefasProvider, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: tarefasProvider.tarefas.length,
                    itemBuilder: (context, index) {
                      Tarefa tarefa = tarefasProvider.tarefas[index];
                      return TarefaTile(tarefa: tarefa);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Digite algo..."),
                          contentPadding: EdgeInsets.all(10),
                        ),
                        onFieldSubmitted: (value) => addTarefa(),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton.filled(
                      padding: const EdgeInsets.all(10),
                      icon: const Icon(Icons.add),
                      onPressed: addTarefa,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
