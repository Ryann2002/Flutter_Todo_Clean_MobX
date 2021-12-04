// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$todoListAtom = Atom(name: 'HomeStoreBase.todoList');

  @override
  ObservableStream<List<TodoEntity>>? get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(ObservableStream<List<TodoEntity>>? value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  final _$saveAsyncAction = AsyncAction('HomeStoreBase.save');

  @override
  Future save(
      {DocumentReference<Object?>? reference, required TodoModel model}) {
    return _$saveAsyncAction
        .run(() => super.save(reference: reference, model: model));
  }

  final _$deleteAsyncAction = AsyncAction('HomeStoreBase.delete');

  @override
  Future delete(DocumentReference<Object?> reference) {
    return _$deleteAsyncAction.run(() => super.delete(reference));
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic getTodoList() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.getTodoList');
    try {
      return super.getTodoList();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todoList: ${todoList}
    ''';
  }
}
