import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/todoAdd.dart';
import 'package:todo_list/todoDetail.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  List<String> todoTitles = [];
  List<String> todoContents = [];
  List<String> todoIsDone = [];
  getDatas() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      todoTitles = sp.getStringList('todoTitles');
      todoContents = sp.getStringList('todoContents');
      todoIsDone = sp.getStringList('todoIsDone');
      if (todoTitles == null) {
        todoTitles = [];
        todoContents = [];
        todoIsDone = [];
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[900],
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TodoAdd(),
            ),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text('ToDo List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              getDatas();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todoTitles.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ToDoDetail(todoTitles[index],
                            todoContents[index], todoIsDone[index])));
              },
              title: Text(todoTitles[index]),
              subtitle: Text(todoContents[index].split(' ')[0] + '...'),
              trailing: GestureDetector(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  setState(() {
                    if (todoIsDone[index] == 'true') {
                      todoIsDone[index] = 'false';
                    } else {
                      todoIsDone[index] = 'true';
                    }
                  });
                  sp.setStringList('todoIsDone', todoIsDone);
                },
                child: Card(
                  child: Icon(
                    todoIsDone[index] == 'true'
                        ? Icons.done
                        : Icons.cancel_sharp,
                    color:
                        todoIsDone[index] == 'true' ? Colors.green : Colors.red,
                    size: 30,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
