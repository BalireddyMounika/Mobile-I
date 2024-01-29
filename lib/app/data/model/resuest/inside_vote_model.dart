class insideVoteModel {
  bool? insideVoter;

  insideVoteModel({this.insideVoter});

  insideVoteModel.fromJson(Map<String, dynamic> json) {
    insideVoter = json['inside_voter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inside_voter'] = this.insideVoter;
    return data;
  }
}
