import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/app/modules/home/domain/usecases/delete_data.dart';
import 'package:flutter_todo/app/modules/home/domain/usecases/load_data.dart';
import 'package:flutter_todo/app/modules/home/domain/usecases/save.dart';

import 'package:mobx/mobx.dart';

import 'models/todo_model.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ILoadData loadData;
  final ISaveTodo saveTodo;
  final DeleteTodoImpl deleteTodo;
  @observable
  ObservableStream<List<TodoModel>>? todoList;

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
