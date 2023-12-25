

import 'package:flutter/material.dart';

Widget customTable({required var qantity,required var droplist}){
  return Table(
            border: TableBorder.all(), // Add border for visualization
            children: [
              TableRow(
                children: [
                  Container(
                    color: Colors.red,
                    height: 50.0, // Adjust the height of the row
                    child: const Center(
                      child: Text(
                        'Material',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    height: 50.0, // Adjust the height of the row
                    child: const Center(
                      child: Text(
                        'Quantity',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    height: 50.0, // Adjust the height of the row
                    child: const Center(
                      child: Text(
                        'Unit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    color: Colors.green,
                    height: 50.0, // Adjust the height of the row
                    child: const Center(
                      child: Text(
                        'Weight',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    height: 50.0, // Adjust the height of the row
                    child:  Center(
                      child: Text(
                        "$qantity",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    height: 50.0, // Adjust the height of the row
                    child:   Center(
                      child: droplist,
                    ),
                  ),
                ],
              ),
            ],
          );
}



class MyDropdownButton extends StatefulWidget {
  const MyDropdownButton({super.key});

  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String selectedValue = 'kg'; // Set the default value

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            selectedValue = newValue;
          });
        }
      },
      items: [
        'kg',
        't',
        'st',
        'lb',
        'US ton',
        'long ton',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}






Widget customContiner({required var text}){
  return Container(
    height: 40,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.red[200],
      borderRadius: BorderRadius.circular(6),
    ),
    child: Center(
      child: Text("$text",style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
    ),
  );
}