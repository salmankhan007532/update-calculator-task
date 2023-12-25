import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:task/screens/model/model.dart';

class HiveDatabaseScreen extends StatefulWidget {
  const HiveDatabaseScreen({super.key});

  @override
  State<HiveDatabaseScreen> createState() => _HiveDatabaseScreenState();
}

class _HiveDatabaseScreenState extends State<HiveDatabaseScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ValueListenableBuilder(
            valueListenable: Hive.box<DatabaseModel>("myBox").listenable(),
            builder: (context, box, _) {
              final keys = box.keys.toList();
              return ListView.builder(
                itemCount: keys.length,
                itemBuilder: (context, index) {
                  final int key = keys[index];
                  final data = box.get(key);

                  return Card(
                    
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                      
                          Text("Weight: ${data!.weight.toString()}"),
                          Text("Density: ${data!.density.toString()}"),
                          Text("Volume: ${data.valume.toString()}"),
                      
                      
                      
                        ],
                      ),
                    ),
                  );
                  // return Card(
                  //   child: ListTile(
                  //     leading: Text("Weight:${data!.weight.toString()}"),
                  //     title: Text("Density:${data!.density.toString()}"),
                  //     trailing: Text("Volume:${data.valume.toString()}"),
                  //   ),
                  // );
                },
              );
            },
          ),
        ),
      ),
    
    );
  }
}
