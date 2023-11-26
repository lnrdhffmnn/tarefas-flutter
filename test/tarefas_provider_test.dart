import 'package:tarefas_flutter/models/tarefa.dart';
import 'package:tarefas_flutter/providers/tarefas_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TarefasProvider tarefasProvider;

  setUp(() {
    tarefasProvider = TarefasProvider();
  });

  test('Lista de tarefas deve iniciar vazia', () {
    expect(tarefasProvider.tarefas, List<Tarefa>.empty());
  });

  test('Deve incluir uma nova tarefa', () {
    String title = 'Olá';
    tarefasProvider.add(Tarefa(title: title));
    expect(tarefasProvider.tarefas.length, 1);
    expect(tarefasProvider.tarefas[0].title, title);
  });

  test('Deve atualizar o status da tarefa', () {
    Tarefa tarefa = Tarefa(title: 'Olá');
    tarefasProvider.add(tarefa);
    expect(tarefasProvider.tarefas.length, 1);
    expect(tarefasProvider.tarefas[0].completed, false);
    tarefa.completed = true;
    tarefasProvider.update(tarefa);
    expect(tarefasProvider.tarefas[0].completed, true);
  });

  test('Deve remover uma tarefa', () {
    Tarefa tarefa = Tarefa(title: 'Olá');
    tarefasProvider.add(tarefa);
    expect(tarefasProvider.tarefas.length, 1);
    tarefasProvider.remove(tarefa);
    expect(tarefasProvider.tarefas, isEmpty);
  });
}
