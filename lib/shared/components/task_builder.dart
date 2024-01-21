import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/shared/components/task_item.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

import '../../models/migrations/task.dart';
import 'bottom_sheet.dart';

Widget TaskBuilder({
  required List<Task> tasks,
}) => ConditionalBuilder(
  condition: tasks.isNotEmpty,
  builder: (BuildContext context) => ListView.separated(
    separatorBuilder: (BuildContext context, int index) =>
    const SizedBox(
      height: 6,
    ),
    itemBuilder: (itemContext, index) {
      AppCubit appCubit = AppCubit.get(context);
      Task task = tasks[index];
      return TaskItem(
        completed: task.status == 'done',
        name: task.name,
        onChange: (checked) {
          task.status = checked == true ? 'done' : 'todo';

          appCubit.updateTask(task);
        },
        onArchivePressed: () async {
          task.status = 'archived';

          appCubit.updateTask(task);
        },
        onDeletePressed: () async {
          await appCubit.deleteTask(task.id ?? 0);
        },
        onEditPressed: () {
          appCubit.setEditingTask(task);

          if (!appCubit.getCurrentBottomSheetState()) {
            appCubit.scaffoldKey.currentState
                ?.showBottomSheet(
                  (context) => BottomSheetComponent(),
            )
                .closed
                .then((value) {
              appCubit.changeBottomSheetState(false);
            });
            appCubit.changeBottomSheetState(true);
          }
        },
      );
    },
    itemCount: tasks.length,
  ),
  fallback: (BuildContext context) => const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/images/empty.png'),
          width: 240,
        ),
        Text(
          'Great Job!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    ),
  ),
);