import 'package:cloud_firestore/cloud_firestore.dart';
import '../entities/todo_entity.dart';

abstract class ITodoRepository {
  Stream<List<TodoEntity>> getTodos();
  Future add(TodoEntity model);
  Future update(DocumentReference reference, TodoEntity model);
  Future delete(DocumentReference reference);
}
