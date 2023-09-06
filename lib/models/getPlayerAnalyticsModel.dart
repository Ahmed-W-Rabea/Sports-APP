class GetPlayerAnalyticsModel {
  int? success;
  List<Result>? result;

  GetPlayerAnalyticsModel({this.success, this.result});

  GetPlayerAnalyticsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? playerKey;
  String? playerName;
  String? playerNumber;
  String? playerCountry;
  String? playerType;
  String? playerAge;
  String? playerGoals;
  String? playerYellowCards;
  String? playerRedCards;

  String? playerInjured;

  String? playerAssists;
  String? playerIsCaptain;
  String? teamName;
  int? teamKey;
  String? playerImage;

  Result(
      {this.playerKey,
      this.playerName,
      this.playerNumber,
      this.playerCountry,
      this.playerType,
      this.playerAge,
      this.playerGoals,
      this.playerYellowCards,
      this.playerRedCards,
      this.playerInjured,
      this.playerAssists,
      this.playerIsCaptain,
      this.teamName,
      this.teamKey,
      this.playerImage});

  Result.fromJson(Map<String, dynamic> json) {
    playerKey = json['player_key'];
    playerName = json['player_name'];
    playerNumber = json['player_number'];
    playerCountry = json['player_country'];
    playerType = json['player_type'];
    playerAge = json['player_age'];
    playerGoals = json['player_goals'];
    playerYellowCards = json['player_yellow_cards'];
    playerRedCards = json['player_red_cards'];
    playerInjured = json['player_injured'];
    playerAssists = json['player_assists'];
    playerIsCaptain = json['player_is_captain'];

    teamName = json['team_name'];
    teamKey = json['team_key'];
    playerImage = json['player_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['player_key'] = playerKey;
    data['player_name'] = playerName;
    data['player_number'] = playerNumber;
    data['player_country'] = playerCountry;
    data['player_type'] = playerType;
    data['player_age'] = playerAge;
    data['player_goals'] = playerGoals;
    data['player_yellow_cards'] = playerYellowCards;
    data['player_red_cards'] = playerRedCards;
    data['player_injured'] = playerInjured;
    data['player_assists'] = playerAssists;
    data['player_is_captain'] = playerIsCaptain;
    data['team_name'] = teamName;
    data['team_key'] = teamKey;
    data['player_image'] = playerImage;
    return data;
  }
}
