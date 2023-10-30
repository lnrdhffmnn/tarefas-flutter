import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefas_flutter/models/tarefa.dart';
import 'package:tarefas_flutter/providers/tarefas_provider.dart';

class TarefaTile extends StatelessWidget {
  final Tarefa tarefa;

  const TarefaTile({
    super.key,
    required this.tarefa,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: tarefa.completed,
          onChanged: (value) {
            tarefa.completed = value!;
            Provider.of<TarefasProvider>(context, listen: false).update(tarefa);
          },
        ),
        title: Text(tarefa.title),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {
            Provider.of<TarefasProvider>(context, listen: false).remove(tarefa);
          },
        ),
      ),
    );
  }
}
