// To parse this JSON data, do
//
//     final createProfileRequestModel = createProfileRequestModelFromJson(jsonString);

import 'dart:convert';

CreateProfileRequestModel createProfileRequestModelFromJson(String str) => CreateProfileRequestModel.fromJson(json.decode(str));

String createProfileRequestModelToJson(CreateProfileRequestModel data) => json.encode(data.toJson());

class CreateProfileRequestModel {
  final int userId;
  final String profilePicture;
  final String name;
  final DateTime dateOfBirth;
  final String placeOfBirth;
  final int age;
  final String gender;
  final String email;
  final String phoneNumber;
  final String address;
  final String city;
  final String state;
  final int pinCode;
  final String candidateBrief;
  final String slogan;

  CreateProfileRequestModel({
    required this.userId,
    required this.profilePicture,
    required this.name,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.age,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.state,
    required this.pinCode,
    required this.candidateBrief,
    required this.slogan,
  });

  factory CreateProfileRequestModel.fromJson(Map<String, dynamic> json) => CreateProfileRequestModel(
    userId: json["UserId"],
    profilePicture: json["ProfilePicture"],
    name: json["Name"],
    dateOfBirth: DateTime.parse(json["DateOfBirth"]),
    placeOfBirth: json["PlaceOfBirth"],
    age: json["Age"],
    gender: json["Gender"],
    email: json["Email"],
    phoneNumber: json["PhoneNumber"],
    address: json["Address"],
    city: json["City"],
    state: json["State"],
    pinCode: json["PinCode"],
    candidateBrief: json["Candidate_Brief"],
    slogan: json["Slogan"],
  );

  Map<String, dynamic> toJson() => {
    "UserId": userId,
    "ProfilePicture": profilePicture,
    "Name": name,
    "DateOfBirth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "PlaceOfBirth": placeOfBirth,
    "Age": age,
    "Gender": gender,
    "Email": email,
    "PhoneNumber": phoneNumber,
    "Address": address,
    "City": city,
    "State": state,
    "PinCode": pinCode,
    "Candidate_Brief": candidateBrief,
    "Slogan": slogan,
  };
}

// To parse this JSON data, do
//
//     final createPoliticalRequestModel = createPoliticalRequestModelFromJson(jsonString);


CreatePoliticalRequestModel createPoliticalRequestModelFromJson(String str) => CreatePoliticalRequestModel.fromJson(json.decode(str));

String createPoliticalRequestModelToJson(CreatePoliticalRequestModel data) => json.encode(data.toJson());

class CreatePoliticalRequestModel {
  final int candidatureInformationId;
  final int userId;
  final String partyName;
  final String officeHeld;
  final DateTime fromDate;
  final DateTime toDate;

  CreatePoliticalRequestModel({
    required this.candidatureInformationId,
    required this.userId,
    required this.partyName,
    required this.officeHeld,
    required this.fromDate,
    required this.toDate,
  });

  factory CreatePoliticalRequestModel.fromJson(Map<String, dynamic> json) => CreatePoliticalRequestModel(
    candidatureInformationId: json["CandidatureInformationId"],
    userId: json["UserId"],
    partyName: json["PartyName"],
    officeHeld: json["OfficeHeld"],
    fromDate: DateTime.parse(json["FromDate"]),
    toDate: DateTime.parse(json["ToDate"]),
  );

  Map<String, dynamic> toJson() => {
    "CandidatureInformationId": candidatureInformationId,
    "UserId": userId,
    "PartyName": partyName,
    "OfficeHeld": officeHeld,
    "FromDate": "${fromDate.year.toString().padLeft(4, '0')}-${fromDate.month.toString().padLeft(2, '0')}-${fromDate.day.toString().padLeft(2, '0')}",
    "ToDate": "${toDate.year.toString().padLeft(4, '0')}-${toDate.month.toString().padLeft(2, '0')}-${toDate.day.toString().padLeft(2, '0')}",
  };
}
