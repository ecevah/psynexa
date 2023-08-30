import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/components/randevu_detay.dart';
import 'package:Psynexa/components/randevu_detay_card.dart';
import 'package:Psynexa/components/randevu_number_card.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/model/reservation_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/view/calendar.dart';

class DetayPsikiyatri extends StatelessWidget {
  String name = 'Prof. Dr. Ali Durmaz';
  String rol = 'Travma Sonrası Stres Bozukluğu Uzmanı';
  String image = Assets.images.imKariPNG;
  String hasta = '2.56K';
  String inceleme = '5.84K';
  String tecrube = '8 Sene';

  DetayPsikiyatri({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAccAppBar(appbarTitle: 'Psikiyatri Detayları'),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 34),
              child: RandevuImageCard(
                  iconText1: hasta,
                  iconText2: inceleme,
                  iconText3: tecrube,
                  iconTitle1: 'Hasta',
                  iconTitle2: 'İnceleme',
                  iconTitle3: 'Tecrübe',
                  icon1: Assets.icons.icUserCaroSVG,
                  icon2: Assets.icons.icStarSVG,
                  icon3: Assets.icons.icDoubleCalendarSVG,
                  title: name,
                  rol: rol,
                  image: image),
            ),
            Container(
              height: 42,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
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
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Muayene Detayı',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Proxima Nova',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Doktor Hakkında',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Proxima Nova',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.2,
                              ),
                            ),
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
                        height: 13,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: ListView(
                            children: [
                              Text(
                                'Uyum bozuklukları uzmanı, psikolojik danışmanlık ve terapi hizmetleri sunan bir sağlık profesyonelidir. Uyum bozuklukları, bireylerin hayatlarında önemli bir stres kaynağı olabilir ve iş, okul ve sosyal ilişkiler gibi yaşamın birçok alanını etkileyebilir. Bu nedenle, uyum bozuklukları uzmanları, hastalarının günlük yaşamlarında karşılaştıkları zorluklara yardımcı olmak için özel olarak eğitilirler.Uyum bozuklukları uzmanları, çeşitli terapi teknikleri kullanarak hastalarının uyum sorunlarını ele alır. Bunlar arasında bilişsel davranışçı terapi, kişilerarası terapi, aile terapisi ve psikodinamik terapi gibi terapiler yer alır. Uzmanlar, hastalarının yaşadıkları sorunları ve hissettikleri duyguları anlamak için bireysel danışmanlık, grup terapisi veya aile terapisi gibi farklı terapi yöntemleri kullanabilirler.',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.2,
                                    color: Color.fromARGB(140, 0, 0, 0)),
                              )
                            ],
                          ),
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
                        child: ListView(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
                              child: Text(
                                "Büşra, İstanbul'da psikoloji alanında uzmanlaşmış bir doktordur. Kendisi lisans eğitimini İstanbul Üniversitesi Psikoloji Bölümü'nde tamamlamıştır. Daha sonra, yüksek lisansını ve doktorasını psikoloji alanında yapan Büşra, uzun yıllardır klinik psikolog olarak çalışmaktadır. Büşra, kendini kişisel gelişim ve ilişki terapilerinde uzmanlaştırmıştır. Çalışmaları genellikle bireysel terapi, çift terapisi ve aile terapisi odaklıdır. Büşra, özellikle çiftlerin ve ailelerin yaşadığı zorluklarla ilgilenir. İlişki problemleri, çatışmalar, boşanma, çocuk yetiştirme sorunları, iş hayatı stresi ve benzeri konularda danışanlarına destek verir. Büşra, insanların zihnindeki düşünceleri ve hisleri anlamak için modern psikoterapi tekniklerini kullanmaktadır. Bireysel terapide, müşterilerine stres yönetimi, öz saygı, kaygı ve depresyon gibi konularda yardımcı olur. Çift terapisi veya aile terapisi durumlarında, iletişim becerileri ve sınırlar konusunda danışanlarını eğitir. Büşra, danışanlarıyla özel bir bağ kurar ve onları anlamaya çalışır. Her danışanın farklı bir hikayesi ve ihtiyacı olduğunu anlar ve tedavi planını buna göre oluşturur. Danışanlarına duyarsız davranmaz ve onların duygularını önemser. Onlara doğru yönlendirmeler yaparak, hayatlarındaki zorlukları aşmalarına yardımcı olur. Sonuç olarak, Büşra, deneyimli bir psikologdur ve mesleğinde başarılı bir kariyere sahiptir. Kişisel gelişim, ilişki terapileri ve aile terapisi konularında uzmanlaşmıştır ve danışanlarının hayatlarını olumlu yönde değiştirmelerine yardımcı olur.",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.2,
                                    color: const Color.fromARGB(140, 0, 0, 0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 40.0, top: 20, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 50,
                      child: FirstBtn(
                        onTap: () {
                          Grock.to(CalendarPage());
                        },
                        text: 'Randevu Ayarla',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Constant.darkwhite,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: SvgPicture.asset(
                          Assets.icons.icUnionSVG,
                          color: Constant.purple,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
