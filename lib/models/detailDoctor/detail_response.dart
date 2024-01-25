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
  late final dynamic applicationStatus;
  late final Avatar avatar;
  late final List<dynamic> comments;
  late final User user;
  late final List<Clients> clients;
  late final List<dynamic> meetings;
  late final dynamic documents;

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
    avatar = Avatar.fromJson(json['avatar']);
    comments = List.castFrom<dynamic, dynamic>(json['comments']);
    user = User.fromJson(json['user']);
    clients =
        List.from(json['clients']).map((e) => Clients.fromJson(e)).toList();
    meetings = List.castFrom<dynamic, dynamic>(json['meetings']);
    documents = json['documents'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
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
    data['avatar'] = avatar.toJson();
    data['comments'] = comments;
    data['user'] = user.toJson();
    data['clients'] = clients.map((e) => e.toJson()).toList();
    data['meetings'] = meetings;
    data['documents'] = documents;
    return data;
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
  late final dynamic alternativeText;
  late final dynamic caption;
  late final int width;
  late final int height;
  late final dynamic formats;
  late final String hash;
  late final String ext;
  late final String mime;
  late final double size;
  late final String url;
  late final dynamic previewUrl;
  late final String provider;
  late final dynamic providerMetadata;
  late final String createdAt;
  late final String updatedAt;

  Avatar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats = json['formats'];
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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['alternativeText'] = alternativeText;
    data['caption'] = caption;
    data['width'] = width;
    data['height'] = height;
    data['formats'] = formats;
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
    final data = <String, dynamic>{};
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
  late final dynamic totalAnalysis;

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
    final data = <String, dynamic>{};
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
  Meta();

  Meta.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}
