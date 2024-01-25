import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_appbar.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

List<_FawListTileModel> fawList = [
  _FawListTileModel(
    id: 'sadsad',
    title: "Prof. Dr. Ali Durmaz",
    imagePath: Assets.images.imKariPNG,
    number: 20,
    rol: "Travma Sonrası Stres Bozukluğu",
    oran: 4.5,
  ),
  _FawListTileModel(
    id: 'sadsad',
    title: "Dr. Ayşe Aksu",
    imagePath: Assets.images.pp1PNG,
    number: 59,
    rol: "Travma Sonrası Stres Bozukluğu",
    oran: 4.3,
  ),
  _FawListTileModel(
    id: 'sadsad',
    title: "Esra Sarı",
    imagePath: Assets.images.pp2PNG,
    number: 153,
    rol: "Travma Sonrası Stres Bozukluğu",
    oran: 5,
  ),
  _FawListTileModel(
    id: 'sadsad',
    title: "Ayça Erdem",
    imagePath: Assets.images.pp3PNG,
    number: 123421,
    rol: "Travma Sonrası Stres Bozukluğu",
    oran: 3.2,
  ),
];

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appbarTitle: "Favori Psikologlar",
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: fawList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 19),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      style: BorderStyle.solid,
                      width: 1,
                      color: const Color(0xFFEAEAEF)),
                  color: Constant.white,
                ),
                child: ListTile(
                  title: Text(
                    fawList[index].title,
                    style: const TextStyle(
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
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RatingStars(
                            valueLabelVisibility: false,
                            value: fawList[index].oran,
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
                            starOffColor:
                                const Color.fromARGB(70, 255, 235, 59),
                            starColor: Colors.yellow,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3, bottom: 1),
                            child: Text(
                              '${fawList[index].oran} (${fawList[index].number} Oylama)',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5),
                                fontFamily: 'Proxima Nova',
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        fawList[index].rol,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.35),
                          fontFamily: 'Proxima Nova',
                        ),
                      ),
                    ],
                  ),
                  trailing: GrockContainer(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: IntrinsicHeight(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 25.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 36),
                                  width: MediaQuery.sizeOf(context).width - 48,
                                  height: 260,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/checkout/Unionalert.svg",
                                        height: 70,
                                        color:
                                            Constant.purple.withOpacity(0.65),
                                      ),
                                      Text(
                                        "Favorilerden çıkarmak\n istediğinize emin misiniz?",
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.65),
                                          fontSize: 15,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Proxima Nova',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                fawList.removeAt(index);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              height: 45,
                                              width: (MediaQuery.sizeOf(context)
                                                          .width -
                                                      126) /
                                                  1.6,
                                              decoration: BoxDecoration(
                                                color: Constant.purple
                                                    .withOpacity(0.10),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Favorilerimden Çıkar",
                                                  style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Constant.purple,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Proxima Nova',
                                                    letterSpacing: -0.1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              height: 45,
                                              width: (MediaQuery.sizeOf(context)
                                                          .width -
                                                      126) /
                                                  2.6,
                                              decoration: BoxDecoration(
                                                color: Constant.purple,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Vazgeçtim",
                                                  style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Proxima Nova',
                                                    letterSpacing: -0.1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: SvgPicture.asset(
                      Assets.icons.icHeartSVG,
                      width: 16,
                      height: 15,
                      color: const Color(0xFFD63928),
                    ),
                  ),
                  leading: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(fawList[index].imagePath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
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
  String id;

  _FawListTileModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.number,
    required this.rol,
    required this.oran,
  });
}
