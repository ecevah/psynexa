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
import 'package:Psynexa/view/calendar.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Psynexa/models/detailDoctor/detail_response.dart';

class DetayPsikiyatri extends StatefulWidget {
  int id;
  DetayPsikiyatri({super.key, required this.id});

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

  final headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Authorization':
        'Bearer 0b6c05e02ee081f0f9d3d733e6dadefcc7d3e5bb2c10f3195927e2794002eefdf5f6f2774afeba9188a133385082a36818baca38f93bf05be5a9c68672a84f3efde436ce64afeedf5e3d79f36980e9e8cd9ed4f41939dd2a666f386118604991d5ada44ca4ca9c02881e1692e8cd5ad4f6016cea4390fb0931ae7c3ae9ad573e'
  };
  Future fetchData() async {
    final response = await http.get(
        Uri.parse(
            '${Constant.domain}/api/psychologists/${widget.id}?populate=*'),
        headers: headers);
    if (response.statusCode == 200) {
      // API'den gelen veriyi JSON formatından dönüştürün
      final data = json.decode(response.body);
      print(data);
      final userResponse = DetailDart.fromJson(data);
      print(userResponse.data);
      // Veriyi kullanmak için burada işlemler yapabilirsiniz
      name = userResponse.data.fullName;
      image = '${Constant.domain}${userResponse.data.avatar.url}';
      price = userResponse.data.hourlyPrice;
      rols.add(userResponse.data.title);
      title = userResponse.data.profession;
      ;
      loading = false;
      setState(() {});
    } else {
      // Hata durumunda işlem yapabilirsiniz
      throw Exception('API isteği başarısız oldu');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
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
          title: Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: Text(
              'Psikolog Detayları',
              style: const TextStyle(
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
            ? Center(
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
                            '$image',
                            width: 125,
                            height: 125,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '$title $name',
                              style: TextStyle(
                                  color: Constant.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.4,
                                  fontFamily: 'Proxima Nova'),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            SvgPicture.asset(
                              Assets.icons.icVerifyTickSVG,
                              width: 22,
                              height: 22,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.5,
                        ),
                        Text(
                          rols[0],
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Proxima Nova',
                              color: Constant.black.withOpacity(0.5),
                              letterSpacing: -0.3),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        RatingStars(
                          valueLabelVisibility: false,
                          value: 3,
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
                          starOffColor: Color.fromARGB(70, 255, 235, 59),
                          starColor: Colors.yellow,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '$starRange ($comment Oylama)',
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
                                  padding: EdgeInsets.all(10),
                                  child: Text(
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
                            SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0),
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFFEAEAEF),
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Uyum bozuklukları uzmanı, psikolojik danışmanlık ve terapi hizmetleri sunan bir sağlık profesyonelidir. Uyum bozuklukları, bireylerin hayatlarında önemli bir stres kaynağı olabilir ve iş, okul ve sosyal ilişkiler gibi yaşamın birçok alanını etkileyebilir. Bu nedenle, uyum bozuklukları uzmanları, hastalarının günlük yaşamlarında karşılaştıkları zorluklara yardımcı olmak için özel olarak eğitilirler.Uyum bozuklukları uzmanları, çeşitli terapi teknikleri kullanarak hastalarının uyum sorunlarını ele alır. Bunlar arasında bilişsel davranışçı terapi, kişilerarası terapi, aile terapisi ve psikodinamik terapi gibi terapiler yer alır. Uzmanlar, hastalarının yaşadıkları sorunları ve hissettikleri duyguları anlamak için bireysel danışmanlık, grup terapisi veya aile terapisi gibi farklı terapi yöntemleri kullanabilirler.',
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
                            SizedBox(
                              height: 18,
                            ),
                            Expanded(
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Color(0xFFEAEAEF),
                                              width: 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${rols[index]}',
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
                                        SizedBox(
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
    ;
  }
}
