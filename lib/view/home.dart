import 'package:Psynexa/components/reservation_active.dart';
import 'package:Psynexa/models/reservation/reservation_list.dart';
import 'package:Psynexa/models/reservation/reservations_response.dart';
import 'package:Psynexa/view/acc_reservation.dart';
import 'package:Psynexa/view/image.dart';
import 'package:Psynexa/view/test.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/riverpod/home_riverpod.dart';
import 'package:Psynexa/view/notification.dart';
import 'package:Psynexa/view/seach_doctor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

final homePageRiverpod = ChangeNotifierProvider((ref) => HomePageRiverpod());

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    solution();
  }

  List<ResListModel> aktiflist = [];
  Future fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse(
        '${Constant.domain}/api/reservation/find?client=${prefs.getString('id')}',
      ),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'x-access-token': prefs.getString("token") ??
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwc3ljaG9sb2dpc3QiOnsiX2lkIjoiNjVhODI2NGUyMTY0ODg0ZWYyZjc1M2E5IiwibmFtZSI6IlBzeWMgQWhtZXQiLCJzdXJOYW1lIjoiRWNldml0IiwicGFzcyI6IiQyYSQwOCR1bVpYeTU3VXFudnVmdEZ4emZCNW8uSVN1QUFzNHk5b1BBYU1uR1YwWFRzVGdwakRjZVNMUyIsImVNYWlsIjoiZWVjZXZhaEBnbWFpbC5jb20iLCJ0YWciOlsidXptYW4iXSwiaW1hZ2UiOiJpbWFnZS0xNzA1NTE4NjcwODUwLmpwZWciLCJ1bnZhbiI6ImtsaW5payBwc2lrb2xvaCIsInN0YXIiOltdLCJzdGFyQXZnIjpbXSwiYWN0aXZlIjpmYWxzZSwiYWNjQWN0aXZlIjp0cnVlLCJjcmVhdGVBdCI6IjIwMjQtMDEtMTdUMTk6MTE6MTAuODcyWiIsInVwZGF0ZUF0IjoiMjAyNC0wMS0xN1QxOToxMToxMC44NzJaIiwiX192IjowfSwiaWF0IjoxNzA1NTIwMTM1fQ.ad3WLnfmxtpnob3kSqVRZHtUZuOv8nX-CMkQHHdRth4"
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final userResponse = reservations.fromJson(data);

      for (int i = 0; i < userResponse.reservation!.length; i++) {
        try {
          // Adjust date parsing logic to handle different formats
          DateTime parseDateTime = DateTime.parse(
            userResponse.reservation![i].day!,
          );
          List<String> timeSplit =
              userResponse.reservation![i].time!.split(".");
          DateTime combinedDateTime = DateTime(
              parseDateTime.year,
              parseDateTime.month,
              parseDateTime.day,
              int.parse(timeSplit[0]),
              int.parse(timeSplit[1]));

          ref.read(homePageRiverpod).setList(
                ResListModel(
                    title:
                        '${userResponse.reservation![i].psycId!.name!.toString()} ${userResponse.reservation![i].psycId!.surName!.toString()}',
                    date: combinedDateTime,
                    rol: userResponse.reservation![i].psycId!.unvan!,
                    image:
                        '${Constant.domain}/uploads/${userResponse.reservation![i].psycId!.image}',
                    conferanceId: userResponse.reservation![i].sId!,
                    star: userResponse.reservation![i].psycId!.star!.length),
                1,
              );
        } catch (e) {}
      }
    } else {
      // Hata durumunda işlem yapabilirsiniz
      throw Exception('API isteği başarısız oldu ${jsonDecode(response.body)}');
    }
  }

  Future solution() async {
    final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    Set<String> uniqueDates = Set();
    List<ResListModel> aktifList =
        ref.watch(homePageRiverpod).resList.where((item) {
      DateTime itemDate = dateFormat.parse(item.date.toString());

      if (itemDate
          .isAfter(DateTime.now().subtract(const Duration(minutes: 5)))) {
        if (!uniqueDates.contains(item.date.toString())) {
          uniqueDates.add(item.date.toString());
          return true;
        }
      }
      setState(() {});
      return false;
    }).toList();

    ref.read(homePageRiverpod).setLastAfter(aktifList);
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    final DateTime now = DateTime.now();
    Set<String> uniqueDates = Set();
    List<_testModel> testModel = [
      _testModel(
          image: Assets.images.imDepresyonSVG,
          subtitle: 'Değerlendirme Testi',
          title: 'Depresyon',
          type: 'depresyon'),
      _testModel(
          image: Assets.images.imStresSVG,
          title: 'Stres Yönetimi',
          subtitle: 'İncelemesi',
          type: 'stres'),
      _testModel(
          image: Assets.images.demansSVG,
          title: 'Demans',
          subtitle: 'Değerlendirme Testi',
          type: 'demans')
    ];

    var watch = ref.watch(homePageRiverpod);
    var read = ref.read(homePageRiverpod);

    List<ResListModel> aktifList = watch.resList.where((item) {
      DateTime itemDate = dateFormat.parse(item.date.toString());

      if (itemDate.isAfter(now.subtract(const Duration(minutes: 5)))) {
        // Tarih 5 dakika geriden sonraysa ve eşsizse, Set'e ekliyoruz ve true dönüyoruz
        if (!uniqueDates.contains(item.date.toString())) {
          uniqueDates.add(item.date.toString());
          return true;
        }
      }

      return false;
    }).toList();

    ref.read(homePageRiverpod).setLastAfter(aktifList);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 105,
        backgroundColor: Constant.white,
        elevation: 0.2,
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, bottom: 15, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 26,
                        child: SizedBox(
                          height: 37,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.transparent, width: 0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle:
                                  const TextStyle(color: Constant.inputText),
                              focusColor: Constant.inputText,
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              hintText: 'Psikolog veya alan ara',
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: Constant.inputText,
                                letterSpacing: 0,
                                fontFamily: 'Proxima Nova',
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Constant.purple,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 3,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            GrockContainer(
                              onTap: () {
                                read.setNoti();
                                Grock.to(const NotificationPage());
                              },
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 6.5, bottom: 6, left: 8, right: 8),
                                child: SvgPicture.asset(
                                  Assets.icons.icNotificationSVG,
                                  width: 15,
                                  height: 17,
                                  color: const Color(0xFF333333),
                                ),
                              ),
                            ),
                            if (watch.notification != 0)
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 12, left: 5),
                                child: Container(
                                  width: 13,
                                  height: 13,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Constant.purple,
                                  ),
                                  child: Center(
                                      child: Text(
                                    watch.notification.toString(),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Constant.white),
                                  )),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 31,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    scrollDirection: Axis.horizontal,
                    itemCount: read.psycCategory.category.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _appbarCard(
                        text: read.psycCategory.category[index].text,
                        isSelected: read.psycCategory.category[index].select,
                        onTap: () {
                          setState(() {
                            for (int i = 0;
                                i < read.psycCategory.category.length;
                                i++) {
                              read.psycCategory.category[i].select =
                                  (i == index);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 20),
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: _homeCardRandevuAl(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 12, left: 19, right: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Randevularım',
                        style: TextStyle(
                          fontFamily: 'Proxima Nova',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          color: Constant.black,
                        ),
                      ),
                      GrockContainer(
                        onTap: () {
                          Grock.to(const AccReservation());
                        },
                        child: const Text(
                          'Hepsini Göster',
                          style: TextStyle(
                            fontFamily: 'Proxima Nova',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                watch.aktifList.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 19.0, right: 19, bottom: 25),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 33),
                          decoration: BoxDecoration(
                            color: Constant.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              style: BorderStyle.solid,
                              width: 1,
                              color: const Color(0xFFEAEAEF),
                            ),
                          ),
                          width: MediaQuery.sizeOf(context).width,
                          child: const Center(
                              child: Text(
                            'Planlanan randevu bulunmamaktadır.',
                            style: TextStyle(
                              fontFamily: 'Proxima Nova',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.1,
                              color: Constant.black,
                            ),
                          )),
                        ),
                      )
                    : SizedBox(
                        height: 175,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 19),
                          itemCount: watch.aktifList.length > 2
                              ? 2
                              : watch.aktifList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return reservationActiveCard(
                              title: watch.aktifList[index].title,
                              image: watch.aktifList[index].image,
                              rol: watch.aktifList[index].rol,
                              date: watch.aktifList[index].date,
                              conferenceID: watch.aktifList[index].conferanceId,
                              star: watch.aktifList[index].star,
                              padding: 5,
                            );
                          },
                        )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 19),
                      child: Text(
                        'Psikolojik Sağlık İncelemesi',
                        style: TextStyle(
                          fontFamily: 'Proxima Nova',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          color: Constant.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: testModel.isNotEmpty ? 180 : 110,
                      child: testModel.isNotEmpty
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              scrollDirection: Axis.horizontal,
                              itemCount: testModel.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _TestBoxCard(
                                    image: testModel[index].image,
                                    subtitle: testModel[index].subtitle,
                                    title: testModel[index].title,
                                    type: testModel[index].type);
                              },
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                  left: 19.0, right: 19, bottom: 25),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 33),
                                decoration: BoxDecoration(
                                  color: Constant.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    style: BorderStyle.solid,
                                    width: 1,
                                    color: const Color(0xFFEAEAEF),
                                  ),
                                ),
                                width: MediaQuery.sizeOf(context).width,
                                child: const Center(
                                    child: Text(
                                  'Planlanan test bulunmamaktadır.',
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1,
                                    color: Constant.black,
                                  ),
                                )),
                              ),
                            ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TestBoxCard extends StatelessWidget {
  String title;
  String subtitle;
  String image;
  String type;

  _TestBoxCard(
      {super.key,
      required this.image,
      required this.subtitle,
      required this.title,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GrockContainer(
        onTap: () {
          type == 'demans'
              ? Grock.to(ImagePickerView(image: image, title: title))
              : Grock.to(
                  TestView(
                    title: title,
                    image: image,
                    type: type,
                  ),
                );
        },
        width: 180,
        decoration: BoxDecoration(
          color: Constant.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            style: BorderStyle.solid,
            width: 1,
            color: const Color(0xFFEAEAEF),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Proxima Nova',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.2,
                color: Constant.black,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontFamily: 'Proxima Nova',
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 1.2,
                color: Constant.black.withOpacity(0.5),
              ),
            )
          ],
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

class _homeCardRandevuAl extends StatelessWidget {
  const _homeCardRandevuAl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 28.0, left: 20, right: 20),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Constant.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                style: BorderStyle.solid,
                width: 1,
                color: const Color(0xFFEAEAEF),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 37,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 29.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 190,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Psikolojik Destek Alarak Yaşamınızı İyileştirin',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Constant.black,
                                letterSpacing: -0.3,
                                fontFamily: 'Proxima Nova',
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'Şimdi randevu alın ve özel indirimlerden faydalanın.',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0,
                                fontFamily: 'Proxima Nova',
                                color: Color.fromARGB(109, 51, 51, 51),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 120,
                              height: 30,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Constant.darkwhite,
                                      shadowColor: Colors.transparent,
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    Grock.to(const SearchDoctor());
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Randevu Al',
                                        style: TextStyle(
                                            color: Constant.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 9,
                                        color: Constant.black,
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          Assets.images.imHomeKariPNG,
          width: 155,
          height: 182,
        )
      ],
    );
  }
}

class _resListModel {
  String title;
  DateTime date;
  String rol;
  String image;
  _resListModel(
      {required this.title,
      required this.date,
      required this.rol,
      required this.image});
}

class _testModel {
  String title;
  String subtitle;
  String image;
  String type;
  _testModel(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.type});
}
