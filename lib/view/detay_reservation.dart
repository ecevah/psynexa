import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/components/randevu_detay.dart';
import 'package:Psynexa/components/randevu_detay_card.dart';
import 'package:Psynexa/components/randevu_number_card.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/models/reservation_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';

class DetayReservation extends StatelessWidget {
  DateTime time = DateTime(2023, 8, 24, 22, 22, 56, 486, 933);
  String name = 'Prof. Dr. Ali Durmaz';
  String rol = 'Travma Sonrası Stres Bozukluğu Uzmanı';
  String image = Assets.images.imKariPNG;
  int sure = 50;

  DetayReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAccAppBar(appbarTitle: 'Randevu Detayları'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 30),
            child: RandevuImageCard(
                iconText1: '${time.day}.${time.month}.${time.year}',
                iconText2: '${time.hour}:${time.minute}',
                iconText3: '${sure.toString()} dk',
                iconTitle1: 'Tarih',
                iconTitle2: 'Saat',
                iconTitle3: 'Süre',
                icon1: Assets.icons.icDoubleCalendarSVG,
                icon2: Assets.icons.icSaatSVG,
                icon3: Assets.icons.icZamanSVG,
                title: name,
                rol: rol,
                image: image),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, top: 7),
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Constant.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(81, 217, 217, 217),
                        spreadRadius: 2,
                        blurRadius: 4),
                  ],
                ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Text(
                      'Psikiyatrist Yorumu',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(214, 0, 0, 0),
                          fontFamily: 'Proxima Nova',
                          letterSpacing: -0.1),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Hastamın TSSB semptomlarındaki ilerleme son derece olumlu oldu. İlk değerlendirme sırasında yaşadığı yoğun korku, panik ataklar ve uykusuzluk gibi semptomlarının birçoğu azaldı veya tamamen ortadan kalktı. Terapi sırasında, hastam duygu düzenleme becerileri konusunda önemli bir ilerleme kaydetti ve bu beceriler, günlük hayatında da uygulayabileceği bir şekilde öğretildi. Tedavi sürecinde, hastamın kendine güveni de arttı ve daha önce yapamadığı birçok şeyi yapmak için cesaret kazandı. Hastamın hayat kalitesi ve işlevselliği önemli ölçüde arttı. Kendisiyle yaptığımız son görüşmede, artık TSSB semptomlarının daha az şiddetli ve daha az sıklıkla ortaya çıktığını bildirdi ve yaşam kalitesinin önemli ölçüde arttığını belirtti. Bu sonuçlar beni son derece mutlu ediyor ve hastamın tedavi sürecindeki başarısı için gurur duyuyorum.',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(90, 0, 0, 0),
                          height: 1.35),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}
