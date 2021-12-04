import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/app/home/domain/entities/todo_entity.dart';

abstract class IDataSource {
  Stream<List<TodoEntity>> getTodos();
  Future add(TodoEntity model);
  Future update(DocumentReference reference, TodoEntity model);
  Future delete(DocumentReference reference);
}
