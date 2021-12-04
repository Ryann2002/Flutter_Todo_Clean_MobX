import 'package:cloud_firestore/cloud_firestore.dart';
import '../repository/todo_repository_interface.dart';
import '../entities/todo_entity.dart';

abstract class ISaveTodo {
  Future save(DocumentReference? reference, TodoEntity todo);
}

class SaveTodoImpl implements ISaveTodo {
  final ITodoRepository repository;

  SaveTodoImpl(this.repository);
  @override
  Future save(DocumentReference? reference, TodoEntity todo) async {
    if (reference == null) {
      await repository.add(todo);
    } else {
      await repository.update(reference, todo);
    }
  }
}
