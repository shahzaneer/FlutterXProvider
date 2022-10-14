import 'package:favourite_app/Provider/favouriteProvider.dart';
import 'package:favourite_app/Provider/themeProvider.dart';
import 'package:favourite_app/Screens/Items.dart';
import 'package:favourite_app/Screens/ThemeChangerScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ThemeChangerApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavouriteProvider>(
            create: (_) => FavouriteProvider()),
            ChangeNotifierProvider<ThemeProvider>(
            create: (_) => ThemeProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ItemsScreen(),
      ),
    );
  }
}
