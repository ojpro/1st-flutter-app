import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_app/models/migrations/task.dart';
import 'package:first_app/modules/tasks/archived.dart';
import 'package:first_app/modules/tasks/done.dart';
import 'package:first_app/modules/tasks/todo.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../components/default_input.dart';
import '../constants.dart';

class DefaultLayout extends StatefulWidget {
  const DefaultLayout({super.key});

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  int currentTab = 0;
  List<Widget> screens = [
    TodoScreen(),
    const DoneScreen(),
    const ArchivedScreen()
  ];
  late Future<Database> database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isAddTaskSheetActive = false;
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var dueController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // create app database
    database = initDatabase();
  }

  @override
  Widget build(BuildContext context) {
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
            isAddTaskSheetActive ? Icons.add : Icons.edit,
            color: Colors.white,
          ),
          onPressed: () async {
            if (isAddTaskSheetActive) {
              if (_formKey.currentState!.validate()) {
                addTask(
                  Task(
                    name: nameController.text,
                    status: 'todo',
                    dueDate: (dueController.text) != ''
                        ? DateTime.parse(dueController.text)
                            .millisecondsSinceEpoch
                        : null,
                  ),
                ).then((value) {
                  // fetch all tasks
                  getTasks(database).then((tasks) {
                    setState(() {
                      tasks = tasks;

                      Navigator.pop(context);

                      isAddTaskSheetActive = false;
                    });
                  });
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
                              controller: nameController,
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
                                  dueController.text = value.toString();
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
                setState(() {
                  isAddTaskSheetActive = false;
                });
              });
              setState(() {
                isAddTaskSheetActive = true;
              });
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentTab,
        backgroundColor: const Color(0xFF09090b),
        elevation: 0,
        onTap: (index) {
          setState(() {
            currentTab = index;
          });
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
        condition: tasks.isNotEmpty,
        builder: (context) => screens[currentTab],
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
  }

  Future<Database> initDatabase() async {
    Database db = await openDatabase(
      'local_database.db',
      version: 1,
      onCreate: (db, version) async {
        // Create database tables
        await db
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(250), status VARCHAR(200), due_date INTEGER, created_at INTEGER, updated_at INTEGER)')
            .then((value) {
          print('Tasks table created');
        }).catchError((error) {
          print('Error on creating Tasks table : $error');
        });
        print("Database version $version created.");
      },
      onOpen: (db) {
        print('Database opened.');
        // fetch all tasks
        getTasks(db).then((value) {
          setState(() {
            tasks = value;
          });
        });
      },
    );
    return db;
  }

  Future<void> addTask(Task task) async {
    final db = await database;

    await db
        .insert(
          'tasks',
          task.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        )
        .then((value) => print('Task added successfully.'))
        .catchError((error) => print('ERROR: $error'));
  }

  Future<List<Task>> getTasks(db) async {
    final List<Map<String, dynamic>> tasks = await db.query('tasks');

    return List.generate(
      tasks.length,
      (index) => Task(
        id: tasks[index]['id'] as int,
        name: tasks[index]['name'] as String,
        status: tasks[index]['status'] as String,
        dueDate: tasks[index]['due_date'] as int?,
        createdAt: tasks[index]['created_at'] as int?,
        updatedAt: tasks[index]['updated_at'] as int?,
      ),
    );
  }
}
