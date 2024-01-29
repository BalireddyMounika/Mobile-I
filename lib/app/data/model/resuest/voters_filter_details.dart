import 'dart:convert';

VotersFilterDetails votersFilterDetailsFromJson(String str) =>
    VotersFilterDetails.fromJson(json.decode(str));
String votersFilterDetailsToJson(VotersFilterDetails data) =>
    json.encode(data.toJson());

class VotersFilterDetails {
  VotersFilterDetails({
    this.pollingStationName,
    this.nonLocalAddress,
    this.partyName,
    this.isVoted,
  });

  VotersFilterDetails.fromJson(dynamic json) {
    pollingStationName = json['PollingStationName'];
    nonLocalAddress = json['non_local_address'];
    partyName = json['PartyName'];
    isVoted = json['IsVoted'];
  }
  String? pollingStationName;
  dynamic nonLocalAddress;
  dynamic partyName;
  dynamic isVoted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PollingStationName'] = pollingStationName;
    map['non_local_address'] = nonLocalAddress;
    map['PartyName'] = partyName;
    map['IsVoted'] = isVoted;
    return map;
  }
}
