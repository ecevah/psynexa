class reservations {
  bool? status;
  String? message;
  List<Reservation>? reservation;

  reservations({this.status, this.message, this.reservation});

  reservations.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['reservation'] != null) {
      reservation = <Reservation>[];
      json['reservation'].forEach((v) {
        reservation!.add(Reservation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (reservation != null) {
      data['reservation'] = reservation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reservation {
  String? sId;
  String? day;
  PsycId? psycId;
  ClientId? clientId;
  String? time;
  bool? payCheck;
  int? iV;

  Reservation(
      {this.sId,
      this.day,
      this.psycId,
      this.clientId,
      this.time,
      this.payCheck,
      this.iV});

  Reservation.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    day = json['day'];
    psycId = json['psyc_id'] != null ? PsycId.fromJson(json['psyc_id']) : null;
    clientId =
        json['client_id'] != null ? ClientId.fromJson(json['client_id']) : null;
    time = json['time'];
    payCheck = json['payCheck'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['day'] = day;
    if (psycId != null) {
      data['psyc_id'] = psycId!.toJson();
    }
    if (clientId != null) {
      data['client_id'] = clientId!.toJson();
    }
    data['time'] = time;
    data['payCheck'] = payCheck;
    data['__v'] = iV;
    return data;
  }
}

class PsycId {
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

  PsycId(
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

  PsycId.fromJson(Map<String, dynamic> json) {
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

class ClientId {
  String? sId;
  String? name;
  String? surName;
  String? pass;
  String? eMail;
  String? sex;
  List<String>? favorites;
  int? number;
  String? dateOfBirth;
  String? createAt;
  int? iV;

  ClientId(
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

  ClientId.fromJson(Map<String, dynamic> json) {
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
    if (favorites != null) {}
    data['number'] = number;
    data['dateOfBirth'] = dateOfBirth;
    data['createAt'] = createAt;
    data['__v'] = iV;
    return data;
  }
}
