import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:grock/grock.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:Psynexa/view/psikiyatri_detay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Psynexa/riverpod/home_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Psynexa/models/psyc/psycs_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

final homePageRiverpod = ChangeNotifierProvider((ref) => HomePageRiverpod());

class SearchDoctor extends ConsumerStatefulWidget {
  const SearchDoctor({super.key});

  @override
  ConsumerState<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends ConsumerState<SearchDoctor> {
  Future fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.get(
        Uri.parse('${Constant.domain}/api/psyc/psycs'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'x-access-token': prefs.getString("token") ??
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwc3ljaG9sb2dpc3QiOnsiX2lkIjoiNjVhODI2NGUyMTY0ODg0ZWYyZjc1M2E5IiwibmFtZSI6IlBzeWMgQWhtZXQiLCJzdXJOYW1lIjoiRWNldml0IiwicGFzcyI6IiQyYSQwOCR1bVpYeTU3VXFudnVmdEZ4emZCNW8uSVN1QUFzNHk5b1BBYU1uR1YwWFRzVGdwakRjZVNMUyIsImVNYWlsIjoiZWVjZXZhaEBnbWFpbC5jb20iLCJ0YWciOlsidXptYW4iXSwiaW1hZ2UiOiJpbWFnZS0xNzA1NTE4NjcwODUwLmpwZWciLCJ1bnZhbiI6ImtsaW5payBwc2lrb2xvaCIsInN0YXIiOltdLCJzdGFyQXZnIjpbXSwiYWN0aXZlIjpmYWxzZSwiYWNjQWN0aXZlIjp0cnVlLCJjcmVhdGVBdCI6IjIwMjQtMDEtMTdUMTk6MTE6MTAuODcyWiIsInVwZGF0ZUF0IjoiMjAyNC0wMS0xN1QxOToxMToxMC44NzJaIiwiX192IjowfSwiaWF0IjoxNzA1NTIwMTM1fQ.ad3WLnfmxtpnob3kSqVRZHtUZuOv8nX-CMkQHHdRth4"
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final userResponse = Psycs.fromJson(data);

        for (int i = 0; i < userResponse.psychologists!.length; i++) {
          list.add(_listTileModel(
            float: userResponse.psychologists![i].starAvg!.isNotEmpty
                ? userResponse.psychologists![i].starAvg![0]
                : 0,
            imagePath:
                '${Constant.domain}/uploads/${userResponse.psychologists![i].image}',
            number: userResponse.psychologists![i].star!.length,
            rol: userResponse.psychologists![i].unvan.toString(),
            title:
                '${userResponse.psychologists![i].name} ${userResponse.psychologists![i].surName}',
            id: userResponse.psychologists![i].sId!,
          ));
        }

        setState(() {
          list;
        });
      } else {
        throw Exception('API isteği başarısız oldu');
      }
    } catch (error) {}
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
      appBar: const CustomAccAppBar(appbarTitle: 'Psikolog Ara'),
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
                          fillColor: const Color(0xFFF5F5F5),
                          hintStyle: const TextStyle(
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
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0, top: 23, left: 32),
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
                    height: MediaQuery.sizeOf(context).height - 207,
                    width: MediaQuery.sizeOf(context).width,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
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
  String id;

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
  String id;

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
          Grock.to(DetayPsikiyatri(
              id: id,
              float: float,
              number: number,
              imagePath: imagePath,
              rol: rol,
              title: title));
        },
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
            title,
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
                    starOffColor: const Color.fromARGB(70, 255, 235, 59),
                    starColor: Colors.yellow,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 1),
                    child: Text(
                      '$float ($number Oylama)',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(123, 0, 0, 0),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                rol,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Constant.black35,
                ),
              ),
            ],
          ),
          trailing: const Icon(
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
