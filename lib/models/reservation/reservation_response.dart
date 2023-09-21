class ReservationResponse {
  ReservationResponse({
    required this.data,
    required this.meta,
  });
  late final List<Data> data;
  late final Meta meta;

  ReservationResponse.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    meta = Meta.fromJson(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['meta'] = meta.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.meetingDate,
    required this.createdAt,
    required this.updatedAt,
    this.isActive,
    this.meetingId,
    required this.client,
    this.psychologist,
  });
  late final int id;
  late final String meetingDate;
  late final String createdAt;
  late final String updatedAt;
  late final bool? isActive;
  late final String? meetingId;
  late final Client client;
  late final Psychologist? psychologist;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    meetingDate = json['meetingDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isActive = null;
    meetingId = null;
    client = Client.fromJson(json['client']);
    psychologist = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['meetingDate'] = meetingDate;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['isActive'] = isActive;
    _data['meetingId'] = meetingId;
    _data['client'] = client.toJson();
    _data['psychologist'] = psychologist;
    return _data;
  }
}

class Client {
  Client({
    required this.id,
    required this.username,
    required this.email,
    required this.provider,
    required this.confirmed,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String username;
  late final String email;
  late final String provider;
  late final bool confirmed;
  late final bool blocked;
  late final String createdAt;
  late final String updatedAt;

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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['provider'] = provider;
    _data['confirmed'] = confirmed;
    _data['blocked'] = blocked;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Psychologist {
  Psychologist({
    required this.id,
    required this.about,
    required this.fullName,
    required this.hourlyPrice,
    required this.profession,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.jobStartDate,
    this.applicationStatus,
  });
  late final int id;
  late final String about;
  late final String fullName;
  late final int hourlyPrice;
  late final String profession;
  late final String title;
  late final String createdAt;
  late final String updatedAt;
  late final String jobStartDate;
  late final Null applicationStatus;

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
    applicationStatus = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['about'] = about;
    _data['fullName'] = fullName;
    _data['hourlyPrice'] = hourlyPrice;
    _data['profession'] = profession;
    _data['title'] = title;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['jobStartDate'] = jobStartDate;
    _data['applicationStatus'] = applicationStatus;
    return _data;
  }
}

class Meta {
  Meta({
    required this.pagination,
  });
  late final Pagination pagination;

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = Pagination.fromJson(json['pagination']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pagination'] = pagination.toJson();
    return _data;
  }
}

class Pagination {
  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });
  late final int page;
  late final int pageSize;
  late final int pageCount;
  late final int total;

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    pageCount = json['pageCount'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['pageSize'] = pageSize;
    _data['pageCount'] = pageCount;
    _data['total'] = total;
    return _data;
  }
}
