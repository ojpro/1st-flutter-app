import 'package:first_app/models/migrations/task.dart';
import 'package:first_app/shared/components/bottom_sheet.dart';
import 'package:first_app/shared/components/task_item.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  bool? completed = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext buildContext, AppStates state) => {},
      builder: (BuildContext buildContext, AppStates state) {
        AppCubit appCubit = AppCubit.get(buildContext);
        return ListView.builder(
          itemBuilder: (itemContext, index) {
            Task task = appCubit.getTask(index);

            return TaskItem(
              completed: task.status == 'done',
              name: task.name,
              onChange: (checked) {
                task.status = checked == true ? 'done' : 'todo';

                appCubit.updateTask(task);
              },
              onDeletePressed: () async {
                await appCubit.deleteTask(task.id ?? 0);
              },
              onEditPressed: () {
                print('edit');
              },
            );
          },
          itemCount: appCubit.tasks.length,
        );
      },
    );
  }
}
