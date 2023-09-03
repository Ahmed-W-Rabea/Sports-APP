class GetNewCountryModel {
  int? success;
  List<Result>? result;

  GetNewCountryModel({this.success, this.result});

  GetNewCountryModel.fromJson(Map<String, dynamic> json) {
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
  int? countryKey;
  String? countryName;
  String? countryIso2;
  String? countryLogo;

  Result(
      {this.countryKey, this.countryName, this.countryIso2, this.countryLogo});

  Result.fromJson(Map<String, dynamic> json) {
    countryKey = json['country_key'];
    countryName = json['country_name'];
    countryIso2 = json['country_iso2'];
    countryLogo = json['country_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_key'] = this.countryKey;
    data['country_name'] = this.countryName;
    data['country_iso2'] = this.countryIso2;
    data['country_logo'] = this.countryLogo;
    return data;
  }
}
