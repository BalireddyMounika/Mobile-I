class SaveInsightsRequest {
  SaveInsightsRequest({
    this.constituency,
    this.pollingStationName,
    this.gender,
    this.name,
    this.sectionNoAndName,
    this.lastName,
    this.home,
    this.mandal,
    this.lastnameLike,
    this.ivinIds,
    this.caste,
    this.contactNumber,
    this.partyInclinationId,
    this.profession,
    this.contactMode,
    this.nonLocalAddress,
    this.dissident,
    this.interestToJoinParty,
    this.physicallyChallenged,
    this.habitationsId,
    this.fromAge,
    this.toAge,
    this.discription,
    this.nameOfYourQuickInsights,
  });

  SaveInsightsRequest.fromJson(dynamic json) {
    constituency = json['Constituency'];
    pollingStationName = json['PollingStationName'];
    gender = json['Gender'];
    name = json['Name'];
    sectionNoAndName = json['Section_No_and_Name'];
    lastName = json['LastName'];
    home = json['Home'];
    mandal = json['Mandal'];
    lastnameLike = json['Lastname_like'];
    ivinIds = json['IvinIds'];
    caste = json['Caste'];
    contactNumber = json['ContactNumber'];
    partyInclinationId = json['PartyInclination_id'];
    profession = json['Profession'];
    contactMode = json['ContactMode'];
    nonLocalAddress = json['Non_Local_Address'];
    dissident = json['Dissident'];
    interestToJoinParty = json['InterestToJoinParty'];
    physicallyChallenged = json['PhysicallyChallenged'];
    habitationsId = json['Habitations_id'];
    fromAge = json['from_age'];
    toAge = json['to_age'];
    discription = json['Discription'];
    nameOfYourQuickInsights = json['NameOfYourQuickInsights'];
  }
  String? constituency;
  String? pollingStationName;
  String? gender;
  String? name;
  String? sectionNoAndName;
  String? lastName;
  String? home;
  String? mandal;
  String? lastnameLike;
  String? ivinIds;
  String? caste;
  String? contactNumber;
  String? partyInclinationId;
  String? profession;
  String? contactMode;
  String? nonLocalAddress;
  String? dissident;
  String? interestToJoinParty;
  String? physicallyChallenged;
  String? habitationsId;
  String? fromAge;
  String? toAge;
  String? discription;
  String? nameOfYourQuickInsights;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Constituency'] = constituency;
    map['PollingStationName'] = pollingStationName;
    map['Gender'] = gender;
    map['Name'] = name;
    map['Section_No_and_Name'] = sectionNoAndName;
    map['LastName'] = lastName;
    map['Home'] = home;
    map['Mandal'] = mandal;
    map['Lastname_like'] = lastnameLike;
    map['IvinIds'] = ivinIds;
    map['Caste'] = caste;
    map['ContactNumber'] = contactNumber;
    map['PartyInclination_id'] = partyInclinationId;
    map['Profession'] = profession;
    map['ContactMode'] = contactMode;
    map['Non_Local_Address'] = nonLocalAddress;
    map['Dissident'] = dissident;
    map['InterestToJoinParty'] = interestToJoinParty;
    map['PhysicallyChallenged'] = physicallyChallenged;
    map['Habitations_id'] = habitationsId;
    map['from_age'] = fromAge;
    map['to_age'] = toAge;
    map['Discription'] = discription;
    map['NameOfYourQuickInsights'] = nameOfYourQuickInsights;
    return map;
  }
}
