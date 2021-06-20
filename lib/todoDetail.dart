import 'package:flutter/material.dart';

class ToDoDetail extends StatelessWidget {
  String title;
  String content;
  String isDone;
  ToDoDetail(this.title, this.content, this.isDone);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text('ToDo Detaylari'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                title,
                style: TextStyle(
                  color: isDone == 'true' ? Colors.green : Colors.red,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                content,
                style: TextStyle(
                  color: isDone == 'true' ? Colors.green : Colors.red,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          isDone == 'true'
              ? Icon(
                  Icons.done,
                  color: Colors.green,
                  size: 300,
                )
              : Icon(
                  Icons.cancel_sharp,
                  color: Colors.red,
                  size: 300,
                ),
        ],
      ),
    );
  }
}
