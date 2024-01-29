import 'dart:convert';

class CommunicationRequestModel {
  final String? constituency;
  final String? pollingStationName;
  final String? name;
  final String? sectionNoAndName;
  final String? lastName;
  final String? home;
  final String? mandal;
  final String? voterId;
  final String? ivinIds;
  final String? caste;
  final String? contactNumber;
  final String? partyInclinationId;
  final String? profession;
  final String? contactMode;
  final String? nonLocalAddress;
  final String? dissident;
  final String? interestToJoinParty;
  final String? physicallyChallenged;
  final String? habitationsId;
  final String? communicationName;
  final String? discription;
  final String? communicationType;
  final String? textMessage;
  final String? email;
  final String? status;

  CommunicationRequestModel({
    this.constituency,
    this.pollingStationName,
    this.name,
    this.sectionNoAndName,
    this.lastName,
    this.home,
    this.mandal,
    this.voterId,
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
    this.communicationName,
    this.discription,
    this.communicationType,
    this.textMessage,
    this.email,
    this.status,
  });

  factory CommunicationRequestModel.fromJson(String str) => CommunicationRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommunicationRequestModel.fromMap(Map<String, dynamic> json) => CommunicationRequestModel(
    constituency: json["Constituency"],
    pollingStationName: json["PollingStationName"],
    name: json["Name"],
    sectionNoAndName: json["Section_No_and_Name"],
    lastName: json["LastName"],
    home: json["Home"],
    mandal: json["Mandal"],
    voterId: json["VoterId"],
    ivinIds: json["IvinIds"],
    caste: json["Caste"],
    contactNumber: json["ContactNumber"],
    partyInclinationId: json["PartyInclination_id"],
    profession: json["Profession"],
    contactMode: json["ContactMode"],
    nonLocalAddress: json["Non_Local_Address"],
    dissident: json["Dissident"],
    interestToJoinParty: json["InterestToJoinParty"],
    physicallyChallenged: json["PhysicallyChallenged"],
    habitationsId: json["Habitations_id"],
    communicationName: json["CommunicationName"],
    discription: json["Discription"],
    communicationType: json["CommunicationType"],
    textMessage: json["TextMessage"],
    email: json["Email"],
    status: json["Status"],
  );

  Map<String, dynamic> toMap() => {
    "Constituency": constituency,
    "PollingStationName": pollingStationName,
    "Name": name,
    "Section_No_and_Name": sectionNoAndName,
    "LastName": lastName,
    "Home": home,
    "Mandal": mandal,
    "VoterId": voterId,
    "IvinIds": ivinIds,
    "Caste": caste,
    "ContactNumber": contactNumber,
    "PartyInclination_id": partyInclinationId,
    "Profession": profession,
    "ContactMode": contactMode,
    "Non_Local_Address": nonLocalAddress,
    "Dissident": dissident,
    "InterestToJoinParty": interestToJoinParty,
    "PhysicallyChallenged": physicallyChallenged,
    "Habitations_id": habitationsId,
    "CommunicationName": communicationName,
    "Discription": discription,
    "CommunicationType": communicationType,
    "TextMessage": textMessage,
    "Email": email,
    "Status": status,
  };
}
