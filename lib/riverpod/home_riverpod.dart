import 'package:flutter/material.dart';
import 'package:Psynexa/model/home_model.dart';

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
}
