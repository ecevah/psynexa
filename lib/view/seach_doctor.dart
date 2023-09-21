import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:Psynexa/view/psikiyatri_detay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Psynexa/riverpod/home_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Psynexa/models/searchDoctor/search_response.dart';

final homePageRiverpod = ChangeNotifierProvider((ref) => HomePageRiverpod());

class SearchDoctor extends ConsumerStatefulWidget {
  const SearchDoctor({super.key});

  @override
  ConsumerState<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends ConsumerState<SearchDoctor> {
  final headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Authorization':
        'Bearer 0b6c05e02ee081f0f9d3d733e6dadefcc7d3e5bb2c10f3195927e2794002eefdf5f6f2774afeba9188a133385082a36818baca38f93bf05be5a9c68672a84f3efde436ce64afeedf5e3d79f36980e9e8cd9ed4f41939dd2a666f386118604991d5ada44ca4ca9c02881e1692e8cd5ad4f6016cea4390fb0931ae7c3ae9ad573e'
  };
  Future fetchData() async {
    final response = await http.get(
        Uri.parse('${Constant.domain}/api/psychologists?populate=*'),
        headers: headers);

    if (response.statusCode == 200) {
      // API'den gelen veriyi JSON formatından dönüştürün
      final data = json.decode(response.body);
      final userResponse = search_doctor_model.fromJson(data);
      // Veriyi kullanmak için burada işlemler yapabilirsiniz
      for (int i = 0; i < userResponse.data!.length; i++)
        list.add(_listTileModel(
            float: ((2 + random.nextDouble() * (5 - 2)) * 100).roundToDouble() /
                100,
            imagePath:
                '${Constant.domain}${userResponse.data![i].avatar!.url!}',
            number: (1 + random.nextInt(1000 - 1 + 1)),
            rol: userResponse.data![i].title.toString(),
            title: userResponse.data![i].fullName.toString(),
            id: userResponse.data![i].id!));
      setState(() {
        list;
      });
    } else {
      // Hata durumunda işlem yapabilirsiniz
      throw Exception('API isteği başarısız oldu');
    }
  }

  List<_listTileModel> list = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAccAppBar(appbarTitle: 'Psikolog Ara'),
      body: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 10),
        child: SingleChildScrollView(
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
                          labelStyle:
                              const TextStyle(color: Constant.inputText),
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
                            color: Constant.black,
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
                      physics: BouncingScrollPhysics(),
                      children: [
                        for (int i = 0; i < list.length; i++)
                          _ListTileCard(
                              float: list[i].float,
                              imagePath: list[i].imagePath,
                              number: list[i].number,
                              rol: list[i].rol,
                              title: list[i].title,
                              id: list[i].id)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
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
  int id;

  _listTileModel(
      {required this.float,
      required this.imagePath,
      required this.number,
      required this.rol,
      required this.title,
      required this.id});
}

class _ListTileCard extends StatelessWidget {
  String title;
  double float;
  int number;
  String rol;
  String imagePath;
  int id;

  _ListTileCard(
      {super.key,
      required this.float,
      required this.imagePath,
      required this.number,
      required this.rol,
      required this.title,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 19),
      child: GrockContainer(
        onTap: () {
          Grock.to(DetayPsikiyatri(id: id));
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
                image: NetworkImage(imagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppbarCard {
  final String text;
  bool isSelected;

  _AppbarCard({required this.text, required this.isSelected});
}

class _appbarCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _appbarCard({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        backgroundColor: isSelected ? Constant.purple : Constant.white,
        label: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            fontFamily: 'Proxima Nova',
            height: 0.8,
            color: isSelected ? Colors.white : Constant.black,
          ),
        ),
        shape: StadiumBorder(
          side: BorderSide(color: isSelected ? Constant.purple : Constant.gray),
        ),
      ),
    );
  }
}
