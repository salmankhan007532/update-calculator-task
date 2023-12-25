import 'package:flutter/material.dart';

class CalculatorViewModelOther extends ChangeNotifier {
  double volume = 1;
  double density = 1;
  double weight = 0;

  Map<String, double> densityMap = {
    'value_1': 2.0,
    'value_2': 2.5,
    'value_3': 3.0,
    'value_4': 3.5,
    'value_5': 4.0,
  };

   Map<String, double> volumeMap = {
    'm3': 1.0,
    'cu_ft': 2.5,
    'ft_yd': 3.0,
    'value_4': 4.5,
    'value_5': 5.0,
  };

    Map<String, double> weightMap = {
    'kg': 1.0,
    't': 2.5,
    'st': 3.0,
    'lb': 4.5,
    'Uston': 5.0,
    "longton":4.3,
  };


  double initialWeight=1000.0;


  String initialDensityText = "value_1";

  String initialVolumeText="m3";

  String initialWieghtText="kg";

  double densityTipe = 2.0;

  double volumeTipe=1.0;

  CalculatorViewModelOther();

  // set the volume
  void updateVolume(value) {
    volume=value;
    calculateWeight();
    
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
    weight = (density * densityTipe) * (volume*volumeTipe);
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


  void setTheWeight(value)
  {
    initialWeight=value;

    calculateWeight();
    notifyListeners();
  }


  void updateWieghtText(value)
  {
      for (var element in weightMap.entries) {
      if (element.value == value) {
        initialWieghtText = element.key;
      }
    }
    notifyListeners();
  }
}
