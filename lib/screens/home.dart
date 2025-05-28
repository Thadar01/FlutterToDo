import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        color: Colors.grey[300],
        child: Column(
          children: <Widget>[
            SearchBar(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top:50,bottom: 20),
                    child: Text('All ToDos',style: TextStyle(
                      fontSize: 30
                    ),),
                  ),
                  ToDoItem()
                ],
              ),
            )
          ],
        ),
      ),
    );
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
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:15 ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
          prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
          border:InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey[500])
        ),
      ),
    );
  }
}
