import 'package:first_app/models/migrations/task.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/task_builder.dart';

class TodoScreen extends StatelessWidget {
  bool? completed = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext buildContext, AppStates state) => {},
      builder: (BuildContext buildContext, AppStates state) {
        AppCubit appCubit = AppCubit.get(buildContext);
        List<Task> tasks = appCubit.todoTasks;
        return TaskBuilder(tasks: tasks);
      },
    );
  }
}
