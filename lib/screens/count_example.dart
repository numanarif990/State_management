import 'package:flutter/material.dart';
class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        centerTitle: true,
      ),
      body: const Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("0",style: TextStyle(fontSize: 50),))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}
