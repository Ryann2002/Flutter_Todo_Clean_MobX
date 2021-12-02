import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/app/modules/home/infra/repository/todo_repository_interface.dart';

abstract class IDeleteTodo {
  Future deleteTodo(DocumentReference reference);
}

class DeleteTodoImpl implements IDeleteTodo {
  final ITodoRepository repository;
  DeleteTodoImpl(this.repository);
  @override
  Future deleteTodo(DocumentReference reference) async {
    await repository.delete(reference);
  }
}
