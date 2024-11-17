import 'dart:convert';

import 'package:Remedial_App/Pages/Advertises/advertise_model.dart';
import 'package:Remedial_App/Pages/Advertises/api_url.dart';
import 'package:http/http.dart' as http;

class AdvertiseServices {
  static Future<AdvertiseModel> fetchData() async {
    final response = await http.get(Uri.parse(base_url));
    var data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return AdvertiseModel.fromJson(data);
    } else {
      throw Exception("data not fetched");
    }
  }
}
