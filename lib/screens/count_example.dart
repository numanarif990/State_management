import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/provider_counter.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<ProviderCounter>(context, listen: false);
    Timer.periodic( Duration(seconds: 1), (timer){
      countProvider.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<ProviderCounter>(context, listen: false);
    print("build");
    return Scaffold(

      appBar: AppBar(
        title: const Text("Counter"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(

              child: Consumer<ProviderCounter>(builder: (context, value, child){
                print("Consumer");
                return Text(value.count.toString(), style: const TextStyle(fontSize: 50),);
              } )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
