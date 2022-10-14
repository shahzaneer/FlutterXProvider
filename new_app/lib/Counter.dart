import 'package:flutter/material.dart';

class CounterApp extends StatelessWidget {
  CounterApp({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print("BUILD ");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: _toggle,
              builder: ((context, value, child) {
                return TextFormField(
                  obscureText: _toggle.value,
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffix: InkWell(
                        onTap: () {
                          _toggle.value = !_toggle.value;
                        },
                        child: _toggle.value? const Icon(Icons.visibility): const Icon(Icons.visibility_off),
                      )),
                );
              }),
            ),
            ValueListenableBuilder(
              valueListenable: _counter,
              builder: ((context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: const TextStyle(fontSize: 40.0),
                );
              }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
