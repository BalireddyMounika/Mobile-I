class LoginRequest {
  LoginRequest({
    this.email,
    this.password,
  });

  LoginRequest.fromJson(dynamic json) {
    email = json['Email'];
    password = json['Password'];
  }
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Email'] = email;
    map['Password'] = password;
    return map;
  }
}
