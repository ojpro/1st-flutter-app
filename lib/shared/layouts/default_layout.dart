import 'package:first_app/models/migrations/task.dart';
import 'package:first_app/shared/components/bottom_sheet.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..initDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit appCubit = BlocProvider.of(context);

          return Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            key: appCubit.scaffoldKey,
            appBar: AppBar(
              title: const Text('Todo App'),
              centerTitle: true,
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) =>
                      [const PopupMenuItem(child: Text('Item 1'))],
                  position: PopupMenuPosition.under,
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: const Color(0xFF212126),
                child: Icon(
                  appCubit.getCurrentBottomSheetState()
                      ? Icons.add
                      : Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () async {
                  if (appCubit.getCurrentBottomSheetState()) {
                    if (appCubit.bottomSheetFormKey.currentState!.validate()) {
                      appCubit
                          .addTask(
                        Task(
                          name: appCubit.getTaskName(),
                          status: 'todo',
                          dueDate: (appCubit.getTaskDue()) != ''
                              ? DateTime.parse(appCubit.getTaskDue())
                                  .millisecondsSinceEpoch
                              : null,
                        ),
                      )
                          .then((value) {
                        // fetch all tasks
                        appCubit.getTasks(null).then((tasks) {
                          Navigator.pop(context);
                        });

                        appCubit.changeBottomSheetState(false);
                      });
                    }
                  } else {
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
                }),
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: appCubit.currentTab,
              backgroundColor: const Color(0xFF09090b),
              elevation: 0,
              onTap: (index) {
                appCubit.changeBottomNavigationBarScreen(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  label: 'Inbox',
                  activeIcon: Icon(
                    Icons.check,
                    color: Colors.grey,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
                  label: 'Done',
                  activeIcon: Icon(
                    Icons.check_circle,
                    color: Colors.grey,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_rounded,
                    color: Colors.white,
                  ),
                  label: 'Archive',
                  activeIcon: Icon(
                    Icons.archive_rounded,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            body: appCubit.getCurrentScreen(),
          );
        },
      ),
    );
  }
}
