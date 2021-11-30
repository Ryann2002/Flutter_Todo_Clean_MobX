import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/app/modules/home/domain/entities/todo_entity.dart';
import 'package:flutter_todo/app/modules/home/models/todo_model.dart';
import 'package:flutter_todo/app/modules/home/repository/todo_repository_interface.dart';

class TodoRepository implements ITodoRepository {
  final FirebaseFirestore dataSource;

  TodoRepository(this.dataSource);

  @override
  Stream<List<TodoModel>> getTodos() {
    return dataSource
        .collection("todo")
        .orderBy('time')
        .snapshots()
        .map((QuerySnapshot query) {
      return query.docs.map((docs) {
        return TodoModel.fromDocs(docs);
      }).toList();
    });
  }

  @override
  Future add(TodoEntity model) async {
    return await FirebaseFirestore.instance.collection('todo').add(
        {'title': model.title, 'check': model.check, 'time': DateTime.now()});
  }

  @override
  Future update(DocumentReference reference, TodoEntity model) async {
    return await reference.update({
      'title': model.title,
      'check': model.check,
    });
  }

  @override
  Future delete(DocumentReference<Object?> reference) async {
    await reference.delete();
  }
}
