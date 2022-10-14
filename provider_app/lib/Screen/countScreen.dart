import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/countProvider.dart';

class CountScreenwithProvider extends StatefulWidget {
  const CountScreenwithProvider({super.key});

  @override
  State<CountScreenwithProvider> createState() =>
      _CountScreenwithProviderState();
}

class _CountScreenwithProviderState extends State<CountScreenwithProvider> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context , listen: false);
    print("Pura Scaffold build hua");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider in Action"),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (
            (context, value, child) {
            print("SRFF TEXT BUILD HUA");
            return Text(
              countProvider.count.toString(),
              style: const TextStyle(fontSize: 30),
            );
          }),
        ),
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
