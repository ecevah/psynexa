import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_appbar.dart';
import 'package:Psynexa/components/custom_fav_listTile.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<_FawListTileModel> fawList = [
    _FawListTileModel(
      title: "Prof. Dr. Ali Durmaz",
      imagePath: Assets.images.imKariPNG,
      number: 123421,
      rol: "Travma Sonrası Stres Bozukluğu",
      oran: 4.5,
    ),
    _FawListTileModel(
      title: "Prof. Dr. Ali Durmaz",
      imagePath: Assets.images.imKariPNG,
      number: 123421,
      rol: "Travma Sonrası Stres Bozukluğu",
      oran: 4.5,
    ),
    _FawListTileModel(
      title: "Prof. Dr. Ali Durmaz",
      imagePath: Assets.images.imKariPNG,
      number: 123421,
      rol: "Travma Sonrası Stres Bozukluğu",
      oran: 4.5,
    ),
    _FawListTileModel(
      title: "Prof. Dr. Ali Durmaz",
      imagePath: Assets.images.imKariPNG,
      number: 123421,
      rol: "Travma Sonrası Stres Bozukluğu",
      oran: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: "Favori Psikologlar",
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: ListView.builder(
          itemCount: fawList.length,
          itemBuilder: (BuildContext context, int index) {
            return listOge(
              title: fawList[index].title,
              imagePath: fawList[index].imagePath,
              number: fawList[index].number,
              rol: fawList[index].rol,
              float: fawList[index].oran,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}

class _FawListTileModel {
  String title;
  String rol;
  int number;
  String imagePath;
  double oran;
  _FawListTileModel(
      {required this.title,
      required this.imagePath,
      required this.number,
      required this.rol,
      required this.oran});
}
