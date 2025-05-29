import 'package:flutter/material.dart';
import 'package:to_do_list/modal/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onTodoChange;
  final onDeleteItem;
  const ToDoItem({super.key,required this.todo,required this.onTodoChange,required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () {
          onTodoChange(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading: Icon(todo.isDone?Icons.check_box : Icons.check_box_outline_blank, color: Colors.blue[400]),
        tileColor: Colors.white,
        title: Text(
          todo.todoText,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            // <--- Add Center here
            child: IconButton(
              onPressed: () {
               onDeleteItem(todo.id);
              },
              icon: Icon(Icons.delete),
              iconSize: 17,
              color: Colors.white,
              padding: EdgeInsets.zero, // <--- Remove default padding
              constraints: BoxConstraints(), // <--- Remove default constraints
            ),
          ),
        ),
      ),
    );
  }
}
