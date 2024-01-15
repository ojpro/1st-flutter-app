import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/models/migrations/task.dart';
import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/default_input.dart';

class DefaultLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..initDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit appCubit = BlocProvider.of(context);

          return Scaffold(
            key: scaffoldKey,
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
                    if (_formKey.currentState!.validate()) {
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
                    scaffoldKey.currentState
                        ?.showBottomSheet(
                          (context) => Container(
                            width: double.maxFinite,
                            height: 124,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xFF1f1f28),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  DefaultInput(
                                    controller: appCubit.nameController,
                                    hintText: 'what todo?',
                                    suffixIcon: Icons.edit_calendar_rounded,
                                    suffixColor: Colors.grey,
                                    borderRadius: 8,
                                    onSuffixClick: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2040),
                                      ).then((value) async {
                                        appCubit.setTaskDue(value.toString());
                                      });
                                    },
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return 'Task name is important';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
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
            body: ConditionalBuilder(
              condition: appCubit.tasks.isNotEmpty,
              builder: (context) => appCubit.getCurrentScreen(),
              fallback: (context) => const Center(
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
            ),
          );
        },
      ),
    );
  }
}
