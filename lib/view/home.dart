import 'package:Psynexa/components/reservation_active.dart';
import 'package:Psynexa/models/reservation/reservation_response.dart';
import 'package:Psynexa/view/acc_reservation.dart';
import 'package:Psynexa/view/deneme.dart';
import 'package:Psynexa/view/image.dart';
import 'package:Psynexa/view/test.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/image_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/riverpod/home_riverpod.dart';
import 'package:Psynexa/view/calendar.dart';
import 'package:Psynexa/view/degerlendirme.dart';
import 'package:Psynexa/view/detay_reservation.dart';
import 'package:Psynexa/view/gorusme_sonland%C4%B1.dart';
import 'package:Psynexa/view/notification.dart';
import 'package:Psynexa/view/psikiyatri_detay.dart';
import 'package:Psynexa/view/seach_doctor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:Psynexa/models/detailDoctor/detail_response.dart';

final homePageRiverpod = ChangeNotifierProvider((ref) => HomePageRiverpod());

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int notification = 3;
  late List<_resListModel> list;
  late List<_resListModel> aktiflist = [];
  final headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer 0b6c05e02ee081f0f9d3d733e6dadefcc7d3e5bb2c10f3195927e2794002eefdf5f6f2774afeba9188a133385082a36818baca38f93bf05be5a9c68672a84f3efde436ce64afeedf5e3d79f36980e9e8cd9ed4f41939dd2a666f386118604991d5ada44ca4ca9c02881e1692e8cd5ad4f6016cea4390fb0931ae7c3ae9ad573e'
  };
  Future fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.get(
        Uri.parse(
            '${Constant.domain}/api/meetings?sort[0]=meetingDate:desc&populate=*'),
        headers: headers);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final userResponse = ReservationResponse.fromJson(data);
      for (int i = 0; i < userResponse.data.length; i++)
        list.add(_resListModel(
            title: userResponse.data[i].psychologist!.fullName,
            date: userResponse.data[i].meetingDate.toDate,
            rol: userResponse.data[i].psychologist!.profession,
            image: Assets.images.imHomeKariPNG));
      aktiflist = list
          .where((item) =>
              item.date.isAfter(DateTime.now().subtract(Duration(minutes: 5))))
          .toList();
    } else {
      // Hata durumunda işlem yapabilirsiniz
      throw Exception('API isteği başarısız oldu ${jsonDecode(response.body)}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    List<_testModel> testModel = [
      _testModel(
        image: Assets.images.imDepresyonSVG,
        subtitle: 'Değerlendirme Testi',
        title: 'Depresyon',
      ),
      _testModel(
        image: Assets.images.imStresSVG,
        title: 'Stres Yönetimi',
        subtitle: 'İncelemesi',
      ),
      _testModel(
        image: Assets.images.imStresSVG,
        title: 'Stres Yönetimi',
        subtitle: 'İncelemesi',
      )
    ];

    List<_resListModel> iptalList = [
      _resListModel(
        title: "Ahmet Ecevit",
        date: DateTime(2023, 10, 6, 20, 16, 56, 486, 933),
        rol: 'Travma Sonrası Stres Bozukluğu',
        image: Assets.images.imKariPNG,
      ),
    ];

    var watch = ref.watch(homePageRiverpod);
    var read = ref.read(homePageRiverpod);
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
                  child: _appBarHome(notification: notification),
                ),
                SizedBox(
                  height: 31,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
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
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 20),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: _homeCardRandevuAl(),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 12, left: 19, right: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
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
                          Grock.to(AccReservation());
                        },
                        child: Text(
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
                aktiflist.length == 0
                    ? Padding(
                        padding:
                            EdgeInsets.only(left: 19.0, right: 19, bottom: 25),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 33),
                          decoration: BoxDecoration(
                            color: Constant.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              style: BorderStyle.solid,
                              width: 1,
                              color: Color(0xFFEAEAEF),
                            ),
                          ),
                          width: MediaQuery.sizeOf(context).width,
                          child: Center(
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
                        child: FutureBuilder(
                          future: fetchData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              // Veriler geldiğinde ekranda gösterme işlemlerini yapın
                              return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(horizontal: 19),
                                itemCount:
                                    aktiflist.length > 2 ? 2 : aktiflist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return reservationActiveCard(
                                    title: aktiflist[index].title,
                                    image: aktiflist[index].image,
                                    rol: aktiflist[index].rol,
                                    date: aktiflist[index].date,
                                    padding: 5,
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
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
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: testModel.length > 0 ? 180 : 110,
                      child: testModel.length > 0
                          ? ListView.builder(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              scrollDirection: Axis.horizontal,
                              itemCount: testModel.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _TestBoxCard(
                                  image: testModel[index].image,
                                  subtitle: testModel[index].subtitle,
                                  title: testModel[index].title,
                                );
                              },
                            )
                          : Padding(
                              padding: EdgeInsets.only(
                                  left: 19.0, right: 19, bottom: 25),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 33),
                                decoration: BoxDecoration(
                                  color: Constant.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    style: BorderStyle.solid,
                                    width: 1,
                                    color: Color(0xFFEAEAEF),
                                  ),
                                ),
                                width: MediaQuery.sizeOf(context).width,
                                child: Center(
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

  _TestBoxCard({
    super.key,
    required this.image,
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GrockContainer(
        onTap: () {
          Grock.to(
            TestView(
              title: title,
              image: image,
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
            color: Color(0xFFEAEAEF),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Proxima Nova',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.2,
                color: Constant.black,
              ),
            ),
            SizedBox(
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

class _appBarHome extends StatelessWidget {
  const _appBarHome({
    super.key,
    required this.notification,
  });

  final int notification;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelStyle: const TextStyle(color: Constant.inputText),
                focusColor: Constant.inputText,
                filled: true,
                fillColor: Color(0xFFF5F5F5),
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
                  Grock.to(NotificationPage());
                },
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5), shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 6.5, bottom: 6, left: 8, right: 8),
                  child: SvgPicture.asset(
                    Assets.icons.icNotificationSVG,
                    width: 15,
                    height: 17,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              if (notification != 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12, left: 5),
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Constant.purple,
                    ),
                    child: Center(
                        child: Text(
                      notification.toString(),
                      style: TextStyle(
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
                color: Color(0xFFEAEAEF),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
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
                            Text(
                              'Psikolojik Destek Alarak Yaşamınızı İyileştirin',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Constant.black,
                                letterSpacing: -0.3,
                                fontFamily: 'Proxima Nova',
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Şimdi randevu alın ve özel indirimlerden faydalanın.',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0,
                                fontFamily: 'Proxima Nova',
                                color: const Color.fromARGB(109, 51, 51, 51),
                              ),
                            ),
                            SizedBox(
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
                                    Grock.to(SearchDoctor());
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
  _testModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
