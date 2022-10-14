import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Screen/countScreen.dart';
import 'package:provider_app/Screen/sliderScreen.dart';
import 'package:provider_app/providers/SliderProvider.dart';
import 'package:provider_app/providers/countProvider.dart';

void main() {
  runApp(const MyApp());
}

// ! Provider Example

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountProvider>(create: (_) => CountProvider(),),
        ChangeNotifierProvider<SliderProvider>( create: (_) => SliderProvider())
      ],
      child: const MaterialApp(
        home: SliderSceenWithMultiProvider(),
      ),
    );
  }
}


// ! Single Provider Example
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => CountProvider(),
//       child: const MaterialApp(
//         home:  CountScreenwithProvider(),
//       ),
//     );
//   }
// }
