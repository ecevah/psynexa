class DetailDart {
  DetailDart({
    required this.data,
    required this.meta,
  });
  late final Data data;
  late final Meta meta;

  DetailDart.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    meta = Meta.fromJson(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['meta'] = meta.toJson();
    return _data;
  }
}

class Data {
  Data({
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
    required this.avatar,
    required this.comments,
    required this.user,
    required this.clients,
    required this.meetings,
    this.documents,
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
  late final Avatar avatar;
  late final List<dynamic> comments;
  late final User user;
  late final List<Clients> clients;
  late final List<dynamic> meetings;
  late final Null documents;

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
    applicationStatus = null;
    avatar = Avatar.fromJson(json['avatar']);
    comments = List.castFrom<dynamic, dynamic>(json['comments']);
    user = User.fromJson(json['user']);
    clients =
        List.from(json['clients']).map((e) => Clients.fromJson(e)).toList();
    meetings = List.castFrom<dynamic, dynamic>(json['meetings']);
    documents = null;
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
    _data['avatar'] = avatar.toJson();
    _data['comments'] = comments;
    _data['user'] = user.toJson();
    _data['clients'] = clients.map((e) => e.toJson()).toList();
    _data['meetings'] = meetings;
    _data['documents'] = documents;
    return _data;
  }
}

class Avatar {
  Avatar({
    required this.id,
    required this.name,
    this.alternativeText,
    this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    this.previewUrl,
    required this.provider,
    this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final Null alternativeText;
  late final Null caption;
  late final int width;
  late final int height;
  late final Formats formats;
  late final String hash;
  late final String ext;
  late final String mime;
  late final double size;
  late final String url;
  late final Null previewUrl;
  late final String provider;
  late final Null providerMetadata;
  late final String createdAt;
  late final String updatedAt;

  Avatar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeText = null;
    caption = null;
    width = json['width'];
    height = json['height'];
    formats = Formats.fromJson(json['formats']);
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = null;
    provider = json['provider'];
    providerMetadata = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['alternativeText'] = alternativeText;
    _data['caption'] = caption;
    _data['width'] = width;
    _data['height'] = height;
    _data['formats'] = formats.toJson();
    _data['hash'] = hash;
    _data['ext'] = ext;
    _data['mime'] = mime;
    _data['size'] = size;
    _data['url'] = url;
    _data['previewUrl'] = previewUrl;
    _data['provider'] = provider;
    _data['provider_metadata'] = providerMetadata;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Formats {
  Formats({
    required this.thumbnail,
  });
  late final Thumbnail thumbnail;

  Formats.fromJson(Map<String, dynamic> json) {
    thumbnail = Thumbnail.fromJson(json['thumbnail']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['thumbnail'] = thumbnail.toJson();
    return _data;
  }
}

class Thumbnail {
  Thumbnail({
    required this.name,
    required this.hash,
    required this.ext,
    required this.mime,
    this.path,
    required this.width,
    required this.height,
    required this.size,
    required this.url,
  });
  late final String name;
  late final String hash;
  late final String ext;
  late final String mime;
  late final Null path;
  late final int width;
  late final int height;
  late final double size;
  late final String url;

  Thumbnail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    path = null;
    width = json['width'];
    height = json['height'];
    size = json['size'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['hash'] = hash;
    _data['ext'] = ext;
    _data['mime'] = mime;
    _data['path'] = path;
    _data['width'] = width;
    _data['height'] = height;
    _data['size'] = size;
    _data['url'] = url;
    return _data;
  }
}

class User {
  User({
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

class Clients {
  Clients({
    required this.id,
    required this.birthday,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.fullName,
    this.totalAnalysis,
  });
  late final int id;
  late final String birthday;
  late final String gender;
  late final String createdAt;
  late final String updatedAt;
  late final String fullName;
  late final Null totalAnalysis;

  Clients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    birthday = json['birthday'];
    gender = json['gender'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    fullName = json['fullName'];
    totalAnalysis = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['birthday'] = birthday;
    _data['gender'] = gender;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['fullName'] = fullName;
    _data['totalAnalysis'] = totalAnalysis;
    return _data;
  }
}

class Meta {
  Meta();

  Meta.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}
