import 'dart:convert';

PollingStationDownloadModel pollingStationDownloadModel2FromJson(String str) =>
    PollingStationDownloadModel.fromJson(json.decode(str));
String pollingStationDownloadModel2ToJson(PollingStationDownloadModel data) =>
    json.encode(data.toJson());

class PollingStationDownloadModel {
  PollingStationDownloadModel({
    this.pollingStationName,
    this.voterSerialNumber,
  });

  PollingStationDownloadModel.fromJson(dynamic json) {
    pollingStationName = json['PollingStationName'];
    voterSerialNumber = json['Voter_SerialNumber'];
  }
  String? pollingStationName;
  String? voterSerialNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PollingStationName'] = pollingStationName;
    map['Voter_SerialNumber'] = voterSerialNumber;
    return map;
  }
}
