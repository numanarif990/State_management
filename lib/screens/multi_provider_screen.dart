import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/multi_provider.dart';
class MultiProviderScreen extends StatefulWidget {
  const MultiProviderScreen({super.key});

  @override
  State<MultiProviderScreen> createState() => _MultiProviderScreenState();
}

class _MultiProviderScreenState extends State<MultiProviderScreen> {

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Provider Example'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<MultiProvider1>(builder: (context, value, child){
          return  Slider(
              min: 0,
              max: 1,
              value: value.value, onChanged: (val){
            value.setValue(val);
            print("signal changed");
          });
          }),
          Consumer<MultiProvider1>(builder: (context, value, child){
            return  Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(value.value),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                        child: Text("container one")),
                  ),
                ),

                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(value.value),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                        child: Text("container two")),
                  ),
                ),
              ],
            );
          }),

        ],
      ),
    );
  }
}
