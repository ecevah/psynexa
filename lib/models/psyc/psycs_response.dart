class Psycs {
  bool? status;
  String? message;
  List<Psychologists>? psychologists;

  Psycs({this.status, this.message, this.psychologists});

  Psycs.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['psychologists'] != null) {
      psychologists = <Psychologists>[];
      json['psychologists'].forEach((v) {
        psychologists!.add(Psychologists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (psychologists != null) {
      data['psychologists'] = psychologists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Psychologists {
  String? sId;
  String? name;
  String? surName;
  String? pass;
  String? eMail;
  List<String>? tag;
  String? image;
  String? unvan;
  List<int>? star;
  List<double>? starAvg;
  bool? active;
  bool? accActive;
  String? createAt;
  String? updateAt;
  int? iV;

  Psychologists(
      {this.sId,
      this.name,
      this.surName,
      this.pass,
      this.eMail,
      this.tag,
      this.image,
      this.unvan,
      this.star,
      this.starAvg,
      this.active,
      this.accActive,
      this.createAt,
      this.updateAt,
      this.iV});

  Psychologists.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    surName = json['surName'];
    pass = json['pass'];
    eMail = json['eMail'];
    tag = json['tag'].cast<String>();
    image = json['image'];
    unvan = json['unvan'];
    star = json['star'].cast<int>();
    starAvg = json['starAvg'].cast<double>();
    active = json['active'];
    accActive = json['accActive'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['surName'] = surName;
    data['pass'] = pass;
    data['eMail'] = eMail;
    data['tag'] = tag;
    data['image'] = image;
    data['unvan'] = unvan;
    data['star'] = star;
    data['starAvg'] = starAvg;
    data['active'] = active;
    data['accActive'] = accActive;
    data['createAt'] = createAt;
    data['updateAt'] = updateAt;
    data['__v'] = iV;
    return data;
  }
}
