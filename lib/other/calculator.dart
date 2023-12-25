import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/calculator_viewModel.dart';
import 'package:task/other/calculator_viewModel.dart';

class CalculatorScreenOther extends StatelessWidget {
  const CalculatorScreenOther({super.key});

  



 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorViewModelOther(),
      child: Consumer<CalculatorViewModelOther>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Concrete Calculator'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildTextFieldWithDropdown(
                  label: 'Volume',
                  onChanged: (value) {
                    model.updateVolume(double.parse(value));
                  },
                  selectedValue: model.initialVolumeText,
                  onDropdownChanged: (value) {

                    model.updateSelectedVolumeOption(value!);
                   model.setTheVolumeType(value);
                   
                  },
                  dropdownItems:model.volumeMap
                ),
               
                const SizedBox(height: 20),
                buildTextFieldWithDropdown(
                  label: 'Density',
                  onChanged: (value) {
                    model.updateDensity(double.parse(value));
                  },
                  selectedValue: model.initialDensityText,
                  onDropdownChanged: (value) {

                    model.updateSelectedDensityOption(value!);
                  
                 
                    model.setTheDensityType(value);
                  },
                  dropdownItems: model.densityMap,
                ),
                const SizedBox(height: 20),
                Text('Weight: ${model.weight}'),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget buildTextFieldWithDropdown({
  required String label,
  required ValueChanged<String> onChanged,
  required String selectedValue,
  required ValueChanged<double?> onDropdownChanged,
  required Map<String, double> dropdownItems,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextFormField(
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: DropdownButton<String>(
          value: selectedValue,
          onChanged: (String? newKey) {
            onDropdownChanged(dropdownItems[newKey]); // Pass the corresponding value
          },
          items: dropdownItems.keys.map<DropdownMenuItem<String>>((String key) {
            return DropdownMenuItem<String>(
              value: key,
              child: Text(key),
            );
          }).toList(),
        ),
      ),
    ),
  );
}
}
