import 'package:flutter_todo/app/modules/home/infra/models/todo_model.dart';
import 'package:flutter_todo/app/modules/home/infra/repository/todo_repository_interface.dart';

abstract class ILoadData {
  Stream<List<TodoModel>> loadData();
}

class LoadDataImpl implements ILoadData {
  final ITodoRepository repository;

  LoadDataImpl(this.repository);
  @override
  Stream<List<TodoModel>> loadData() {
    return repository.getTodos();
  }
}
