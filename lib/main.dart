import 'package:first_app/modules/tasks/add_sheet.dart';
import 'package:first_app/shared/layouts/default_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultLayout(),
    );
  }
}
