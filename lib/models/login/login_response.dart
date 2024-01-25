class UserResponseModel {
  bool? status;
  String? message;
  String? token;
  Client? client;

  UserResponseModel({this.status, this.message, this.token, this.client});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    if (client != null) {
      data['client'] = client!.toJson();
    }
    return data;
  }
}

class Client {
  String? sId;
  String? name;
  String? surName;
  String? pass;
  String? eMail;
  String? sex;
  List<Null>? favorites;
  int? number;
  String? dateOfBirth;
  String? createAt;
  int? iV;

  Client(
      {this.sId,
      this.name,
      this.surName,
      this.pass,
      this.eMail,
      this.sex,
      this.favorites,
      this.number,
      this.dateOfBirth,
      this.createAt,
      this.iV});

  Client.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    surName = json['surName'];
    pass = json['pass'];
    eMail = json['eMail'];
    sex = json['sex'];
    number = json['number'];
    dateOfBirth = json['dateOfBirth'];
    createAt = json['createAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['surName'] = surName;
    data['pass'] = pass;
    data['eMail'] = eMail;
    data['sex'] = sex;
    data['number'] = number;
    data['dateOfBirth'] = dateOfBirth;
    data['createAt'] = createAt;
    data['__v'] = iV;
    return data;
  }
}
