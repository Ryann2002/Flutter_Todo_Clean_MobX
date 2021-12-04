import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/app/home/infra/external/data_interface.dart';

import '../../domain/repository/todo_repository_interface.dart';
import '../models/todo_model.dart';
import '../../domain/entities/todo_entity.dart';

class TodoRepository implements ITodoRepository {
  final IDataSource dataSource;

  TodoRepository(this.dataSource);

  @override
  Stream<List<TodoEntity>> getTodos() {
    return dataSource.getTodos();
  }

  @override
  Future add(TodoEntity model) async {
    return dataSource.add(model);
  }

  @override
  Future update(DocumentReference reference, TodoEntity model) async {
    return dataSource.update(reference, model);
  }

  @override
  Future delete(DocumentReference<Object?> reference) async {
    await dataSource.delete(reference);
  }
}
