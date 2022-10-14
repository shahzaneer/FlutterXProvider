import 'package:favourite_app/Provider/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/favouriteProvider.dart';

class ThemeChangerApp extends StatefulWidget {
  const ThemeChangerApp({super.key});

  @override
  State<ThemeChangerApp> createState() => _ThemeChangerAppState();
}

class _ThemeChangerAppState extends State<ThemeChangerApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavouriteProvider>(
            create: (_) => FavouriteProvider()),
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider())
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            darkTheme: ThemeData(
                brightness: Brightness.dark, primarySwatch: Colors.yellow, iconTheme: const IconThemeData(color: Colors.yellow)),
            themeMode: themeChanger.theme,
            home: Scaffold(
              appBar: AppBar(
                title: const Text("Theme Setter App"),
              ),
              body: Column(
                children: [
                  RadioListTile<ThemeMode>(
                    title: const Text("Light"),
                    value: ThemeMode.light,
                    groupValue: themeChanger.theme,
                    onChanged: (value) {
                      themeChanger.setTheme(ThemeMode.light);
                      print("Light Mode ");
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text("Dark"),
                    value: ThemeMode.dark,
                    groupValue: themeChanger.theme,
                    onChanged: (value) {
                      themeChanger.setTheme(ThemeMode.dark);
                      print("Dark Mode ");
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text("System"),
                    value: ThemeMode.system,
                    groupValue: themeChanger.theme,
                    onChanged: (value) {
                      themeChanger.setTheme(ThemeMode.system);
                      print("System Mode ");
                    },
                  ),
                  const Icon(Icons.family_restroom)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
