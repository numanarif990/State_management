import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/theme_changer_provider.dart';
class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),

      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text("Light Theme",style: TextStyle(fontSize: 25),),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),
          RadioListTile<ThemeMode>(
              title: const Text("Dark Theme",style: TextStyle(fontSize: 25),),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),
          RadioListTile<ThemeMode>(
              title: const Text("System Theme",style: TextStyle(fontSize: 25),),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),
        ],
      ),
    );
  }
}
