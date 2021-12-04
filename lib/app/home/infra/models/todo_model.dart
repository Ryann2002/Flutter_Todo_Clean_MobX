import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  DocumentReference? reference;

  TodoModel({
    bool check = false,
    String title = '',
    String description = '',
    this.reference,
  }) : super(
          title: title,
          check: check,
          descricao: description,
        );

  factory TodoModel.fromDocs(QueryDocumentSnapshot doc) {
    return TodoModel(
      check: doc['check'],
      title: doc['title'],
      description: doc['descricao'],
      reference: doc.reference,
    );
  }
}
