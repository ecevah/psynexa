class HomePsycCategoryModel {
  List<HomeCategoryModel> category;
  HomePsycCategoryModel({required this.category});
}

class HomeCategoryModel {
  String text;
  Function onTap;
  bool select;
  HomeCategoryModel(
      {required this.text, required this.onTap, required this.select});
}
