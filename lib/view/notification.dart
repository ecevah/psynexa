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
      date: DateTime(2023, 8, 30, 22, 22, 56, 486, 933),
    ),
    _notifiListModel(
      title: "Prof. Dr. Ahmet Ecevit",
      date: DateTime(2023, 8, 30, 22, 22, 56, 486, 933),
    ),
    _notifiListModel(
      title: "Prof. Dr. Ahmet Ecevit",
      date: DateTime(2023, 8, 24, 22, 22, 56, 486, 933),
    ),
    _notifiListModel(
      title: "Prof. Dr. Ahmet Ecevit",
      date: DateTime(2023, 8, 24, 22, 22, 56, 486, 933),
    ),
    _notifiListModel(
      title: "Prof. Dr. Ahmet Ecevit",
      date: DateTime(2023, 8, 24, 22, 22, 56, 486, 933),
    ),
    _notifiListModel(
      title: "Prof. Dr. Ahmet Ecevit",
      date: DateTime(2023, 8, 23, 22, 22, 56, 486, 933),
    ),
    _notifiListModel(
      title: "Prof. Dr. Ahmet Ecevit",
      date: DateTime(2023, 8, 23, 22, 22, 56, 486, 933),
    ),
    _notifiListModel(
      title: "Prof. Dr. Ahmet Ecevit",
      date: DateTime(2023, 8, 23, 22, 22, 56, 486, 933),
    ),
    _notifiListModel(
      title: "Prof. Dr. Ahmet Ecevit",
      date: DateTime(2023, 8, 23, 22, 22, 56, 486, 933),
    ),
    _notifiListModel(
      title: "Prof. Dr. Ahmet Ecevit",
      date: DateTime(2023, 8, 23, 22, 22, 56, 486, 933),
    ),
    _notifiListModel(
      title: "Prof. Dr. Ahmet Ecevit",
      date: DateTime(2023, 8, 23, 22, 22, 56, 486, 933),
    ),
  ];

  List<_notifiListModel> todayNotiList = [];
  List<_notifiListModel> beforeTodayNotiList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < notiList.length; i++) {
      if (isToday(notiList[i].date)) {
        todayNotiList.add(notiList[i]);
      } else {
        beforeTodayNotiList.add(notiList[i]);
      }
    }
  }

  bool isToday(DateTime dateTime) {
    final now = DateTime.now();
    return dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAccAppBar(appbarTitle: 'Bildirimler'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                if (todayNotiList.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, top: 16, bottom: 16),
                        child: Row(
                          children: [
                            Text(
                              'Bugün  ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Constant.black,
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 16,
                              color: Constant.black,
                            ),
                            Text(
                              '  ${DateFormat('dd MMMM yyyy').format(DateTime.now())}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Constant.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      for (int i = 0; i < todayNotiList.length; i++)
                        CustomNatiListTile(
                            date: todayNotiList[i].date,
                            title: todayNotiList[i].title,
                            onTab: true),
                    ],
                  ),
                if (beforeTodayNotiList.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, top: 16, bottom: 16),
                        child: Text(
                          'Daha Önce',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Constant.black),
                        ),
                      ),
                      for (int i = 0; i < beforeTodayNotiList.length; i++)
                        CustomNatiListTile(
                            date: beforeTodayNotiList[i].date,
                            title: beforeTodayNotiList[i].title,
                            onTab: false),
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

class _notifiListModel {
  String title;
  DateTime date;
  _notifiListModel({
    required this.title,
    required this.date,
  });
}
