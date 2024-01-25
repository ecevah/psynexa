class search_doctor_model {
  List<Data>? data;
  Meta? meta;

  search_doctor_model({this.data, this.meta});

  search_doctor_model.fromJson(Map<String, dynamic> json) {
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
  List<Null>? comments;
  User? user;
  List<Clients>? clients;
  List<Null>? meetings;
  Null? documents;

  Data(
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
      this.avatar,
      this.comments,
      this.user,
      this.clients,
      this.meetings,
      this.documents});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['comments'] != null) {
      comments = <Null>[];
      json['comments'].forEach((v) {});
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['clients'] != null) {
      clients = <Clients>[];
      json['clients'].forEach((v) {
        clients!.add(Clients.fromJson(v));
      });
    }
    if (json['meetings'] != null) {
      meetings = <Null>[];
      json['meetings'].forEach((v) {});
    }
    documents = json['documents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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

    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (clients != null) {
      data['clients'] = clients!.map((v) => v.toJson()).toList();
    }
    data['documents'] = documents;
    return data;
  }
}

class Avatar {
  int? id;
  String? name;
  Null? alternativeText;
  Null? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  Null? previewUrl;
  String? provider;
  Null? providerMetadata;
  String? createdAt;
  String? updatedAt;

  Avatar(
      {this.id,
      this.name,
      this.alternativeText,
      this.caption,
      this.width,
      this.height,
      this.formats,
      this.hash,
      this.ext,
      this.mime,
      this.size,
      this.url,
      this.previewUrl,
      this.provider,
      this.providerMetadata,
      this.createdAt,
      this.updatedAt});

  Avatar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats =
        json['formats'] != null ? Formats.fromJson(json['formats']) : null;
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    providerMetadata = json['provider_metadata'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['alternativeText'] = alternativeText;
    data['caption'] = caption;
    data['width'] = width;
    data['height'] = height;
    if (formats != null) {
      data['formats'] = formats!.toJson();
    }
    data['hash'] = hash;
    data['ext'] = ext;
    data['mime'] = mime;
    data['size'] = size;
    data['url'] = url;
    data['previewUrl'] = previewUrl;
    data['provider'] = provider;
    data['provider_metadata'] = providerMetadata;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Formats {
  Thumbnail? thumbnail;

  Formats({this.thumbnail});

  Formats.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    return data;
  }
}

class Thumbnail {
  String? name;
  String? hash;
  String? ext;
  String? mime;
  Null? path;
  int? width;
  int? height;
  double? size;
  String? url;

  Thumbnail(
      {this.name,
      this.hash,
      this.ext,
      this.mime,
      this.path,
      this.width,
      this.height,
      this.size,
      this.url});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    path = json['path'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['hash'] = hash;
    data['ext'] = ext;
    data['mime'] = mime;
    data['path'] = path;
    data['width'] = width;
    data['height'] = height;
    data['size'] = size;
    data['url'] = url;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['provider'] = provider;
    data['confirmed'] = confirmed;
    data['blocked'] = blocked;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Clients {
  int? id;
  String? birthday;
  String? gender;
  String? createdAt;
  String? updatedAt;
  String? fullName;
  Null? totalAnalysis;

  Clients(
      {this.id,
      this.birthday,
      this.gender,
      this.createdAt,
      this.updatedAt,
      this.fullName,
      this.totalAnalysis});

  Clients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    birthday = json['birthday'];
    gender = json['gender'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    fullName = json['fullName'];
    totalAnalysis = json['totalAnalysis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['fullName'] = fullName;
    data['totalAnalysis'] = totalAnalysis;
    return data;
  }
}

class Meta {
  Pagination? pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['pageCount'] = pageCount;
    data['total'] = total;
    return data;
  }
}
