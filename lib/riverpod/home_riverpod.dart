import 'package:Psynexa/models/reservation/reservation_list.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/models/home_model.dart';

class HomePageRiverpod extends ChangeNotifier {
  bool isSelect = true;

  HomePsycCategoryModel psycCategory = HomePsycCategoryModel(
    category: [
      HomeCategoryModel(
          text: 'Çocuk ve Ergen Psikologları', onTap: () {}, select: false),
      HomeCategoryModel(
          text: 'Evlilik ve Aile Terapistleri', onTap: () {}, select: false),
      HomeCategoryModel(text: 'Nöropsikologlar', onTap: () {}, select: false),
      HomeCategoryModel(
          text: 'İş ve Kurumsal Psikologlar', onTap: () {}, select: false),
      HomeCategoryModel(
          text: 'Sağlık Psikologları', onTap: () {}, select: false),
      HomeCategoryModel(text: 'Spor Psikologları', onTap: () {}, select: false),
    ],
  );

  int currentIndex = 0;
  int notification = 3;

  List<ResListModel> resList = [];
  List<ResListModel> aktifList = [];
  List<ResListModel> pasifList = [];
  List<String> nameSurname = [];

  void setList(ResListModel index, int current) {
    resList.add(index);
    currentIndex = current;
    notifyListeners();
  }

  void setNoti() {
    notification = 0;
    notifyListeners();
  }

  void setName(String string) {
    nameSurname = string.split(' ');
    notifyListeners();
  }

  void setLastAfter(List<ResListModel> index) {
    aktifList = index;
    notifyListeners();
  }

  void setBeforeAfter(List<ResListModel> index) {
    pasifList = index;
    notifyListeners();
  }
}
