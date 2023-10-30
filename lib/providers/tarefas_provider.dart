import 'package:flutter/material.dart';
import 'package:tarefas_flutter/models/tarefa.dart';

class TarefasProvider with ChangeNotifier {
  final List<Tarefa> tarefas = [];

  void add(Tarefa tarefa) {
    tarefas.add(tarefa);
    notifyListeners();
  }

  void remove(Tarefa tarefa) {
    tarefas.remove(tarefa);
    notifyListeners();
  }

  void update(Tarefa tarefa) {
    tarefas[tarefas.indexWhere((element) => element.id == tarefa.id)] = tarefa;
    notifyListeners();
  }
}
