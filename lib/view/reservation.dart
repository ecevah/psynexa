import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_reservation_detaylistTile.dart';
import 'package:Psynexa/components/custom_reservation_iptal_listTile.dart';
import 'package:Psynexa/constant/constant.dart';
import '../components/custom_appbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';

class Reservation extends StatelessWidget {
  Reservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_resListModel> iptalList = [
      _resListModel(
        title: "Prof. Dr. Ahmet Ecevit",
        date: DateTime(2023, 10, 30, 22, 22, 56, 486, 933),
        rol: 'Travma Sonrası Stres Bozukluğu',
        image: Assets.images.imKariPNG,
      ),
      _resListModel(
        title: "Prof. Dr. Ahmet Ecevit",
        date: DateTime(2023, 10, 23, 22, 22, 56, 486, 933),
        rol: 'Travma Sonrası Stres Bozukluğu',
        image: Assets.images.imKariPNG,
      ),
      _resListModel(
        title: "Prof. Dr. Ahmet Ecevit",
        date: DateTime(2023, 8, 24, 22, 22, 56, 486, 933),
        rol: 'Travma Sonrası Stres Bozukluğu',
        image: Assets.images.imKariPNG,
      ),
      _resListModel(
        title: "Prof. Dr. Ahmet Ecevit",
        date: DateTime(2023, 8, 24, 22, 22, 56, 486, 933),
        rol: 'Travma Sonrası Stres Bozukluğu',
        image: Assets.images.imKariPNG,
      ),
    ];

    DateTime now = DateTime.now();

    List<_resListModel> aktifList = iptalList
        .where((item) => item.date.isAfter(now.add(Duration(minutes: 15))))
        .toList();
    List<_resListModel> gecmisList = iptalList
        .where((item) => item.date.isBefore(now.add(Duration(minutes: 15))))
        .toList();

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
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: aktifList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomReservationIptalListTile(
                              title: aktifList[index].title,
                              image: aktifList[index].image,
                              rol: aktifList[index].rol,
                              date: aktifList[index].date,
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
                          itemCount: gecmisList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomReservationDetayListTile(
                              title: gecmisList[index].title,
                              image: gecmisList[index].image,
                              rol: gecmisList[index].rol,
                              date: gecmisList[index].date,
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
