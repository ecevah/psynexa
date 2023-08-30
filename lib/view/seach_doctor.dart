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

  List<_musaitModel> musaitModel = [
    _musaitModel(
        float: 4.4,
        imagePath: Assets.images.imKariPNG,
        number: 3221,
        tecrube: 2,
        rol: 'Travma Sonrası Stres Bozukluğu',
        title: 'Prof. Dr. Ali Durmaz',
        price: 234.00),
    _musaitModel(
        float: 4.4,
        imagePath: Assets.images.imKariPNG,
        number: 3221,
        tecrube: 2,
        rol: 'Travma Sonrası Stres Bozukluğu',
        title: 'Prof. Dr. Ali Durmaz',
        price: 234.00),
    _musaitModel(
        float: 4.4,
        imagePath: Assets.images.imKariPNG,
        number: 3221,
        tecrube: 2,
        rol: 'Travma Sonrası Stres Bozukluğu',
        title: 'Prof. Dr. Ali Durmaz',
        price: 234.00),
    _musaitModel(
        float: 4.4,
        imagePath: Assets.images.imKariPNG,
        number: 3221,
        tecrube: 2,
        rol: 'Travma Sonrası Stres Bozukluğu',
        title: 'Prof. Dr. Ali Durmaz',
        price: 234.00),
  ];

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
      appBar: CustomAccAppBar(appbarTitle: 'Doktor Ara'),
      body: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 30),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    height: 34,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Constant.black35,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Constant.gray, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelStyle: const TextStyle(color: Constant.inputText),
                        focusColor: Constant.inputText,
                        hintText: 'Psikolog veya alan ara',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Constant.black35,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Proxima Nova',
                          letterSpacing: -0.2,
                          height: 1.7,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Constant.black35,
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
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 350,
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
            SizedBox(
              height: 250,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 15, left: 35),
                      child: Text(
                        'Müsait Psikologlar',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w500,
                          color: Constant.black75,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 206,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                        itemCount: musaitModel.length,
                        padding: EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 30,
                          right: 30,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return _musaitCard(
                              float: musaitModel[index].float,
                              oy: musaitModel[index].number,
                              rol: musaitModel[index].rol,
                              tectube: musaitModel[index].tecrube,
                              title: musaitModel[index].title,
                              price: musaitModel[index].price);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _musaitCard extends StatelessWidget {
  String title;
  String rol;
  double float;
  int oy;
  int tectube;
  double price;

  _musaitCard(
      {super.key,
      required this.float,
      required this.oy,
      required this.rol,
      required this.tectube,
      required this.title,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return GrockContainer(
      onTap: () {
        Grock.to(DetayPsikiyatri());
      },
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Constant.white,
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(130, 51, 51, 51),
              spreadRadius: 1,
              blurRadius: 2),
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 95,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.images.imKariPNG),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 58,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color(0xFF53C797),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Müsait',
                      style: TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.w500,
                          color: Constant.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Constant.black75,
                    letterSpacing: -0.2,
                    fontFamily: 'Proxima Nova',
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  rol,
                  style: TextStyle(
                    fontSize: 7,
                    fontWeight: FontWeight.w400,
                    color: Constant.black35,
                    letterSpacing: -0.1,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 9,
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Text(
                          '$float ($oy Oylama)',
                          style: TextStyle(
                            fontSize: 6,
                            fontWeight: FontWeight.w400,
                            color: Constant.black50,
                            fontFamily: 'Proxima Nova',
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.icDoubleCalendarSVG,
                          width: 9,
                          height: 9,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          '$tectube+ Tecrübe',
                          style: TextStyle(
                            fontSize: 6,
                            fontWeight: FontWeight.w400,
                            color: Constant.black50,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$price₺',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Constant.black,
                          fontFamily: 'Proxima Nova'),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Seans Başı',
                      style: TextStyle(
                        fontSize: 6,
                        fontWeight: FontWeight.w500,
                        color: Constant.black50,
                        fontFamily: 'Proxima Nova',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 35,
            decoration: BoxDecoration(
              color: Constant.purple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Randevu Al',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Constant.white,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                SvgPicture.asset(
                  Assets.icons.icBuyReservationSVG,
                  height: 15,
                  width: 15,
                )
              ],
            ),
          )
        ],
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

class _musaitModel {
  String title;
  double float;
  int number;
  int tecrube;
  String imagePath;
  double price;
  String rol;

  _musaitModel(
      {required this.rol,
      required this.float,
      required this.imagePath,
      required this.number,
      required this.tecrube,
      required this.title,
      required this.price});
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
    return GrockContainer(
      onTap: () {
        Grock.to(DetayPsikiyatri());
      },
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 17),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Constant.gray, width: 1),
        ),
        color: Constant.white,
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RatingStars(
                  valueLabelVisibility: false,
                  value: float,
                  starBuilder: (index, color) => Icon(
                    Icons.star,
                    color: color,
                    size: 10,
                  ),
                  starCount: 5,
                  starSize: 15,
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
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(123, 0, 0, 0),
                    ),
                  ),
                )
              ],
            ),
            Text(
              rol,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Constant.black35,
              ),
            ),
          ],
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
    );
  }
}
