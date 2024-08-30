import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/favourite_provider.dart';
import 'package:state_management/screens/favourite/myfavourites.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {
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
              itemCount: 100, // Assuming 10 favorite apps for this example
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
