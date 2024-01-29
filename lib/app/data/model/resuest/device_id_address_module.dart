class DeviceIDAddressModule {
  String? deviceId;
  String? iPAddress;

  DeviceIDAddressModule({this.deviceId, this.iPAddress});

  DeviceIDAddressModule.fromJson(Map<String, dynamic> json) {
    deviceId = json['DeviceId'];
    iPAddress = json['IP_Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DeviceId'] = this.deviceId;
    data['IP_Address'] = this.iPAddress;
    return data;
  }
}
