class Post {
  final String id, name, emial;
  Post({required this.emial, required this.id, required this.name});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(emial: json["email"], id: json["uid"], name: json["name"]);
  }
}
