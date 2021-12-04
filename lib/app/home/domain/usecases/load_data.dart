import 'package:flutter_todo/app/home/domain/entities/todo_entity.dart';
import '../repository/todo_repository_interface.dart';

abstract class ILoadData {
  Stream<List<TodoEntity>> loadData();
}

class LoadDataImpl implements ILoadData {
  final ITodoRepository repository;

  LoadDataImpl(this.repository);
  @override
  Stream<List<TodoEntity>> loadData() {
    return repository.getTodos();
  }
}
