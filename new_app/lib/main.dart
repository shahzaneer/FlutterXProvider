import 'package:flutter/material.dart';
import 'package:new_app/Counter.dart';
import 'package:new_app/CounterProvider.dart';
import 'package:new_app/RestApiWithProvider/loginApp.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class RunningApp extends StatelessWidget {
  const RunningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: Builder(builder: ((context) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text("Shahzaneer Ahmed"),
            ),
            body: CounterApp(),
          ),
        );
      })),
    );
  }
}
