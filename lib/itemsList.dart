import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

import 'item.dart';

class ItemsList extends StatefulWidget {
  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  final _todoList = <Item>[];
  final _itemFont = TextStyle(fontSize: 18.0);
  void _itemView(Item item) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Placeholder Name'),
        ),
        body: CalendarCarousel(
          onDayLongPressed: (DateTime date) {
            this.setState(() => item.date = date);
          },
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        actions: [
          IconButton(icon: Icon(Icons.check), onPressed: _itemView(null))
        ],
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _itemView(new Item("bob", 1, date)),
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
        _itemView();
      },
    );
  }
}

//todo:
//when an item is pressed, open item view
//header is item name, page is the saved data
//on finish, update the date, on cancel, save no
//changes but keep the object

//when add item is pressed, create a new item with
//default data, add it to the list of items and
//open it like a regular item. Any changes update
//the item like they would normally do
//cancelling the item removes it from the stack

//look at how to pass data to a new view
//should I use the item.dart object to render the view?
