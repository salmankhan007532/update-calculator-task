import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/screens/model/model.dart';

class CalculatorViewModel extends ChangeNotifier {
  double volume = 1;
  double density = 1;
  double weight = 1;
  Map<String, double> densityMap = {
    'kg/m3': 2.0,
    'lb/cu_ft': 2.5,
    'lb/cu_yd': 3.0,
  };

  Map<String, double> volumeMap = {
    'm3': 1.0,
    'cu_ft': 2.7,
    'cu_yd': 3.0,
  };

  Map<String, double> weightMap = {
    'kg': 1.0,
    't': 2.5,
    'st': 3.0,
    'lb': 4.5,
    'Uston': 5.0,
    "longton": 4.3,
  };

  String initialDensityText = "kg/m3";

  String initialVolumeText = "m3";

  double densityTipe = 3.0;

  double volumeTipe = 1.0;

  double initialWeight = 1000.0;
  String initialWieghtText = "kg";

  CalculatorViewModel();

  // set the volume
  void updateVolume(value) {
    notifyListeners();
  }

  // set the density
  void updateDensity(value) {
    density = value;

    calculateWeight();

    notifyListeners();
  }

  // find the key of densityMap
  void updateSelectedDensityOption(double value) {
    for (var element in densityMap.entries) {
      if (element.value == value) {
        initialDensityText = element.key;
      }
    }
    notifyListeners();
  }

// find the key of volume
  void updateSelectedVolumeOption(double value) {
    for (var element in volumeMap.entries) {
      if (element.value == value) {
        initialVolumeText = element.key;
      }
    }
    notifyListeners();
  }

  // calculate the weight
  void calculateWeight() {
    weight = (density * densityTipe) * (volume * volumeTipe);
    weight = (weight * initialWeight).ceilToDouble();
    notifyListeners();
  }

  // set the density value
  void setTheDensityType(value) {
    densityTipe = value;
    calculateWeight();

    notifyListeners();
  }

// set the volume value
  void setTheVolumeType(value) {
    volumeTipe = value;
    calculateWeight();

    notifyListeners();
  }

  void setTheWeight(value) {
    initialWeight = value;

    calculateWeight();
    notifyListeners();
  }

  void updateWieghtText(value) {
    for (var element in weightMap.entries) {
      if (element.key == value) {
        setTheWeight(element.value);
      }
    }

    initialWieghtText = value;
    notifyListeners();
  }

  /// save data

  void saveData(BuildContext context) async {
    var user = await Hive.openBox<DatabaseModel>("myBox");

    user.add(DatabaseModel(
        density: density.toString(),
        valume: volume.toString(),
        weight: weight.toString()));

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully added')));

  }
}
