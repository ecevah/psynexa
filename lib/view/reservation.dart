import 'package:Psynexa/components/reservation_active.dart';
import 'package:Psynexa/components/reservation_detay.dart';
import 'package:Psynexa/models/reservation/reservation_list.dart';
import 'package:Psynexa/models/reservation/reservation_response.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_reservation_detaylistTile.dart';
import 'package:Psynexa/components/custom_reservation_iptal_listTile.dart';
import 'package:Psynexa/constant/constant.dart';
import '../components/custom_appbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/riverpod/home_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

final homePageRiverpod = ChangeNotifierProvider((ref) => HomePageRiverpod());

class Reservation extends ConsumerStatefulWidget {
  const Reservation({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReservationState();
}

class _ReservationState extends ConsumerState<Reservation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  final headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer 0b6c05e02ee081f0f9d3d733e6dadefcc7d3e5bb2c10f3195927e2794002eefdf5f6f2774afeba9188a133385082a36818baca38f93bf05be5a9c68672a84f3efde436ce64afeedf5e3d79f36980e9e8cd9ed4f41939dd2a666f386118604991d5ada44ca4ca9c02881e1692e8cd5ad4f6016cea4390fb0931ae7c3ae9ad573e'
  };

  Future fetchData() async {
    final response = await http.get(
        Uri.parse(
            '${Constant.domain}/api/meetings?sort[0]=meetingDate:desc&populate=*'),
        headers: headers);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final userResponse = ReservationResponse.fromJson(data);
      if (ref.watch(homePageRiverpod).currentIndex == 0) {
        for (int i = 0; i < userResponse.data!.length; i++)
          ref.read(homePageRiverpod).setList(
              ResListModel(
                  title: userResponse.data![i].psychologist!.fullName!,
                  date: userResponse.data![i].meetingDate!.toDate,
                  rol: userResponse.data![i].psychologist!.profession!,
                  image: Assets.images.imHomeKariPNG,
                  conferanceId: userResponse.data![i].meetingId!),
              1);
      }
    } else {
      // Hata durumunda işlem yapabilirsiniz
      throw Exception('API isteği başarısız oldu ${jsonDecode(response.body)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    final DateTime now = DateTime.now();
    Set<String> uniqueDates = Set();
    var watch = ref.watch(homePageRiverpod);
    var read = ref.read(homePageRiverpod);

    List<ResListModel> aktifList = watch.resList.where((item) {
      DateTime itemDate = dateFormat.parse(item.date.toString());

      if (itemDate.isAfter(now.subtract(Duration(minutes: 5)))) {
        // Tarih 5 dakika geriden sonraysa ve eşsizse, Set'e ekliyoruz ve true dönüyoruz
        if (!uniqueDates.contains(item.date)) {
          uniqueDates.add(item.date.toString());
          return true;
        }
      }

      return false;
    }).toList();

    List<ResListModel> gecmisList = watch.resList.where((item) {
      DateTime itemDate = dateFormat.parse(item.date.toString());
      return itemDate.isBefore(now.subtract(Duration(minutes: 5)));
    }).toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          appbarTitle: "Randevularım",
        ),
        body: Column(
          children: [
            Container(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Constant.darkwhite),
                  child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFd8d1f2),
                    ),
                    unselectedLabelColor: Constant.inputText,
                    labelColor: Constant.purple,
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text('Aktif'),
                          ),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text('Geçmiş'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 19),
                          itemCount: aktifList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return reservationActiveCard(
                              title: aktifList[index].title,
                              image: aktifList[index].image,
                              rol: aktifList[index].rol,
                              date: aktifList[index].date,
                              conferenceID: aktifList[index].conferanceId,
                              padding: 10,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 19),
                          itemCount: gecmisList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return reservationDetayCard(
                              title: gecmisList[index].title,
                              image: gecmisList[index].image,
                              rol: gecmisList[index].rol,
                              date: gecmisList[index].date,
                              id: "1",
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
