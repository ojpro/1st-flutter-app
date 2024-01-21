import 'package:first_app/models/migrations/task.dart';
import 'package:first_app/shared/components/task_builder.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneScreen extends StatelessWidget {
  bool? completed = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext buildContext, AppStates state) => {},
      builder: (BuildContext buildContext, AppStates state) {
        AppCubit appCubit = AppCubit.get(buildContext);
        List<Task> tasks = appCubit.doneTasks;
        return TaskBuilder(tasks: tasks);
      },
    );
  }
}
