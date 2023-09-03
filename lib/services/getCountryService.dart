import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/getCountryModel.dart';

class GetCountry {
  Future<GetNewCountryModel?> getCountry() async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=2ef0d69bf05203cbd1e66b3fb620b833902aeece7540c2e8c837942cfb404013"),
      );

      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        GetNewCountryModel myResponse =
            GetNewCountryModel.fromJson(decodedResponse);

        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
