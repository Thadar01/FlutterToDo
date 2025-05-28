import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        onTap: (){},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading:Icon(Icons.check_box,color:Colors.blue[400],),
        tileColor: Colors.white,
        title: Text('Check Main',style: TextStyle(fontSize: 16,color: Colors.black,decoration: TextDecoration.lineThrough),),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(onPressed: (){}, icon: Icon(Icons.delete),color: Colors.white,),
        ),
      ),
    
    );
  }
}