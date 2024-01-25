import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/view/calendar.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Psynexa/models/psyc/psyc_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetayPsikiyatri extends StatefulWidget {
  String id;
  String title;
  double float;
  int number;
  String rol;
  String imagePath;
  DetayPsikiyatri({
    super.key,
    required this.id,
    required this.float,
    required this.imagePath,
    required this.number,
    required this.rol,
    required this.title,
  });

  @override
  State<DetayPsikiyatri> createState() => _DetayPsikiyatriState();
}

class _DetayPsikiyatriState extends State<DetayPsikiyatri> {
  bool loading = true;
  late String? name;
  late String? image;
  double starRange =
      ((2 + random.nextDouble() * (5 - 2)) * 100).roundToDouble() / 100;
  int comment = (1 + random.nextInt(1000 - 1 + 1));
  late int? price;
  List<String> rols = [];
  late String? title;

  Future fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await http.get(
      Uri.parse('${Constant.domain}/api/psyc/find/${widget.id}'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'x-access-token': prefs.getString("token") ??
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwc3ljaG9sb2dpc3QiOnsiX2lkIjoiNjVhODI2NGUyMTY0ODg0ZWYyZjc1M2E5IiwibmFtZSI6IlBzeWMgQWhtZXQiLCJzdXJOYW1lIjoiRWNldml0IiwicGFzcyI6IiQyYSQwOCR1bVpYeTU3VXFudnVmdEZ4emZCNW8uSVN1QUFzNHk5b1BBYU1uR1YwWFRzVGdwakRjZVNMUyIsImVNYWlsIjoiZWVjZXZhaEBnbWFpbC5jb20iLCJ0YWciOlsidXptYW4iXSwiaW1hZ2UiOiJpbWFnZS0xNzA1NTE4NjcwODUwLmpwZWciLCJ1bnZhbiI6ImtsaW5payBwc2lrb2xvaCIsInN0YXIiOltdLCJzdGFyQXZnIjpbXSwiYWN0aXZlIjpmYWxzZSwiYWNjQWN0aXZlIjp0cnVlLCJjcmVhdGVBdCI6IjIwMjQtMDEtMTdUMTk6MTE6MTAuODcyWiIsInVwZGF0ZUF0IjoiMjAyNC0wMS0xN1QxOToxMToxMC44NzJaIiwiX192IjowfSwiaWF0IjoxNzA1NTIwMTM1fQ.ad3WLnfmxtpnob3kSqVRZHtUZuOv8nX-CMkQHHdRth4"
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final userResponse = Psychologist.fromJson(data);
      name = '${userResponse.name} ${userResponse.surName}';
      image = '${Constant.domain}/uploads/${userResponse.image}';
      price = 1000;
      rols.add(userResponse.unvan);
      title = userResponse.unvan;
      loading = false;
      setState(() {});
    } else {
      // Hata durumunda işlem yapabilirsiniz
      throw Exception('API isteği başarısız oldu');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(top: 9.0),
            child: Text(
              'Psikolog Detayları',
              style: TextStyle(
                color: Constant.black,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                fontFamily: 'Proxima Nova',
              ),
            ),
          ),
          leading: IconButton(
            padding: const EdgeInsets.all(23.0),
            onPressed: () {
              Grock.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
            ),
            color: Constant.black,
          ),
          backgroundColor: Constant.white,
        ),
        body: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 30),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Image.network(
                            widget.imagePath,
                            width: 125,
                            height: 125,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(
                                  color: Constant.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.4,
                                  fontFamily: 'Proxima Nova'),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            SvgPicture.asset(
                              Assets.icons.icVerifyTickSVG,
                              width: 22,
                              height: 22,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7.5,
                        ),
                        Text(
                          widget.rol,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Proxima Nova',
                              color: Constant.black.withOpacity(0.5),
                              letterSpacing: -0.3),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        RatingStars(
                          valueLabelVisibility: false,
                          value: widget.float,
                          starBuilder: (index, color) => Icon(
                            Icons.star,
                            color: color,
                            size: 15,
                          ),
                          starCount: 5,
                          starSize: 15,
                          maxValue: 5,
                          starSpacing: 0,
                          maxValueVisibility: true,
                          starOffColor: const Color.fromARGB(70, 255, 235, 59),
                          starColor: Colors.yellow,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${widget.float} (${widget.number} Oylama)',
                          style: TextStyle(
                            color: Constant.black.withOpacity(0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.4,
                            fontFamily: 'Proxima Nova',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
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
                                  padding: const EdgeInsets.all(9),
                                  child: const Text(
                                    'Hakkında',
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
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'Uzmanlık Alanı',
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
                            const SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0),
                                child: ListView(
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: const Color(0xFFEAEAEF),
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Seans Ücreti : $price ₺',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Proxima Nova',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0,
                                            color:
                                                Constant.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Uyum bozuklukları uzmanı, psikolojik danışmanlık ve terapi hizmetleri sunan bir sağlık profesyonelidir. Uyum bozuklukları, bireylerin hayatlarında önemli bir stres kaynağı olabilir ve iş, okul ve sosyal ilişkiler gibi yaşamın birçok alanını etkileyebilir. Bu nedenle, uyum bozuklukları uzmanları, danışanlarının günlük yaşamlarında karşılaştıkları zorluklara yardımcı olmak için özel olarak eğitilirler.Uyum bozuklukları uzmanları, çeşitli terapi teknikleri kullanarak danışanlarının uyum sorunlarını ele alır. Bunlar arasında bilişsel davranışçı terapi, kişilerarası terapi, aile terapisi ve psikodinamik terapi gibi terapiler yer alır. Uzmanlar, danışanlarının yaşadıkları sorunları ve hissettikleri duyguları anlamak için bireysel danışmanlık, grup terapisi veya aile terapisi gibi farklı terapi yöntemleri kullanabilirler.',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Proxima Nova',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.2,
                                        color: Constant.black.withOpacity(0.5),
                                        height: 1.5,
                                      ),
                                    )
                                  ],
                                ),
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
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: const Color(0xFFEAEAEF),
                                              width: 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              widget.rol,
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'Proxima Nova',
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0,
                                                color: Constant.black
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount: 1,
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
                                Grock.to(
                                    CalendarPage(id: widget.id.toString()));
                              },
                              text: 'Randevu Ayarla',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
