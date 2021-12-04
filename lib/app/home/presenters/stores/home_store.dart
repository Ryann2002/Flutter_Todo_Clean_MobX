import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/app/home/domain/entities/todo_entity.dart';
import '../../domain/usecases/load_data.dart';
import '../../domain/usecases/save.dart';
import '../../domain/usecases/delete_data.dart';
import '../../infra/models/todo_model.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ILoadData loadData;
  final ISaveTodo saveTodo;
  final IDeleteTodo deleteTodo;
  @observable
  ObservableStream<List<TodoEntity>>? todoList;

  @action
  getTodoList() {
    todoList = loadData.loadData().asObservable();
  }

  @action
  save({DocumentReference? reference, required TodoModel model}) async {
    await saveTodo.save(reference, model);
  }

  @action
  delete(DocumentReference reference) async {
    await deleteTodo.deleteTodo(reference);
  }

  HomeStoreBase({
    required this.loadData,
    required this.saveTodo,
    required this.deleteTodo,
  }) {
    getTodoList();
  }
}
