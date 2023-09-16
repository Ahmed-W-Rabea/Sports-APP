import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/getPlayerModel.dart';

class GetPlayer {
  Future<GetPlayerModel?> getPlayer({required int teamID}) async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://apiv2.allsportsapi.com/football/?&met=Players&teamId=$teamID&APIkey=2ef0d69bf05203cbd1e66b3fb620b833902aeece7540c2e8c837942cfb404013"),
      );

      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        GetPlayerModel myResponse = GetPlayerModel.fromJson(decodedResponse);

        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      log(error.toString());
      return null;
    }
  }
}
