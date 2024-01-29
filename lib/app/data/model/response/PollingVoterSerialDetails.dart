import 'dart:convert';
PollingVoterSerialDetails pollingVoterSerialDetailsFromJson(String str) => PollingVoterSerialDetails.fromJson(json.decode(str));
String pollingVoterSerialDetailsToJson(PollingVoterSerialDetails data) => json.encode(data.toJson());
class PollingVoterSerialDetails {
  PollingVoterSerialDetails({
      this.voterSerialNumber, 
      this.partyInclination, 
      this.nonLocalAddress, 
      this.outsideVoter, 
      this.insideVoter,});

  PollingVoterSerialDetails.fromJson(dynamic json) {
    voterSerialNumber = json['Voter_SerialNumber'];
    partyInclination = json['PartyInclination'];
    nonLocalAddress = json['Non_Local_Address'];
    outsideVoter = json['outside_voter'];
    insideVoter = json['inside_voter'];
  }
  String? voterSerialNumber;
  String? partyInclination;
  dynamic nonLocalAddress;
  bool? outsideVoter;
  bool? insideVoter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Voter_SerialNumber'] = voterSerialNumber;
    map['PartyInclination'] = partyInclination;
    map['Non_Local_Address'] = nonLocalAddress;
    map['outside_voter'] = outsideVoter;
    map['inside_voter'] = insideVoter;
    return map;
  }

}