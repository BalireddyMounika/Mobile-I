import 'dart:convert';
AdvanceAnalyticsSearchModel advanceAnalyticsSearchModelFromJson(String str) => AdvanceAnalyticsSearchModel.fromJson(json.decode(str));
String advanceAnalyticsSearchModelToJson(AdvanceAnalyticsSearchModel data) => json.encode(data.toJson());
class AdvanceAnalyticsSearchModel {
  AdvanceAnalyticsSearchModel({
      this.voterSerialNumber, 
      this.voterId, 
      this.name, 
      this.guardian, 
      this.home, 
      this.age, 
      this.gender, 
      this.assemblyConstituencyNoAndName, 
      this.constituency, 
      this.state, 
      this.pdfName, 
      this.postOffice, 
      this.policeStation, 
      this.mandal, 
      this.revenueDivision, 
      this.district, 
      this.sectionNoAndName, 
      this.oldVoterid, 
      this.pollingStationName, 
      this.caste, 
      this.commentsForDissident, 
      this.commentsForJoinParty, 
      this.commentsForTeamContacted, 
      this.contactMode, 
      this.contactNumber, 
      this.contactedBy, 
      this.createdBy, 
      this.currentAddress, 
      this.deleted, 
      this.dissident, 
      this.duplicate, 
      this.expired, 
      this.habitationsId, 
      this.informedPerson, 
      this.informedPersonForDissident, 
      this.interestToJoinParty, 
      this.isInfluencer, 
      this.isVoted, 
      this.nonLocalAddress, 
      this.otherparty, 
      this.partyInclinationId, 
      this.physicallyChallenged, 
      this.postelBallot, 
      this.profession, 
      this.strength, 
      this.userIdId, 
      this.weakness, 
      this.workerIdId, 
      this.influencedVoters, 
      this.outsideVoter, 
      this.insideVoter, 
      this.pollingStationNumber, 
      this.pollingStationLocation, 
      this.ivinId, 
      this.pinCode, 
      this.mainTownORVillage, 
      this.firstName, 
      this.lastName,});

  AdvanceAnalyticsSearchModel.fromJson(dynamic json) {
    voterSerialNumber = json['Voter_SerialNumber'];
    voterId = json['VoterId'];
    name = json['Name'];
    guardian = json['Guardian'];
    home = json['Home'];
    age = json['Age'];
    gender = json['Gender'];
    assemblyConstituencyNoAndName = json['Assembly_Constituency_No_and_Name'];
    constituency = json['Constituency'];
    state = json['State'];
    pdfName = json['pdf_name'];
    postOffice = json['Post_Office'];
    policeStation = json['Police_Station'];
    mandal = json['Mandal'];
    revenueDivision = json['Revenue_Division'];
    district = json['District'];
    sectionNoAndName = json['Section_No_and_Name'];
    oldVoterid = json['Old_Voterid'];
    pollingStationName = json['Polling_Station_Name'];
    caste = json['Caste'];
    commentsForDissident = json['CommentsForDissident'];
    commentsForJoinParty = json['CommentsForJoinParty'];
    commentsForTeamContacted = json['CommentsForTeamContacted'];
    contactMode = json['ContactMode'];
    contactNumber = json['ContactNumber'];
    contactedBy = json['ContactedBy'];
    createdBy = json['CreatedBy'];
    currentAddress = json['CurrentAddress'];
    deleted = json['Deleted'];
    dissident = json['Dissident'];
    duplicate = json['Duplicate'];
    expired = json['Expired'];
    habitationsId = json['Habitations_id'];
    informedPerson = json['InformedPerson'];
    informedPersonForDissident = json['InformedPersonForDissident'];
    interestToJoinParty = json['InterestToJoinParty'];
    isInfluencer = json['IsInfluencer'];
    isVoted = json['IsVoted'];
    nonLocalAddress = json['Non_Local_Address'];
    otherparty = json['Otherparty'];
    partyInclinationId = json['PartyInclination_id'];
    physicallyChallenged = json['PhysicallyChallenged'];
    postelBallot = json['PostelBallot'];
    profession = json['Profession'];
    strength = json['Strength'];
    userIdId = json['UserId_id'];
    weakness = json['Weakness'];
    workerIdId = json['WorkerId_id'];
    influencedVoters = json['influenced_Voters'];
    outsideVoter = json['outside_voter'];
    insideVoter = json['inside_voter'];
    pollingStationNumber = json['Polling_Station_Number'];
    pollingStationLocation = json['Polling_Station_Location'];
    ivinId = json['ivin_id'];
    pinCode = json['Pin_Code'];
    mainTownORVillage = json['Main_Town_OR_Village'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
  }
  String? voterSerialNumber;
  String? voterId;
  String? name;
  String? guardian;
  String? home;
  String? age;
  String? gender;
  String? assemblyConstituencyNoAndName;
  String? constituency;
  String? state;
  String? pdfName;
  String? postOffice;
  String? policeStation;
  String? mandal;
  String? revenueDivision;
  String? district;
  String? sectionNoAndName;
  String? oldVoterid;
  String? pollingStationName;
  dynamic caste;
  dynamic commentsForDissident;
  dynamic commentsForJoinParty;
  dynamic commentsForTeamContacted;
  dynamic contactMode;
  dynamic contactNumber;
  dynamic contactedBy;
  dynamic createdBy;
  dynamic currentAddress;
  dynamic deleted;
  dynamic dissident;
  dynamic duplicate;
  dynamic expired;
  dynamic habitationsId;
  dynamic informedPerson;
  dynamic informedPersonForDissident;
  dynamic interestToJoinParty;
  dynamic isInfluencer;
  bool? isVoted;
  dynamic nonLocalAddress;
  dynamic otherparty;
  num? partyInclinationId;
  dynamic physicallyChallenged;
  dynamic postelBallot;
  dynamic profession;
  dynamic strength;
  dynamic userIdId;
  dynamic weakness;
  dynamic workerIdId;
  dynamic influencedVoters;
  dynamic outsideVoter;
  dynamic insideVoter;
  String? pollingStationNumber;
  String? pollingStationLocation;
  num? ivinId;
  String? pinCode;
  String? mainTownORVillage;
  String? firstName;
  String? lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Voter_SerialNumber'] = voterSerialNumber;
    map['VoterId'] = voterId;
    map['Name'] = name;
    map['Guardian'] = guardian;
    map['Home'] = home;
    map['Age'] = age;
    map['Gender'] = gender;
    map['Assembly_Constituency_No_and_Name'] = assemblyConstituencyNoAndName;
    map['Constituency'] = constituency;
    map['State'] = state;
    map['pdf_name'] = pdfName;
    map['Post_Office'] = postOffice;
    map['Police_Station'] = policeStation;
    map['Mandal'] = mandal;
    map['Revenue_Division'] = revenueDivision;
    map['District'] = district;
    map['Section_No_and_Name'] = sectionNoAndName;
    map['Old_Voterid'] = oldVoterid;
    map['Polling_Station_Name'] = pollingStationName;
    map['Caste'] = caste;
    map['CommentsForDissident'] = commentsForDissident;
    map['CommentsForJoinParty'] = commentsForJoinParty;
    map['CommentsForTeamContacted'] = commentsForTeamContacted;
    map['ContactMode'] = contactMode;
    map['ContactNumber'] = contactNumber;
    map['ContactedBy'] = contactedBy;
    map['CreatedBy'] = createdBy;
    map['CurrentAddress'] = currentAddress;
    map['Deleted'] = deleted;
    map['Dissident'] = dissident;
    map['Duplicate'] = duplicate;
    map['Expired'] = expired;
    map['Habitations_id'] = habitationsId;
    map['InformedPerson'] = informedPerson;
    map['InformedPersonForDissident'] = informedPersonForDissident;
    map['InterestToJoinParty'] = interestToJoinParty;
    map['IsInfluencer'] = isInfluencer;
    map['IsVoted'] = isVoted;
    map['Non_Local_Address'] = nonLocalAddress;
    map['Otherparty'] = otherparty;
    map['PartyInclination_id'] = partyInclinationId;
    map['PhysicallyChallenged'] = physicallyChallenged;
    map['PostelBallot'] = postelBallot;
    map['Profession'] = profession;
    map['Strength'] = strength;
    map['UserId_id'] = userIdId;
    map['Weakness'] = weakness;
    map['WorkerId_id'] = workerIdId;
    map['influenced_Voters'] = influencedVoters;
    map['outside_voter'] = outsideVoter;
    map['inside_voter'] = insideVoter;
    map['Polling_Station_Number'] = pollingStationNumber;
    map['Polling_Station_Location'] = pollingStationLocation;
    map['ivin_id'] = ivinId;
    map['Pin_Code'] = pinCode;
    map['Main_Town_OR_Village'] = mainTownORVillage;
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    return map;
  }

}