import 'package:first_app/shared/cubit/cubit_observer.dart';
import 'package:first_app/shared/layouts/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultLayout(),
    );
  }
}
