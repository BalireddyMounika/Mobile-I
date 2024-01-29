class GenericResponse {
  GenericResponse({
    this.message,
    this.result,
    this.hasError,
    this.status,
  });

  GenericResponse.fromJson(dynamic json) {
    message = json['Message'];
    result = json['Result'];
    hasError = json['HasError'];
    status = json['Status'];
  }
  String? message;
  dynamic result;
  bool? hasError;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Message'] = message;
    map['Result'] = result;
    map['HasError'] = hasError;
    map['Status'] = status;
    return map;
  }
}
