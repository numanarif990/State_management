import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/favourite_provider.dart';
import 'package:state_management/providers/multi_provider.dart';
import 'package:state_management/screens/count_example.dart';
import 'package:state_management/providers/provider_counter.dart';
import 'package:state_management/screens/favourite/favourite_screen.dart';
import 'package:state_management/screens/multi_provider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ProviderCounter()),
      ChangeNotifierProvider(create: (_)=> MultiProvider1()),
      ChangeNotifierProvider(create: (_)=>  FavouriteProvider())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.blue,
        ),
        home: const FavouriteScreen(),
      ),
    );
  }
}
