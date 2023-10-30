import 'package:uuid/uuid.dart';

class Tarefa {
  final String id = const Uuid().v4();
  final String title;
  bool completed = false;

  Tarefa({
    required this.title,
  });
}
