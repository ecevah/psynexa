import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/components/custom_reservation_detaylistTile.dart';

class LastReservation extends StatelessWidget {
  const LastReservation({super.key});

  @override
  Widget build(BuildContext context) {
    List<_resListModel> iptalList = [
      _resListModel(
        title: "Prof. Dr. Ahmet Ecevit",
        date: DateTime(2023, 8, 26, 22, 22, 56, 486, 933),
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
    List<_resListModel> gecmisList = iptalList
        .where((item) =>
            item.date.isBefore(now.subtract(const Duration(minutes: 15))))
        .toList();
    return Scaffold(
      appBar: const CustomAccAppBar(
        appbarTitle: 'Geçmiş Randevular',
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
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
