import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/app/modules/home/domain/entities/todo_entity.dart';
import 'package:flutter_todo/app/modules/home/repository/todo_repository_interface.dart';

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
