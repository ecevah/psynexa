class FirstPageModel {
  List<FirstCardModel> card;
  FirstPageModel({required this.card});
}

class FirstCardModel {
  String title;
  String text;
  FirstCardModel({required this.text, required this.title});
}
