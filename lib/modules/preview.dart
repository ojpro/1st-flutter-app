import 'package:first_app/modules/bmi_calculator.dart';
import 'package:first_app/modules/contacts.dart';
import 'package:flutter/material.dart';

import 'auth/login.dart';
import 'counter.dart';
import 'home.dart';
import 'messenger.dart';

class PreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Preview Apps'),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BMICalculatorScreen()));
                },
                color: Colors.blue,
                child: const Text(
                  'BMI Calculator',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactsScreen()));
                },
                color: Colors.blue,
                child: const Text(
                  'Contacts',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CounterScreen()));
                },
                color: Colors.blue,
                child: const Text(
                  'Counter',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ApolloScreen()));
                },
                color: Colors.blue,
                child: const Text(
                  'Apollo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MessengerScreen()));
                },
                color: Colors.blue,
                child: const Text(
                  'Messenger',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                },
                color: Colors.blue,
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
