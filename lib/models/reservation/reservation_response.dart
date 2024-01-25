class ReservationResponse {
  List<Data>? data;
  Meta? meta;

  ReservationResponse({this.data, this.meta});

  ReservationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
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
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    psychologist = json['psychologist'] != null
        ? Psychologist.fromJson(json['psychologist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['meetingDate'] = meetingDate;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['isActive'] = isActive;
    data['meetingId'] = meetingId;
    if (client != null) {
      data['client'] = client!.toJson();
    }
    if (psychologist != null) {
      data['psychologist'] = psychologist!.toJson();
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
  Role? role; // Eğer Role bilgisini de almak isterseniz ekleyebilirsiniz.

  Client(
      {this.id,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.createdAt,
      this.updatedAt,
      this.role});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['provider'] = provider;
    data['confirmed'] = confirmed;
    data['blocked'] = blocked;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    return data;
  }
}

class Role {
  int? id;
  String? name;
  String? description;
  String? type;
  String? createdAt;
  String? updatedAt;
  List<Permission>? permissions;

  Role(
      {this.id,
      this.name,
      this.description,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.permissions});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['permissions'] != null) {
      permissions = <Permission>[];
      json['permissions'].forEach((v) {
        permissions!.add(Permission.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (permissions != null) {
      data['permissions'] = permissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Permission {
  int? id;
  String? action;
  String? createdAt;
  String? updatedAt;
  Role? role;

  Permission({this.id, this.action, this.createdAt, this.updatedAt, this.role});

  Permission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    action = json['action'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['action'] = action;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (role != null) {
      data['role'] = role!.toJson();
    }
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
  Avatar? avatar;

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
      this.applicationStatus,
      this.avatar});

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
    avatar = json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['about'] = about;
    data['fullName'] = fullName;
    data['hourlyPrice'] = hourlyPrice;
    data['profession'] = profession;
    data['title'] = title;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['jobStartDate'] = jobStartDate;
    data['applicationStatus'] = applicationStatus;
    if (avatar != null) {
      data['avatar'] = avatar!.toJson();
    }
    return data;
  }
}

class Avatar {
  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  String? ext;
  String? mime;
  double? size;
  String? url;

  Avatar(
      {this.id,
      this.name,
      this.alternativeText,
      this.caption,
      this.width,
      this.height,
      this.ext,
      this.mime,
      this.size,
      this.url});

  Avatar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['alternativeText'] = alternativeText;
    data['caption'] = caption;
    data['width'] = width;
    data['height'] = height;
    data['ext'] = ext;
    data['mime'] = mime;
    data['size'] = size;
    data['url'] = url;
    return data;
  }
}

class Meta {
  int? totalCount;

  Meta({this.totalCount});

  Meta.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    return data;
  }
}
