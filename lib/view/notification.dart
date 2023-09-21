import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/components/custom_noti_listTile.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/view/aktif_reservation.dart';
import 'package:Psynexa/view/detay_reservation.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<_notifiListModel> notiList = [
    _notifiListModel(
        title: "Prof. Dr. Ahmet Ecevit",
        date: DateTime(2023, 8, 20, 22, 22, 56, 486, 933),
        tur: true),
    _notifiListModel(
        title: "Prof. Dr. Ahmet Ecevit",
        date: DateTime(2023, 8, 20, 22, 22, 56, 486, 933),
        tur: false),
    _notifiListModel(
        title: "Prof. Dr. Ahmet Ecevit",
        date: DateTime(2023, 8, 24, 22, 22, 56, 486, 933),
        tur: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAccAppBar(appbarTitle: 'Bildirimler'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: notiList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomNatiListTile(
                    date: notiList[index].date,
                    title: notiList[index].title,
                    tur: notiList[index].tur,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _notifiListModel {
  String title;
  DateTime date;
  bool tur;
  _notifiListModel(
      {required this.title, required this.date, required this.tur});
}
