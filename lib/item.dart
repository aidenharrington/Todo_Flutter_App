import 'package:flutter/material.dart';

class Item {
  String name;
  int priority;
  DateTime date;

  Item(String name, int priority, DateTime date) {
    this.name = name;
    this.priority = priority;
    this.date = date;
  }
}

class _ItemView extends StatefulWidget {
  @override
  __ItemViewState createState() => __ItemViewState();
}

class __ItemViewState extends State<_ItemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Item"),
      ),
    );
  }
}
