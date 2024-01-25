class Psychologist {
  String id;
  String name;
  String surName;
  String pass;
  String eMail;
  List<String> tag;
  String image;
  String unvan;
  List<dynamic> star;
  List<dynamic> starAvg;
  bool active;
  bool accActive;
  String createAt;
  String updateAt;
  int v;

  Psychologist({
    required this.id,
    required this.name,
    required this.surName,
    required this.pass,
    required this.eMail,
    required this.tag,
    required this.image,
    required this.unvan,
    required this.star,
    required this.starAvg,
    required this.active,
    required this.accActive,
    required this.createAt,
    required this.updateAt,
    required this.v,
  });

  factory Psychologist.fromJson(Map<String, dynamic> json) {
    return Psychologist(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      surName: json['surName'] ?? '',
      pass: json['pass'] ?? '',
      eMail: json['eMail'] ?? '',
      tag: List<String>.from(json['tag'] ?? []),
      image: json['image'] ?? '',
      unvan: json['unvan'] ?? '',
      star: List<dynamic>.from(json['star'] ?? []),
      starAvg: List<dynamic>.from(json['starAvg'] ?? []),
      active: json['active'] ?? false,
      accActive: json['accActive'] ?? false,
      createAt: json['createAt'] ?? '',
      updateAt: json['updateAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }
}

class PsychologistResponse {
  bool status;
  String message;
  Psychologist value;

  PsychologistResponse({
    required this.status,
    required this.message,
    required this.value,
  });

  factory PsychologistResponse.fromJson(Map<String, dynamic> json) {
    return PsychologistResponse(
      status: json['status'],
      message: json['message'],
      value: Psychologist.fromJson(json['value']),
    );
  }
}
