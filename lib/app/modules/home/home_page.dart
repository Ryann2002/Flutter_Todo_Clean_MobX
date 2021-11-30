import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_todo/app/modules/home/home_store.dart';
import 'package:flutter_todo/app/modules/home/models/todo_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({this.title = "Home"});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Observer(
        builder: (_) {
          if (store.todoList!.hasError) {
            return Center(
              child: ElevatedButton(
                onPressed: () => store.getTodoList(),
                child: const Text("Recarregar List"),
              ),
            );
          }

          if (store.todoList!.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<TodoModel> todoList = store.todoList!.data;
          return ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (_, i) {
              TodoModel todo = todoList[i];
              return ListTile(
                onLongPress: () {
                  store.delete(todo.reference!);
                },
                onTap: () {
                  _showDialog(model: todo);
                },
                trailing: Checkbox(
                  checkColor: Colors.black87,
                  value: todo.check,
                  onChanged: (bool? check) {
                    todo.check = check!;
                    store.save(reference: todo.reference, model: todo);
                  },
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                      fontSize: 30.0,
                      decoration: todo.check
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  _showDialog({TodoModel? model}) {
    model ??= TodoModel();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(model!.title.isNotEmpty ? "Edição" : "Adicionar Novo"),
            content: TextFormField(
              initialValue: model.title,
              onChanged: (value) => model!.title = value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Titulo",
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Modular.to.pop();
                  },
                  child: const Text("Cancelar")),
              TextButton(
                onPressed: () {
                  Modular.to.pop();
                  store.save(reference: model!.reference, model: model);
                },
                child: Text(model.title.isEmpty ? "Adicionar Novo" : "Salvar"),
              )
            ],
          );
        });
  }
}
