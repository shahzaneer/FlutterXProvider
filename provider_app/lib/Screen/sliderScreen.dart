import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/SliderProvider.dart';

class SliderSceenWithMultiProvider extends StatefulWidget {
  const SliderSceenWithMultiProvider({super.key});

  @override
  State<SliderSceenWithMultiProvider> createState() =>
      _SliderSceenWithMultiProviderState();
}

class _SliderSceenWithMultiProviderState
    extends State<SliderSceenWithMultiProvider> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SliderProvider>(context, listen: false);
    print("Pura Widget Build hua");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Provider"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer<SliderProvider>(
            builder: ((context, value, child) {
              print("Changing the slider");
              return Slider(
                value: provider.value.toDouble(),
                min: 0,
                max: 1,
                onChanged: ((val) {
                  provider.setValue(val);
                }),
              );
            }),
          ),
          Consumer<SliderProvider>(builder: ((context, value, child) {
            print("Changing the opacity of Containers");
            return Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.red.withOpacity(provider.value),
                  child: const Center(child: Text("Container 1")),
                ),
                Container(
                  height: 100,
                  color: Colors.amber.withOpacity(provider.value),
                  child: const Center(child: Text("Container 2")),
                ),
              ],
            );
          }))
        ],
      ),
    );
  }
}
