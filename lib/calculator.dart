import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/Extra_file.dart';
import 'package:task/calculator_viewModel.dart';
import 'package:task/screens/home_screen.dart';
import 'package:task/screens/save_data.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorViewModel(),
      child: Consumer<CalculatorViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Concrete Calculator'),
            actions: [
              IconButton(onPressed: () {

                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HiveDatabaseScreen()));
              }, icon: const Icon(Icons.save)),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/download.jpeg",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 200,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(15),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400.sp,
                    height: 40.sp,
                    decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Concrete type"),
                        //MyDropdownButton()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
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
                      dropdownItems: model.volumeMap2, 
                      selectedValue2:model.initialVolumeText2, 
                      onDropdownChanged2: (value) {
                        model.updateSelectedVolumeOption2(value!);
                        model.setTheVolumeType2(value);
                      }, 
                      dropdownItems2: model.volumeMap2,
                      ),
                  const SizedBox(height: 5),
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
                    dropdownItems: model.densityMap2, 
                    onDropdownChanged2: (double? value) {
                      model.updateSelectedDensityOption2(value!);

                      model.setTheDensityType2(value);

                      }, 
                    selectedValue2: model.initialDensityText2, 
                    dropdownItems2: model.densityMap2,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                           model.saveData(context);
                          },
                          child: customContiner(text: "Save")),
                      customContiner(text: "Clear"),
                      customContiner(text: "Share"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 400.sp,
                    height: 40.sp,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Weight"),
                          Text(' ${model.weight}'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  customTable(
                    qantity: ' ${model.weight}',
                    droplist: DropdownButton<String>(
                      value: model.initialWieghtText,
                      onChanged: (newKey) {
                        model.updateWieghtText(newKey);

                        // model.setTheWeight()
                      },
                      items: model.weightMap.keys
                          .map<DropdownMenuItem<String>>((String key) {
                        return DropdownMenuItem<String>(
                          value: key,
                          child: Text(key),
                        );
                      }).toList(),
                      underline: Container(),
                    ),
                  ),
                  SizedBox(
                    height: 30.sp,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Learn It",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          height: 40.sp,
                          width: 100.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp),
                            border: Border.all(
                                width: 2.sp,
                                color: Colors.red.withOpacity(0.5)),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.arrow_right),
                              Text(
                                "Watch video",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
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
    required String selectedValue2,
    required ValueChanged<double?> onDropdownChanged,
    required ValueChanged<double?> onDropdownChanged2,
    required Map<String, double> dropdownItems,
    required Map<String, double> dropdownItems2,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
      ),
      child: Container(
        width: 400,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: TextFormField(
            onChanged: onChanged,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: label,
              suffixIcon: Container(
                height: 40,
                width: 180,
                child: Row(
                  children: [
                    DropdownButton<String>(
                  value: selectedValue,
                  onChanged: (String? newKey) {
                    onDropdownChanged(
                        dropdownItems[newKey]); // Pass the corresponding value
                  },
                  items: dropdownItems.keys
                      .map<DropdownMenuItem<String>>((String key) {
                    return DropdownMenuItem<String>(
                      value: key,
                      child: Text(key),
                    );
                  }).toList(),
                  underline: Container(),
                ),
                DropdownButton<String>(
                  value: selectedValue2,
                  onChanged: (String? newKey) {
                    onDropdownChanged2(
                        dropdownItems2[newKey]); // Pass the corresponding value
                  },
                  items: dropdownItems2.keys
                      .map<DropdownMenuItem<String>>((String key) {
                    return DropdownMenuItem<String>(
                      value: key,
                      child: Text(key),
                    );
                  }).toList(),
                  underline: Container(),
                ),
                  ],
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}

Widget customContiner({required var text}) {
  return Container(
    height: 40.sp,
    width: 100.sp,
    decoration: BoxDecoration(
      color: Colors.red[200],
      borderRadius: BorderRadius.circular(6),
    ),
    child: Center(
      child: Text(
        "$text",
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
