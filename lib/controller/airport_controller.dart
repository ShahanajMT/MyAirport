

import 'package:flutter/material.dart';

import '../model/airport_model.dart';

class AirportData with ChangeNotifier {
  List<Airports> _airportData = [];
  final bool _isLoading = true; 

  List<Airports> get airportData => _airportData;
  bool get isLoading => _isLoading;

  void setAirportData(List<Airports> data) {
    _airportData = data;
    notifyListeners();
  }

  // Method to filter all airports
  List<Airports> filterAllAirports() {
    return List<Airports>.from(_airportData);
  }

  


void sortData({required SortType sortType}) {
  if (sortType == SortType.AtoZ) {
    _airportData.sort((a, b) {
      String countryNameA = a.source?.countryName ?? '';
      String countryNameB = b.source?.countryName ?? '';

      print('Sorting: $countryNameA vs $countryNameB');

      return countryNameA.compareTo(countryNameB);
    });
  } else {
    _airportData.sort((a, b) {
      String countryNameA = a.source?.countryName ?? '';
      String countryNameB = b.source?.countryName ?? '';

      print('Sorting: $countryNameB vs $countryNameA');

      return countryNameB.compareTo(countryNameA);
    });
  }
  notifyListeners();
}

}

// ignore: constant_identifier_names
enum SortType { AtoZ, ZtoA }

