import 'package:favourite_app/Provider/favouriteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("SELECTED FAVOURITES"),
      ),
      body: Column(
        children: [
          Consumer(builder: ((context, value, child) {
            return Expanded(
              child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      print("UnSelected $index");
                      provider.removeItems(index);
                    },
                    leading: Text("Item $index"),
                    trailing: const Icon(Icons.favorite),
                  );
                },
              ),
            );
          })),
        ],
      ),
    );
  }
}
