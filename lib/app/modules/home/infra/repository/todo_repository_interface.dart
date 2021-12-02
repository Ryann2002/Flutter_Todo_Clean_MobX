import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/app/modules/home/domain/entities/todo_entity.dart';
import 'package:flutter_todo/app/modules/home/infra/models/todo_model.dart';

abstract class ITodoRepository {
  Stream<List<TodoModel>> getTodos();
  Future add(TodoEntity model);
  Future update(DocumentReference reference, TodoEntity model);
  Future delete(DocumentReference reference);
}
