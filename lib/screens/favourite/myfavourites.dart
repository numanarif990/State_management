import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favourite_provider.dart';
class Myfavourites extends StatefulWidget {
  const Myfavourites({super.key});

  @override
  State<Myfavourites> createState() => _MyfavouritesState();
}

class _MyfavouritesState extends State<Myfavourites> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavouriteProvider>(context);
    print("build");
    return Scaffold(
      appBar: AppBar(
          title: const Text("Favourite App"),
          centerTitle: true,
          actions: [
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Myfavourites()));
                },
                child: const Icon(Icons.favorite)),
            const SizedBox(width: 20,)
          ]
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favoriteProvider.selectedItems.length, // Assuming 10 favorite apps for this example
                itemBuilder: (context, index){
                  return Consumer<FavouriteProvider>(builder: (context, value, child){
                    return ListTile(
                      onTap: (){
                        if (value.selectedItems.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }

                      },
                      trailing: value.selectedItems.contains(index) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border_outlined),
                      title: Text('item ${index+1}' , style: const TextStyle(fontSize: 23),),
                    );
                  });
                }
            ),
          )
        ],
      ),
    );
  }
}
