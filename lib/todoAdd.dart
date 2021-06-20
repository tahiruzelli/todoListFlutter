import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoAdd extends StatelessWidget {
  TextEditingController titleControler = TextEditingController();
  TextEditingController contentController = TextEditingController();
  todoAdd() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> todoTitles = [];
    List<String> todoContens = [];
    List<String> todoIsDone = [];
    todoTitles = sp.getStringList('todoTitles');
    todoContens = sp.getStringList('todoContents');
    todoIsDone = sp.getStringList('todoIsDone');
    if (todoTitles == null) {
      todoTitles = [];
    }
    if (todoContens == null) {
      todoContens = [];
    }
    if (todoIsDone == null) {
      todoIsDone = [];
    }

    todoIsDone.add('false');
    todoTitles.add(titleControler.text);
    todoContens.add(contentController.text);

    sp.setStringList(
      'todoTitles',
      todoTitles,
    );
    sp.setStringList(
      'todoContents',
      todoContens,
    );
    sp.setStringList('todoIsDone', todoIsDone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[900],
        child: Icon(Icons.done),
        onPressed: () {
          if (titleControler.text != '' && contentController.text != '') {
            todoAdd();
            Navigator.pop(context);
          }
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text('ToDo Ekle'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: TextField(
              controller: titleControler,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                hintText: 'Baslik',
                labelText: 'Baslik',
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: TextField(
              controller: contentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                hintText: 'Icerik',
                labelText: 'Icerik',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
