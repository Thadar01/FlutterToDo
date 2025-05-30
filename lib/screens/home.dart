import 'package:flutter/material.dart';
import 'package:to_do_list/modal/todo.dart';
import 'package:to_do_list/widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todolist();
  final _todoController = TextEditingController();
  List<ToDo> _foundTodo = [];

  @override
  void initState() {
    _foundTodo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            color: Colors.grey[300],
            child: Column(
              children: <Widget>[
                SearchBar(runfilter: _runFilter,),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          'All ToDos',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      for (ToDo todo in _foundTodo.reversed)
                        ToDoItem(
                          todo: todo,
                          onTodoChange: _handleTodoChange,
                          onDeleteItem: _deleteTodoItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add new to do item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),

                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where(
            (item) => item.todoText.toLowerCase().contains(
              enteredKeyword.toLowerCase(),
            ),
          )
          .toList();
    }

    setState(() {
      _foundTodo=results;
    });
  }

  void _addToDoItem(String todo) {
    setState(() {
      todosList.add(
        ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          todoText: todo,
        ),
      );
    });

    _todoController.clear();
  }

  void _handleTodoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu, color: Colors.black, size: 30),
          CircleAvatar(backgroundImage: AssetImage('assets/images/giyu.jpg')),
        ],
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}

class SearchBar extends StatelessWidget {
  final runfilter;
  const SearchBar({super.key,this.runfilter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged:(value)=>runfilter(value) ,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
