import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              padding: const EdgeInsets.only(right: 8.0),
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
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.grey,
                    height: 200,
                    child: const Text('Mercury', style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.orange,
                    height: 200,
                    child: const Text('Venus', style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blue,
                    height: 200,
                    child: const Text('Earth', style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.red,
                    height: 200,
                    child: const Text('Mars', style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.brown,
                    height: 200,
                    child: const Text('Jupiter', style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.amber,
                    height: 200,
                    child: const Text('Saturn', style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.cyan,
                    height: 200,
                    child: const Text('Uranus', style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blueAccent,
                    height: 200,
                    child: const Text('Neptune', style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black12,
                    height: 200,
                    child: const Text('Pluto', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
