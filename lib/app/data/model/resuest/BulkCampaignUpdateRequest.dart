class BulkCampaignUpdateRequest {
  BulkCampaignUpdateRequest({
    this.profession,
    this.partyInclination,
    this.otherparty,
    this.contactNumber,
    this.contactMode,
    this.contactedBy,
    this.commentsForTeamContacted,
    this.isVoted,
    this.dissident,
    this.postelBallot,
    this.informedPersonForDissident,
    this.commentsForDissident,
    this.caste,
    this.interestToJoinParty,
    this.informedPerson,
    this.commentsForJoinParty,
  });

  BulkCampaignUpdateRequest.fromJson(dynamic json) {
    profession = json['Profession'];
    partyInclination = json['PartyInclination'];
    otherparty = json['Otherparty'];
    contactNumber = json['ContactNumber'];
    contactMode = json['ContactMode'];
    contactedBy = json['ContactedBy'];
    commentsForTeamContacted = json['CommentsForTeamContacted'];
    isVoted = json['IsVoted'];
    dissident = json['Dissident'];
    postelBallot = json['PostelBallot'];
    informedPersonForDissident = json['InformedPersonForDissident'];
    commentsForDissident = json['CommentsForDissident'];
    caste = json['Caste'];
    interestToJoinParty = json['InterestToJoinParty'];
    informedPerson = json['InformedPerson'];
    commentsForJoinParty = json['CommentsForJoinParty'];
  }
  String? profession;
  String? partyInclination;
  String? otherparty;
  String? contactNumber;
  String? contactMode;
  String? contactedBy;
  String? commentsForTeamContacted;
  bool? isVoted;
  bool? dissident;
  bool? postelBallot;
  String? informedPersonForDissident;
  String? commentsForDissident;
  String? caste;
  bool? interestToJoinParty;
  String? informedPerson;
  String? commentsForJoinParty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Profession'] = profession;
    map['PartyInclination'] = partyInclination;
    map['Otherparty'] = otherparty;
    map['ContactNumber'] = contactNumber;
    map['ContactMode'] = contactMode;
    map['ContactedBy'] = contactedBy;
    map['CommentsForTeamContacted'] = commentsForTeamContacted;
    map['IsVoted'] = isVoted;
    map['Dissident'] = dissident;
    map['PostelBallot'] = postelBallot;
    map['InformedPersonForDissident'] = informedPersonForDissident;
    map['CommentsForDissident'] = commentsForDissident;
    map['Caste'] = caste;
    map['InterestToJoinParty'] = interestToJoinParty;
    map['InformedPerson'] = informedPerson;
    map['CommentsForJoinParty'] = commentsForJoinParty;
    return map;
  }
}
