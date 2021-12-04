import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/app/home/domain/entities/todo_entity.dart';
import 'package:flutter_todo/app/home/infra/external/data_interface.dart';
import 'package:flutter_todo/app/home/infra/models/todo_model.dart';

class FirebaseDataSource implements IDataSource {
  final FirebaseFirestore dataSource;

  FirebaseDataSource(this.dataSource);
  @override
  Stream<List<TodoEntity>> getTodos() {
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
    return await dataSource.collection('todo').add({
      'title': model.title,
      'check': model.check,
      'descricao': model.descricao,
      'time': DateTime.now()
    });
  }

  @override
  Future update(DocumentReference reference, TodoEntity model) async {
    return await reference.update({
      'title': model.title,
      'check': model.check,
      'descricao': model.descricao,
    });
  }

  @override
  Future delete(DocumentReference<Object?> reference) async {
    await reference.delete();
  }
}
