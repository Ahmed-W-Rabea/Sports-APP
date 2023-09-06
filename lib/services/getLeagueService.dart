import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/getLeagueModel.dart';

class GetLeague {
  Future<GetLeagueModel?> getLeague() async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=2ef0d69bf05203cbd1e66b3fb620b833902aeece7540c2e8c837942cfb404013"),
      );

      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        GetLeagueModel myResponse = GetLeagueModel.fromJson(decodedResponse);

        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
