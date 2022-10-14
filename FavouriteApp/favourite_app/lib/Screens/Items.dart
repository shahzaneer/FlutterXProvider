import 'package:favourite_app/Provider/favouriteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favouriteScreen.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Items"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavouriteScreen(),
                    ));
              },
              child: Ink(
                child: const Icon(Icons.favorite),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                  builder: ((context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.items.contains(index)) {
                          value.removeItems(index);
                        } else {
                          print("Selected $index");
                          value.addItem(index);
                        }
                      },
                      leading: Text("Item $index"),
                      trailing: value.items.contains(index)
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border_outlined),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
