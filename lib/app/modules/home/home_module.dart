import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_todo/app/modules/home/domain/usecases/delete_data.dart';
import 'package:flutter_todo/app/modules/home/domain/usecases/load_data.dart';
import 'package:flutter_todo/app/modules/home/domain/usecases/save.dart';
import '../home/home_store.dart';
import 'home_page.dart';
import 'infra/repository/todo_repository.dart';
import 'infra/repository/todo_repository_interface.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) =>
        HomeStore(loadData: i.get(), saveTodo: i.get(), deleteTodo: i.get())),
    Bind((i) => SaveTodoImpl(i.get())),
    Bind((i) => LoadDataImpl(i.get())),
    Bind((i) => DeleteTodoImpl(i.get())),
    Bind<ITodoRepository>((i) => TodoRepository(FirebaseFirestore.instance))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
