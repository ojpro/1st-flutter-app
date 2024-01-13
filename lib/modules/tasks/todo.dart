import 'package:first_app/shared/components/task_item.dart';
import 'package:first_app/shared/constants.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool? completed = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TaskItem(
          completed: tasks[index].status == 'done',
          name: tasks[index].name,
          onChange: (checked) {
            setState(
              () {
                tasks[index].status = checked == true ? 'done' : 'todo';
              },
            );
          },
      onDeletePressed: (){
            print(index);
      }),
      itemCount: tasks.length,
    );
  }
}
