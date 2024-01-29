class SearchQuickAnalyticsRequest {
  SearchQuickAnalyticsRequest({
    this.name,
    this.gender,
    this.constituency,
    this.pollingStationName,
    this.sectionNoAndName,
    this.lastName,
    this.home,
    this.mandal,
    this.lastnameLike,
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
    this.schemes,
    this.page,
    this.perPage,
  });

  SearchQuickAnalyticsRequest.fromJson(dynamic json) {
    name = json['Name'];
    gender = json['Gender'];
    constituency = json['Constituency'];
    pollingStationName = json['PollingStationName'];
    sectionNoAndName = json['Section_No_and_Name'];
    lastName = json['LastName'];
    home = json['Home'];
    mandal = json['Mandal'];
    lastnameLike = json['Lastname_like'];
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
    schemes = json['Schemes'];
    page = json['page'];
    perPage = json['per_page'];
  }
  String? name;
  String? gender;
  String? constituency;
  String? pollingStationName;
  String? sectionNoAndName;
  String? lastName;
  String? home;
  String? mandal;
  String? lastnameLike;
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
  String? schemes;
  int? page;
  int? perPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = name;
    map['Gender'] = gender;
    map['Constituency'] = constituency;
    map['PollingStationName'] = pollingStationName;
    map['Section_No_and_Name'] = sectionNoAndName;
    map['LastName'] = lastName;
    map['Home'] = home;
    map['Mandal'] = mandal;
    map['Lastname_like'] = lastnameLike;
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
    map['Schemes'] = schemes;
    map['page'] = page;
    map['per_page'] = perPage;
    return map;
  }
}
