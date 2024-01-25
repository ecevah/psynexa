class UserRequestModel {
  String? username;
  String? password;

  UserRequestModel({this.username, this.password});

  UserRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['identifier'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = username;
    data['password'] = password;
    return data;
  }
}
