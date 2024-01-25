import 'package:Psynexa/components/reservation_active.dart';
import 'package:Psynexa/components/reservation_detay.dart';
import 'package:Psynexa/models/reservation/reservation_list.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/constant/constant.dart';
import '../components/custom_appbar.dart';
import 'package:Psynexa/riverpod/home_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:Psynexa/models/reservation/reservations_response.dart';

final homePageRiverpod = ChangeNotifierProvider((ref) => HomePageRiverpod());

class Reservation extends ConsumerStatefulWidget {
  const Reservation({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReservationState();
}

class _ReservationState extends ConsumerState<Reservation> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
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

      if (ref.watch(homePageRiverpod).currentIndex == 0) {
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
      }
    } else {
      throw Exception('API isteği başarısız oldu ${jsonDecode(response.body)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    final DateTime now = DateTime.now();
    Set<String> uniqueDates = Set();
    var watch = ref.watch(homePageRiverpod);

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

    List<ResListModel> gecmisList = watch.resList.where((item) {
      DateTime itemDate = dateFormat.parse(item.date.toString());
      return itemDate.isBefore(now.subtract(const Duration(minutes: 5)));
    }).toList();
    ref.read(homePageRiverpod).setLastAfter(aktifList);
    ref.read(homePageRiverpod).setBeforeAfter(gecmisList);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CustomAppBar(
          appbarTitle: "Randevularım",
        ),
        body: Column(
          children: [
            SizedBox(
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
                            padding: const EdgeInsets.all(10),
                            child: const Text('Aktif'),
                          ),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Text('Geçmiş'),
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
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 19),
                          itemCount: watch.aktifList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return reservationActiveCard(
                              title: watch
                                  .aktifList[watch.aktifList.length - index - 1]
                                  .title,
                              image: watch
                                  .aktifList[watch.aktifList.length - index - 1]
                                  .image,
                              rol: watch
                                  .aktifList[watch.aktifList.length - index - 1]
                                  .rol,
                              date: watch
                                  .aktifList[watch.aktifList.length - index - 1]
                                  .date,
                              conferenceID: watch
                                  .aktifList[watch.aktifList.length - index - 1]
                                  .conferanceId,
                              star: watch
                                  .aktifList[watch.aktifList.length - index - 1]
                                  .star,
                              padding: 10,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 19),
                          itemCount: watch.pasifList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return reservationDetayCard(
                              title: watch
                                  .pasifList[watch.pasifList.length - index - 1]
                                  .title,
                              image: watch
                                  .pasifList[watch.pasifList.length - index - 1]
                                  .image,
                              rol: watch
                                  .pasifList[watch.pasifList.length - index - 1]
                                  .rol,
                              date: watch
                                  .pasifList[watch.pasifList.length - index - 1]
                                  .date,
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
