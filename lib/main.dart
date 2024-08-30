import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/favourite_provider.dart';
import 'package:state_management/providers/multi_provider.dart';
import 'package:state_management/providers/theme_changer_provider.dart';
import 'package:state_management/screens/count_example.dart';
import 'package:state_management/providers/provider_counter.dart';
import 'package:state_management/screens/dark_theme_screen.dart';
import 'package:state_management/screens/favourite/favourite_screen.dart';
import 'package:state_management/screens/multi_provider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ProviderCounter()),
      ChangeNotifierProvider(create: (_)=> MultiProvider1()),
      ChangeNotifierProvider(create: (_)=>  FavouriteProvider()),
      ChangeNotifierProvider(create: (_)=> ThemeChangerProvider())
    ],
      child: Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<ThemeChangerProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.themeMode,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.red,
            primaryColor: Colors.blue,
           appBarTheme: const AppBarTheme(
             color: Colors.brown,
             centerTitle: true
           ),
           useMaterial3: false
          ),
          theme: ThemeData(
            useMaterial3: false,
            primarySwatch: Colors.blue,
           brightness: Brightness.light
          ),
          home: const DarkThemeScreen(),
        );
      }),
    );
  }
}
