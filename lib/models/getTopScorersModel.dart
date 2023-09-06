class GetTopScorersModel {
  int? success;
  List<Result>? result;

  GetTopScorersModel({this.success, this.result});

  GetTopScorersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? playerPlace;
  String? playerName;
  int? playerKey;
  String? teamName;
  int? teamKey;
  int? goals;
  int? assists;
  int? penaltyGoals;

  Result(
      {this.playerPlace,
      this.playerName,
      this.playerKey,
      this.teamName,
      this.teamKey,
      this.goals,
      this.assists,
      this.penaltyGoals});

  Result.fromJson(Map<String, dynamic> json) {
    playerPlace = json['player_place'];
    playerName = json['player_name'];
    playerKey = json['player_key'];
    teamName = json['team_name'];
    teamKey = json['team_key'];
    goals = json['goals'];
    assists = json['assists'];
    penaltyGoals = json['penalty_goals'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_place'] = this.playerPlace;
    data['player_name'] = this.playerName;
    data['player_key'] = this.playerKey;
    data['team_name'] = this.teamName;
    data['team_key'] = this.teamKey;
    data['goals'] = this.goals;
    data['assists'] = this.assists;
    data['penalty_goals'] = this.penaltyGoals;
    return data;
  }
}
