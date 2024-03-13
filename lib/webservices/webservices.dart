

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class WebServices {
  static const String apiUrl = 'http://kuwaitwaysstels.caxita.ca/Data/GetAirport?value=d&culture=1&size=10';

  Future<dynamic> fetchData() async {
    try {
      var response = await http.get(Uri.parse(apiUrl));
      log(response.body.toString());

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)["hits"];

        log(jsonData.toString());

        return jsonData;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
}
