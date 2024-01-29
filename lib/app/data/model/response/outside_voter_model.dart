import 'dart:convert';

OutsideVoterModel outsideVoterModelFromJson(String str) =>
    OutsideVoterModel.fromJson(json.decode(str));
String outsideVoterModelToJson(OutsideVoterModel data) =>
    json.encode(data.toJson());

class OutsideVoterModel {
  OutsideVoterModel({
    this.voterSerialNumber,
    this.outsideVoter,
  });

  OutsideVoterModel.fromJson(dynamic json) {
    voterSerialNumber = json['Voter_SerialNumber'];
    outsideVoter = json['outside_voter'];
  }
  String? voterSerialNumber;
  bool? outsideVoter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Voter_SerialNumber'] = voterSerialNumber;
    map['outside_voter'] = outsideVoter;
    return map;
  }
}
