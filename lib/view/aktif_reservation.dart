import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/components/randevu_detay.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/meet.dart';

class AktifReservation extends StatefulWidget {
  const AktifReservation({super.key});

  @override
  State<AktifReservation> createState() => _AktifReservationState();
}

class _AktifReservationState extends State<AktifReservation> {
  String name = 'Ahmet Ecevit';
  String phone = '0555 555 55 55';
  String conferenceID = 'sdasd';
  double price = 500.00;
  int age = 23;
  DateTime date = DateTime(2023, 8, 26, 22, 22, 56, 486, 933);

  String getFormattedDate(DateTime dateTime) {
    return DateFormat('d MMMM y').format(dateTime);
  }

  String getFormattedTimeRange(DateTime startTime, DateTime endTime) {
    return DateFormat('HH:mm').format(startTime) +
        ' - ' +
        DateFormat('HH:mm').format(endTime);
  }

  Stream<String> getRemainingTimeStream(DateTime dateTime) async* {
    while (DateTime.now().isBefore(dateTime)) {
      Duration remainingDuration = dateTime.difference(DateTime.now());
      int remainingHours = remainingDuration.inHours;
      int remainingMinutes = remainingDuration.inMinutes.remainder(60);
      int remainingSeconds = remainingDuration.inSeconds.remainder(60);

      yield '$remainingHours Saat $remainingMinutes Dakika $remainingSeconds Saniye';
      await Future.delayed(Duration(seconds: 1));
    }
    yield 'Randevu Başladı';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAccAppBar(appbarTitle: 'Aktif Randevu'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 30),
        child: Column(
          children: [
            RandevuDetayCard(
              title: 'Dr. Fatma Durak',
              rol: 'Travma Sonrası Stres Bozukluğu',
              time: DateTime.now(),
              imagePath: Assets.images.imKariPNG,
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, top: 35, bottom: 18),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          decoration: BoxDecoration(
                            color: Constant.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(81, 217, 217, 217),
                                  spreadRadius: 5,
                                  blurRadius: 4),
                            ],
                          ),
                          width: MediaQuery.sizeOf(context).width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Randevu zamanı',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Constant.black75,
                                  fontFamily: 'Proxima Nova',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Tarih: ${getFormattedDate(date)}',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Constant.black75,
                                    fontFamily: 'Proxima Nova'),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Saat: ${getFormattedTimeRange(date, date.add(Duration(minutes: 50)))}',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Constant.black75,
                                    fontFamily: 'Proxima Nova'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 19, horizontal: 30),
                          decoration: BoxDecoration(
                            color: Constant.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(81, 217, 217, 217),
                                  spreadRadius: 5,
                                  blurRadius: 4),
                            ],
                          ),
                          width: MediaQuery.sizeOf(context).width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hasta Detayı',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Constant.black75,
                                    fontFamily: 'Proxima Nova'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Ad Soyad: $name',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Constant.black50,
                                    fontFamily: 'Proxima Nova'),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Yaş: $age',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Constant.black50,
                                    fontFamily: 'Proxima Nova'),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Telefon No: $phone',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Constant.black50,
                                    fontFamily: 'Proxima Nova'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 18),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 19, horizontal: 30),
                          decoration: BoxDecoration(
                            color: Constant.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(81, 217, 217, 217),
                                  spreadRadius: 5,
                                  blurRadius: 4),
                            ],
                          ),
                          width: MediaQuery.sizeOf(context).width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ödeme Detayı',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Constant.black75,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Muayene Ücreti:',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Constant.black50,
                                        fontFamily: 'Proxima Nova'),
                                  ),
                                  Text(
                                    '$price₺',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Constant.black50,
                                        fontFamily: 'Proxima Nova'),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'KDV:',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Constant.black50,
                                        fontFamily: 'Proxima Nova'),
                                  ),
                                  Text(
                                    '${price * 0.20}₺',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Constant.black50,
                                        fontFamily: 'Proxima Nova'),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 1,
                                color: Constant.gray,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Toplam Tutar:',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Constant.black50,
                                        fontFamily: 'Proxima Nova'),
                                  ),
                                  Text(
                                    '${price + (price * 0.20)}₺',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Constant.black50,
                                        fontFamily: 'Proxima Nova'),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: StreamBuilder<String>(
                stream: getRemainingTimeStream(date),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FirstBtn(
                      onTap: () {
                        if (snapshot.data == "Randevu Başladı")
                          Grock.to(
                            VideoConferencePage(
                              conferenceID: conferenceID,
                              name: 'Ahmet Ecevit',
                              id: 'ahmets',
                            ),
                          );
                      },
                      text: snapshot.data!,
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
