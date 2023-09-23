class ReservationResponse {
  List<Data>? data;
  Meta? meta;

  ReservationResponse({this.data, this.meta});

  ReservationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  get title => null;

  get image => null;

  get rol => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? meetingDate;
  String? createdAt;
  String? updatedAt;
  bool? isActive;
  String? meetingId;
  Client? client;
  Psychologist? psychologist;

  Data(
      {this.id,
      this.meetingDate,
      this.createdAt,
      this.updatedAt,
      this.isActive,
      this.meetingId,
      this.client,
      this.psychologist});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    meetingDate = json['meetingDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isActive = json['isActive'];
    meetingId = json['meetingId'];
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
    psychologist = json['psychologist'] != null
        ? new Psychologist.fromJson(json['psychologist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['meetingDate'] = this.meetingDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isActive'] = this.isActive;
    data['meetingId'] = this.meetingId;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    if (this.psychologist != null) {
      data['psychologist'] = this.psychologist!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  String? createdAt;
  String? updatedAt;

  Client(
      {this.id,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.createdAt,
      this.updatedAt});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['provider'] = this.provider;
    data['confirmed'] = this.confirmed;
    data['blocked'] = this.blocked;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Psychologist {
  int? id;
  String? about;
  String? fullName;
  int? hourlyPrice;
  String? profession;
  String? title;
  String? createdAt;
  String? updatedAt;
  String? jobStartDate;
  Null? applicationStatus;

  Psychologist(
      {this.id,
      this.about,
      this.fullName,
      this.hourlyPrice,
      this.profession,
      this.title,
      this.createdAt,
      this.updatedAt,
      this.jobStartDate,
      this.applicationStatus});

  Psychologist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    about = json['about'];
    fullName = json['fullName'];
    hourlyPrice = json['hourlyPrice'];
    profession = json['profession'];
    title = json['title'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    jobStartDate = json['jobStartDate'];
    applicationStatus = json['applicationStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['about'] = this.about;
    data['fullName'] = this.fullName;
    data['hourlyPrice'] = this.hourlyPrice;
    data['profession'] = this.profession;
    data['title'] = this.title;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['jobStartDate'] = this.jobStartDate;
    data['applicationStatus'] = this.applicationStatus;
    return data;
  }
}

class Meta {
  Pagination? pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({this.page, this.pageSize, this.pageCount, this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    pageCount = json['pageCount'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['pageSize'] = this.pageSize;
    data['pageCount'] = this.pageCount;
    data['total'] = this.total;
    return data;
  }
}
