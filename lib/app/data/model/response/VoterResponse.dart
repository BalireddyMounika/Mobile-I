class VoterResponse {
  VoterResponse({
    this.voterId,
    this.name,
    this.firstName,
    this.lastName,
    this.guardian,
    this.home,
    this.age,
    this.gender,
    this.ivinId,
    this.voterSlip,
    this.state,
    this.district,
    this.constituency,
    this.pollingStationNumber,
    this.pollingStationName,
    this.pollingStationLocation,
    this.sectionNoAndName,
    this.assemblyConstituencyNoAndName,
    this.mandal,
    this.mainTownORVillage,
    this.pinCode,
    this.policeStation,
    this.revenueDivision,
    this.voterSerialNumber,
  });

  VoterResponse.fromJson(dynamic json) {
    voterId = json['VoterId'];
    name = json['Name'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    guardian = json['Guardian'];
    home = json['Home'];
    age = json['Age'];
    gender = json['Gender'];
    ivinId = json['ivin_id'];
    voterSlip = json['Voter_Slip'];
    state = json['State'];
    district = json['District'];
    constituency = json['Constituency'];
    pollingStationNumber = json['Polling_Station_Number'];
    pollingStationName = json['Polling_Station_Name'];
    pollingStationLocation = json['Polling_Station_Location'];
    sectionNoAndName = json['Section_No_and_Name'];
    assemblyConstituencyNoAndName = json['Assembly_Constituency_No_and_Name'];
    mandal = json['Mandal'];
    mainTownORVillage = json['Main_Town_OR_Village'];
    pinCode = json['Pin_Code'];
    policeStation = json['Police_Station'];
    revenueDivision = json['Revenue_Division'];
    voterSerialNumber = json['Voter_SerialNumber'];
  }
  String? voterId;
  String? name;
  String? firstName;
  String? lastName;
  String? guardian;
  String? home;
  String? age;
  String? gender;
  int? ivinId;
  String? voterSlip;
  String? state;
  String? district;
  String? constituency;
  String? pollingStationNumber;
  String? pollingStationName;
  String? pollingStationLocation;
  String? sectionNoAndName;
  String? assemblyConstituencyNoAndName;
  String? mandal;
  String? mainTownORVillage;
  String? pinCode;
  String? policeStation;
  String? revenueDivision;
  String? voterSerialNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['VoterId'] = voterId;
    map['Name'] = name;
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    map['Guardian'] = guardian;
    map['Home'] = home;
    map['Age'] = age;
    map['Gender'] = gender;
    map['ivin_id'] = ivinId;
    map['Voter_Slip'] = voterSlip;
    map['State'] = state;
    map['District'] = district;
    map['Constituency'] = constituency;
    map['Polling_Station_Number'] = pollingStationNumber;
    map['Polling_Station_Name'] = pollingStationName;
    map['Polling_Station_Location'] = pollingStationLocation;
    map['Section_No_and_Name'] = sectionNoAndName;
    map['Assembly_Constituency_No_and_Name'] = assemblyConstituencyNoAndName;
    map['Mandal'] = mandal;
    map['Main_Town_OR_Village'] = mainTownORVillage;
    map['Pin_Code'] = pinCode;
    map['Police_Station'] = policeStation;
    map['Revenue_Division'] = revenueDivision;
    map['Voter_SerialNumber'] = voterSerialNumber;
    return map;
  }
}
