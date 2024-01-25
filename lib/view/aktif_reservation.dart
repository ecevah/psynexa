import 'package:flutter/material.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/components/randevu_detay.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/meet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Psynexa/riverpod/home_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homePageRiverpod = ChangeNotifierProvider((ref) => HomePageRiverpod());

class AktifReservation extends ConsumerStatefulWidget {
  DateTime date;
  String rol;
  String title;
  String image;
  String conferenceID;
  int star;
  AktifReservation(
      {super.key,
      required this.title,
      required this.date,
      required this.rol,
      required this.image,
      required this.conferenceID,
      required this.star});

  @override
  ConsumerState<AktifReservation> createState() => _AktifReservationState();
}

class _AktifReservationState extends ConsumerState<AktifReservation> {
  String phone = '0555 555 55 55';
  double price = 800;
  int age = 23;

  Future<String> getNameFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name') ?? '';
    return name;
  }

  String getFormattedDate(DateTime dateTime) {
    var format = DateFormat('d MMMM y', 'tr_TR');
    return format.format(dateTime);
  }

  String getFormattedTimeRange(DateTime startTime, DateTime endTime) {
    var timeFormat = DateFormat('HH:mm', 'tr_TR');
    return timeFormat.format(startTime) + ' - ' + timeFormat.format(endTime);
  }

  Stream<String> getRemainingTimeStream(DateTime dateTime) async* {
    while (DateTime.now().add(const Duration(hours: 3)).isBefore(dateTime)) {
      Duration remainingDuration =
          dateTime.difference(DateTime.now().add(const Duration(hours: 3)));
      int remainingHours = remainingDuration.inHours;
      int remainingMinutes = remainingDuration.inMinutes.remainder(60);
      int remainingSeconds = remainingDuration.inSeconds.remainder(60);

      yield '$remainingHours Saat $remainingMinutes Dakika $remainingSeconds Saniye';
      await Future.delayed(const Duration(seconds: 1));
    }
    yield 'Randevu Başladı';
  }

  void initState() {
    super.initState();
    fatchName();
  }

  Future fatchName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ref.read(homePageRiverpod).setName(prefs.getString('name')!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAccAppBar(appbarTitle: 'Aktif Randevu'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 30),
        child: Column(
          children: [
            RandevuDetayCard(
              title: widget.title,
              rol: widget.rol,
              time: widget.date,
              imagePath: widget.image,
              star: widget.star,
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, top: 35, bottom: 18),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          decoration: BoxDecoration(
                            color: Constant.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
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
                              const Text(
                                'Randevu zamanı',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Constant.black75,
                                  fontFamily: 'Proxima Nova',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Tarih: ${getFormattedDate(widget.date)}',
                                style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Constant.black50,
                                    fontFamily: 'Proxima Nova'),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Saat: ${getFormattedTimeRange(widget.date, widget.date.add(const Duration(minutes: 50)))}',
                                style: const TextStyle(
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
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 19, horizontal: 30),
                          decoration: BoxDecoration(
                            color: Constant.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
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
                              const Text(
                                'Ödeme Detayı',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Constant.black75,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Muayene Ücreti:',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Constant.black50,
                                        fontFamily: 'Proxima Nova'),
                                  ),
                                  Text(
                                    '$price₺',
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Constant.black50,
                                        fontFamily: 'Proxima Nova'),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'KDV:',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Constant.black50,
                                        fontFamily: 'Proxima Nova'),
                                  ),
                                  Text(
                                    '${price * 0.20}₺',
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Constant.black50,
                                        fontFamily: 'Proxima Nova'),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 1,
                                color: Constant.gray,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Toplam Tutar:',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Constant.black50,
                                        fontFamily: 'Proxima Nova'),
                                  ),
                                  Text(
                                    '${price + (price * 0.20)}₺',
                                    style: const TextStyle(
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
                stream: getRemainingTimeStream(widget.date),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FirstBtn(
                      onTap: () {
                        if (snapshot.data == "Randevu Başladı") {
                          Grock.to(
                            VideoConferencePage(
                              conferenceID: widget.conferenceID,
                              name:
                                  '${ref.watch(homePageRiverpod).nameSurname[0] ?? ''} ${ref.watch(homePageRiverpod).nameSurname.sublist(1).join(' ') ?? " "}',
                              id: 'ahmets',
                              image: widget.image,
                              title: widget.title,
                              rol: widget.rol,
                            ),
                          );
                        }
                      },
                      text: snapshot.data!,
                    );
                  } else {
                    return const CircularProgressIndicator();
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
