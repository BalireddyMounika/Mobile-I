class CommunicationModel {
  CommunicationModel({
    required this.count,
    required this.ivinIds,
  });

  CommunicationModel.fromJson(dynamic json) {
    count = json['Count'];
    ivinIds = json['IvinIds'] != null ? json['IvinIds'].cast<int>() : [];
  }
  int? count;
  List<int>? ivinIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Count'] = count;
    map['IvinIds'] = ivinIds;
    return map;
  }
}
