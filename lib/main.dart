import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/screens/count_example.dart';
import 'package:state_management/providers/provider_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderCounter(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.blue,
        ),
        home: const CountExample(),
      ),
    );
  }
}
