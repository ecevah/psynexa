import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:Psynexa/view/psikiyatri_detay.dart';

class SearchDoctor extends StatelessWidget {
  SearchDoctor({super.key});

  List<_listTileModel> listModel = [
    _listTileModel(
      float: 4.4,
      imagePath: Assets.images.imKariPNG,
      number: 3221,
      rol: 'Travma Sonrası Stres Bozukluğu',
      title: 'Prof. Dr. Ali Durmaz',
    ),
    _listTileModel(
      float: 4.2,
      imagePath: Assets.images.imKariPNG,
      number: 3221,
      rol: 'Travma Sonrası Stres Bozukluğu',
      title: 'Prof. Dr. Ali Durmaz',
    ),
    _listTileModel(
      float: 4.5,
      imagePath: Assets.images.imKariPNG,
      number: 3221,
      rol: 'Travma Sonrası Stres Bozukluğu',
      title: 'Prof. Dr. Ali Durmaz',
    ),
    _listTileModel(
      float: 4.4,
      imagePath: Assets.images.imKariPNG,
      number: 3221,
      rol: 'Travma Sonrası Stres Bozukluğu',
      title: 'Prof. Dr. Ali Durmaz',
    ),
    _listTileModel(
      float: 4.2,
      imagePath: Assets.images.imKariPNG,
      number: 3221,
      rol: 'Travma Sonrası Stres Bozukluğu',
      title: 'Prof. Dr. Ali Durmaz',
    ),
    _listTileModel(
      float: 4.5,
      imagePath: Assets.images.imKariPNG,
      number: 3221,
      rol: 'Travma Sonrası Stres Bozukluğu',
      title: 'Prof. Dr. Ali Durmaz',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAccAppBar(appbarTitle: 'Psikolog Ara'),
      body: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 10),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 34,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFF5F5F5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFF5F5F5), width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelStyle: const TextStyle(color: Constant.inputText),
                        focusColor: Constant.inputText,
                        hintText: 'Psikolog veya alan ara',
                        filled: true,
                        fillColor: Color(0xFFF5F5F5),
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8E8E92),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Proxima Nova',
                          letterSpacing: -0.2,
                          height: 1.4,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Constant.purple,
                          size: 21,
                        ),
                      ),
                      cursorColor: Constant.purple,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, top: 23, left: 32),
                  child: Text(
                    'Önde Gelen Uzmanlar',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w500,
                      color: Constant.black75,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height - 207,
                  width: MediaQuery.sizeOf(context).width,
                  child: ListView(
                    children: [
                      for (int i = 0; i < listModel.length; i++)
                        _ListTileCard(
                          float: listModel[i].float,
                          imagePath: listModel[i].imagePath,
                          number: listModel[i].number,
                          rol: listModel[i].rol,
                          title: listModel[i].title,
                        )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _listTileModel {
  String title;
  double float;
  int number;
  String rol;
  String imagePath;

  _listTileModel({
    required this.float,
    required this.imagePath,
    required this.number,
    required this.rol,
    required this.title,
  });
}

class _ListTileCard extends StatelessWidget {
  String title;
  double float;
  int number;
  String rol;
  String imagePath;

  _ListTileCard(
      {super.key,
      required this.float,
      required this.imagePath,
      required this.number,
      required this.rol,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 19),
      child: GrockContainer(
        onTap: () {
          Grock.to(DetayPsikiyatri());
        },
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              style: BorderStyle.solid, width: 1, color: Color(0xFFEAEAEF)),
          color: Constant.white,
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Constant.black75,
              fontFamily: 'Proxima Nova',
              letterSpacing: -0.2,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 3,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RatingStars(
                    valueLabelVisibility: false,
                    value: float,
                    starBuilder: (index, color) => Icon(
                      Icons.star,
                      color: color,
                      size: 9,
                    ),
                    starCount: 5,
                    starSize: 12,
                    maxValue: 5,
                    starSpacing: 0,
                    maxValueVisibility: true,
                    starOffColor: Color.fromARGB(70, 255, 235, 59),
                    starColor: Colors.yellow,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 1),
                    child: Text(
                      '$float ($number Oylama)',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(123, 0, 0, 0),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                rol,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Constant.black35,
                ),
              ),
            ],
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: Constant.black50,
          ),
          leading: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
