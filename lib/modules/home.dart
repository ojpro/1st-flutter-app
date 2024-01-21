import 'package:flutter/material.dart';

class ApolloScreen extends StatelessWidget {
  const ApolloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Apollo',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: IconButton(
                  icon: const Icon(Icons.search, color: Colors.blueAccent),
                  onPressed: () {
                    print('handle Search Click');
                  }),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            height: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4.0)),
                      height: 200,
                      child: const Text(
                        'Mercury',
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4.0)),
                      height: 200,
                      child: const Text(
                        'Earth',
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4.0)),
                      height: 200,
                      child: const Text(
                        'Mars',
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4.0)),
                      height: 200,
                      child: const Text(
                        'Uranus',
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4.0)),
                      height: 200,
                      child: const Text(
                        'Neptune',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
