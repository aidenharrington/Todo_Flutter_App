import 'package:flutter/material.dart';

import 'item.dart';

class ItemsList extends StatefulWidget {
  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  final _todoList = <Item>[];
  final _itemFont = TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        actions: [
          IconButton(icon: Icon(Icons.check), onPressed: null),
        ],
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: null, //navigate to item view
        tooltip: "Add new item",
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: _todoList.length * 2,
        itemBuilder: (context, i) {
          if (_todoList.isEmpty) return Divider();
          if (i.isOdd) return Divider();

          final index = i ~/ 2;

          return _buildRow(_todoList[index]);
        });
  }

  Widget _buildRow(Item item) {
    return ListTile(
      title: Text(
        item.name,
        style: _itemFont,
      ),
      trailing: Icon(Icons.check),
      onTap: () {
        //navigate to that view
      },
    );
  }
}
