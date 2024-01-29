class QuickInsightResponse {
  QuickInsightResponse({
    this.id,
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
    this.count,
    this.nameOfYourQuickInsights,
    this.createdOn,
    this.updatedOn,
  });

  QuickInsightResponse.fromJson(dynamic json) {
    id = json['id'];
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
    count = json['Count'];
    nameOfYourQuickInsights = json['NameOfYourQuickInsights'];
    createdOn = json['CreatedOn'];
    updatedOn = json['UpdatedOn'];
  }
  int? id;
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
  int? count;
  String? nameOfYourQuickInsights;
  String? createdOn;
  String? updatedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
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
    map['Count'] = count;
    map['NameOfYourQuickInsights'] = nameOfYourQuickInsights;
    map['CreatedOn'] = createdOn;
    map['UpdatedOn'] = updatedOn;
    return map;
  }
}

// class QuickInsightResponse {
//   QuickInsightResponse({
//     this.id,
//     this.constituency,
//     this.pollingStationName,
//     this.gender,
//     this.name,
//     this.sectionNoAndName,
//     this.lastName,
//     this.home,
//     this.mandal,
//     this.lastnameLike,
//     this.ivinIds,
//     this.caste,
//     this.contactNumber,
//     this.partyInclinationId,
//     this.profession,
//     this.contactMode,
//     this.nonLocalAddress,
//     this.dissident,
//     this.interestToJoinParty,
//     this.physicallyChallenged,
//     this.habitationsId,
//     this.fromAge,
//     this.toAge,
//     this.discription,
//     this.nameOfYourQuickInsights,
//   });
//
//   QuickInsightResponse.fromJson(dynamic json) {
//     id = json['id'];
//     constituency = json['Constituency'];
//     pollingStationName = json['PollingStationName'];
//     gender = json['Gender'];
//     name = json['Name'];
//     sectionNoAndName = json['Section_No_and_Name'];
//     lastName = json['LastName'];
//     home = json['Home'];
//     mandal = json['Mandal'];
//     lastnameLike = json['Lastname_like'];
//     ivinIds = json['IvinIds'];
//     caste = json['Caste'];
//     contactNumber = json['ContactNumber'];
//     partyInclinationId = json['PartyInclination_id'];
//     profession = json['Profession'];
//     contactMode = json['ContactMode'];
//     nonLocalAddress = json['Non_Local_Address'];
//     dissident = json['Dissident'];
//     interestToJoinParty = json['InterestToJoinParty'];
//     physicallyChallenged = json['PhysicallyChallenged'];
//     habitationsId = json['Habitations_id'];
//     fromAge = json['from_age'];
//     toAge = json['to_age'];
//     discription = json['Discription'];
//     nameOfYourQuickInsights = json['NameOfYourQuickInsights'];
//     page = json['page'];
//     page_size = json['page_size'];
//   }
//   int? id;
//   String? constituency;
//   String? pollingStationName;
//   String? gender;
//   String? name;
//   String? sectionNoAndName;
//   String? lastName;
//   String? home;
//   String? mandal;
//   String? lastnameLike;
//   String? ivinIds;
//   String? caste;
//   String? contactNumber;
//   String? partyInclinationId;
//   String? profession;
//   String? contactMode;
//   String? nonLocalAddress;
//   String? dissident;
//   String? interestToJoinParty;
//   String? physicallyChallenged;
//   String? habitationsId;
//   String? fromAge;
//   String? toAge;
//   String? discription;
//   String? nameOfYourQuickInsights;
//   String? page;
//   String? page_size;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['Constituency'] = constituency;
//     map['PollingStationName'] = pollingStationName;
//     map['Gender'] = gender;
//     map['Name'] = name;
//     map['Section_No_and_Name'] = sectionNoAndName;
//     map['LastName'] = lastName;
//     map['Home'] = home;
//     map['Mandal'] = mandal;
//     map['Lastname_like'] = lastnameLike;
//     map['IvinIds'] = ivinIds;
//     map['Caste'] = caste;
//     map['ContactNumber'] = contactNumber;
//     map['PartyInclination_id'] = partyInclinationId;
//     map['Profession'] = profession;
//     map['ContactMode'] = contactMode;
//     map['Non_Local_Address'] = nonLocalAddress;
//     map['Dissident'] = dissident;
//     map['InterestToJoinParty'] = interestToJoinParty;
//     map['PhysicallyChallenged'] = physicallyChallenged;
//     map['Habitations_id'] = habitationsId;
//     map['from_age'] = fromAge;
//     map['to_age'] = toAge;
//     map['Discription'] = discription;
//     map['NameOfYourQuickInsights'] = nameOfYourQuickInsights;
//     map['page_size'] = page_size;
//     map['page'] = page;
//     return map;
//   }
// }
