import 'package:first_app/shared/components/task_item.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool? completed = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) => {},
      builder: (BuildContext context, AppStates state) {
        AppCubit appCubit = AppCubit.get(context);
        return ListView.builder(
          itemBuilder: (context, index) => TaskItem(
              completed: appCubit.getTask(index).status == 'done',
              name: appCubit.getTask(index).name,
              onChange: (checked) {
                setState(
                  () {
                    appCubit.getTask(index).status =
                        checked == true ? 'done' : 'todo';
                  },
                );
              },
              onDeletePressed: () {
                appCubit.deleteTask(appCubit.getTask(index).id ?? 0);
              }),
          itemCount: appCubit.tasks.length,
        );
      },
    );
  }
}
