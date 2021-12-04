import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/app/home/domain/repository/todo_repository_interface.dart';
import 'package:flutter_todo/app/home/domain/usecases/delete_data.dart';
import 'package:flutter_todo/app/home/domain/usecases/load_data.dart';
import 'package:flutter_todo/app/home/domain/usecases/save.dart';
import 'package:flutter_todo/app/home/infra/repository/todo_repository.dart';

import 'package:get_it/get_it.dart';

import 'app/home/presenters/stores/home_store.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //!Stores
  sl.registerFactory<HomeStore>(() => HomeStore(
        loadData: sl(),
        deleteTodo: sl(),
        saveTodo: sl(),
      ));

  //!Use Cases
  sl.registerLazySingleton<ISaveTodo>(() => SaveTodoImpl(sl()));
  sl.registerLazySingleton<IDeleteTodo>(() => DeleteTodoImpl(sl()));
  sl.registerLazySingleton<ILoadData>(() => LoadDataImpl(sl()));

  //! Repository
  sl.registerLazySingleton<ITodoRepository>(() => TodoRepository(sl()));

  //! Data Sources
  final firestoreInstance = FirebaseFirestore.instance;
  sl.registerLazySingleton<FirebaseFirestore>(() => firestoreInstance);
}
