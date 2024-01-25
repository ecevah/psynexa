class ResListModel {
  String title;
  DateTime date;
  String rol;
  String image;
  String conferanceId;
  int star;

  ResListModel({
    required this.title,
    required this.date,
    required this.rol,
    required this.image,
    required this.conferanceId,
    int? star,
  }) : star = star ?? 0;
}
