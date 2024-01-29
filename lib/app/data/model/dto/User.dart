class User {
  User({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.mobileNumber,
    this.updatedOn,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    firstname = json['Firstname'];
    lastname = json['Lastname'];
    email = json['Email'];
    password = json['Password'];
    mobileNumber = json['MobileNumber'];
    updatedOn = json['UpdatedOn'];
    bearerToken = json['Bearer_Token'];
  }
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? mobileNumber;
  String? updatedOn;
  String? bearerToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['Firstname'] = firstname;
    map['Lastname'] = lastname;
    map['Email'] = email;
    map['Password'] = password;
    map['MobileNumber'] = mobileNumber;
    map['UpdatedOn'] = updatedOn;
    map['Bearer_Token'] = bearerToken;
    return map;
  }
}
