import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/migrations/task.dart';
import '../../modules/tasks/archived.dart';
import '../../modules/tasks/done.dart';
import '../../modules/tasks/todo.dart';

class AppCubit extends Cubit<AppStates> {
  int currentTab = 0;
  List<Widget> screens = [
    TodoScreen(),
    const DoneScreen(),
    const ArchivedScreen()
  ];
  bool isAddTaskSheetActive = false;
  late Database dbConnection;
  List<Task> tasks = [];

  var nameController = TextEditingController();
  var dueController = TextEditingController();

  GlobalKey<FormState> bottomSheetFormKey = GlobalKey<FormState>();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  // init constructor
  AppCubit() : super(AppInitState());

  // get context
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  // change screen based on the selected nav item's index
  void changeBottomNavigationBarScreen(int index) {
    currentTab = index;
    emit(AppChangeBottomNavBarState());
  }

  // get active screen
  Widget getCurrentScreen() => screens[currentTab];

  // toggle bottom sheet modal
  void toggleBottomSheet() {
    isAddTaskSheetActive = !isAddTaskSheetActive;
    emit(AppChangeBottomSheetState());
  }

  // change bottom sheet state
  bool changeBottomSheetState(bool isActive) {
    isAddTaskSheetActive = isActive;

    emit(AppChangeBottomSheetState());

    // clear task data
    nameController.clear();
    dueController.clear();

    return isAddTaskSheetActive;
  }

  String getTaskName() => nameController.text;

  String getTaskDue() => dueController.text;

  void setTaskName(String name) => nameController.text = name;
  void setTaskDue(String due) => dueController.text = due;

  // get task
  Task getTask(int id) => tasks[id];

  // get current bottom sheet state
  bool getCurrentBottomSheetState() => isAddTaskSheetActive;

  // initialize database and create needed tables
  Future<Database> initDatabase() async {
    return await openDatabase(
      'local_database.db',
      version: 1,
      onCreate: (db, version) async {
        // Create database tables
        await db
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(250), status VARCHAR(200), due_date INTEGER, created_at INTEGER, updated_at INTEGER)')
            .then((_) {
          emit(DatabaseInitializedState());
        }).catchError((error) {
          emit(DatabaseExceptionState(error));
        });
      },
      onOpen: (db) {
        emit(DatabaseOpenedState());
        // fetch all tasks
        getTasks(db).then((value) {
          tasks = value;
          emit(TasksFetchedState());
        });
      },
    ).then((value) {
      dbConnection = value;
      emit(DatabaseConnectedState());
      return dbConnection;
    });
  }

  // add new task
  Future<void> addTask(Task task) async {
    await dbConnection
        .insert(
          'tasks',
          task.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        )
        .then((value) => emit(TaskAddedState()))
        .catchError((error) => emit(DatabaseExceptionState(error)));
  }

  // get all tasks
  Future<List<Task>> getTasks(Database? db) async {
    final database = db ?? dbConnection;
    List<Map<String, dynamic>> query = await database.query('tasks');

    List<Task> tasksList = List.generate(
      query.length,
      (index) => Task(
        id: query[index]['id'] as int,
        name: query[index]['name'] as String,
        status: query[index]['status'] as String,
        dueDate: query[index]['due_date'] as int?,
        createdAt: query[index]['created_at'] as int?,
        updatedAt: query[index]['updated_at'] as int?,
      ),
    );

    tasks = tasksList;

    emit(TasksFetchedState());
    return tasks;
  }

  Future<void> deleteTask(int id) async {
    await dbConnection.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );

    emit(TaskDeletedState());

    getTasks(dbConnection);
  }

  Future<Task> updateTask(Task task) async {
    await dbConnection.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );

    emit(TaskUpdatedState());

    getTasks(null);

    return task;
  }
}
