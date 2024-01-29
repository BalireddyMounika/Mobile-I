class FinalIvinDataAnalytics {
  FinalIvinDataAnalytics({
    this.voterId,
    this.ivinId,
    this.name,
    this.firstName,
    this.lastName,
    this.relationType,
    this.guardian,
    this.home,
    this.age,
    this.gender,
    this.state,
    this.district,
    this.constituency,
    this.pollingStationNumber,
    this.pollingStationName,
    this.pollingStationLocation,
    this.voterSerialNumber,
    this.voterSlip,
    this.mandal,
    this.sectionNoAndName,
    this.assemblyConstituencyNoAndName,
    this.mainTownORVillage,
    this.pinCode,
    this.revenueDivision,
    this.policeStation,
  });

  FinalIvinDataAnalytics.fromJson(dynamic json) {
    voterId = json['VoterId'];
    ivinId = json['ivin_id'];
    name = json['Name'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    relationType = json['Relation_Type'];
    guardian = json['Guardian'];
    home = json['Home'];
    age = json['Age'];
    gender = json['Gender'];
    state = json['State'];
    district = json['District'];
    constituency = json['Constituency'];
    pollingStationNumber = json['Polling_Station_Number'];
    pollingStationName = json['Polling_Station_Name'];
    pollingStationLocation = json['Polling_Station_Location'];
    voterSerialNumber = json['Voter_SerialNumber'];
    voterSlip = json['Voter_Slip'];
    mandal = json['Mandal'];
    sectionNoAndName = json['Section_No_and_Name'];
    assemblyConstituencyNoAndName = json['Assembly_Constituency_No_and_Name'];
    mainTownORVillage = json['Main_Town_OR_Village'];
    pinCode = json['Pin_Code'];
    revenueDivision = json['Revenue_Division'];
    policeStation = json['Police_Station'];
  }
  String? voterId;
  int? ivinId;
  String? name;
  String? firstName;
  String? lastName;
  String? relationType;
  String? guardian;
  String? home;
  String? age;
  String? gender;
  String? state;
  String? district;
  String? constituency;
  String? pollingStationNumber;
  String? pollingStationName;
  String? pollingStationLocation;
  String? voterSerialNumber;
  String? voterSlip;
  String? mandal;
  String? sectionNoAndName;
  String? assemblyConstituencyNoAndName;
  String? mainTownORVillage;
  String? pinCode;
  String? revenueDivision;
  String? policeStation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['VoterId'] = voterId;
    map['ivin_id'] = ivinId;
    map['Name'] = name;
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    map['Relation_Type'] = relationType;
    map['Guardian'] = guardian;
    map['Home'] = home;
    map['Age'] = age;
    map['Gender'] = gender;
    map['State'] = state;
    map['District'] = district;
    map['Constituency'] = constituency;
    map['Polling_Station_Number'] = pollingStationNumber;
    map['Polling_Station_Name'] = pollingStationName;
    map['Polling_Station_Location'] = pollingStationLocation;
    map['Voter_SerialNumber'] = voterSerialNumber;
    map['Voter_Slip'] = voterSlip;
    map['Mandal'] = mandal;
    map['Section_No_and_Name'] = sectionNoAndName;
    map['Assembly_Constituency_No_and_Name'] = assemblyConstituencyNoAndName;
    map['Main_Town_OR_Village'] = mainTownORVillage;
    map['Pin_Code'] = pinCode;
    map['Revenue_Division'] = revenueDivision;
    map['Police_Station'] = policeStation;
    return map;
  }
}
