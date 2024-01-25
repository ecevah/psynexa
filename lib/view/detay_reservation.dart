import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/components/randevu_detay_card.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:grock/grock.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Psynexa/models/psyc/psyc_response.dart';
import 'dart:math';

class DetayReservation extends StatefulWidget {
  String id;

  DetayReservation({super.key, required this.id});

  @override
  State<DetayReservation> createState() => _DetayReservationState();
}

class _DetayReservationState extends State<DetayReservation> {
  late DateTime time = DateTime(2023, 9, 21, 22, 12, 0, 0);
  late String name;
  late String rol;
  late String image;
  bool show = true;

  int count = 0 + random.nextInt(3 - 0 + 1);
  int sure = 50;
  final headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Authorization':
        'Bearer 0b6c05e02ee081f0f9d3d733e6dadefcc7d3e5bb2c10f3195927e2794002eefdf5f6f2774afeba9188a133385082a36818baca38f93bf05be5a9c68672a84f3efde436ce64afeedf5e3d79f36980e9e8cd9ed4f41939dd2a666f386118604991d5ada44ca4ca9c02881e1692e8cd5ad4f6016cea4390fb0931ae7c3ae9ad573e'
  };
  Future fetchData() async {
    final response = await http.get(
        Uri.parse('${Constant.domain}/api/psychologists/1?populate=*'),
        headers: headers);

    if (response.statusCode == 200) {
      // API'den gelen veriyi JSON formatından dönüştürün
      final data = json.decode(response.body);
      final userResponse = Psychologist.fromJson(data);
      name = '${userResponse.name} ${userResponse.surName}';
      rol = userResponse.unvan;
      image = '${Constant.domain}/uploads/${userResponse.image}';
      show = false;
      setState(() {});
      // Veriyi kullanmak için burada işlemler yapabilirsiniz
    } else {
      // Hata durumunda işlem yapabilirsiniz
      throw Exception('API isteği başarısız oldu');
    }
  }

  List<String> comment = [
    'Danışanmın TSSB semptomlarındaki ilerleme son derece olumlu oldu. İlk değerlendirme sırasında yaşadığı yoğun korku, panik ataklar ve uykusuzluk gibi semptomlarının birçoğu azaldı veya tamamen ortadan kalktı. Terapi sırasında, danışanm duygu düzenleme becerileri konusunda önemli bir ilerleme kaydetti ve bu beceriler, günlük hayatında da uygulayabileceği bir şekilde öğretildi. Tedavi sürecinde, danışanmın kendine güveni de arttı ve daha önce yapamadığı birçok şeyi yapmak için cesaret kazandı. Danışanmın hayat kalitesi ve işlevselliği önemli ölçüde arttı. Kendisiyle yaptığımız son görüşmede, artık TSSB semptomlarının daha az şiddetli ve daha az sıklıkla ortaya çıktığını bildirdi ve yaşam kalitesinin önemli ölçüde arttığını belirtti. Bu sonuçlar beni son derece mutlu ediyor ve danışanmın tedavi sürecindeki başarısı için gurur duyuyorum.',
    "Danışannın majör depresyon tedavisi boyunca gösterdiği ilerleme etkileyiciydi. İlk başta ağır bir depresyon yaşadığından, günlük aktiviteleri bile zorlanıyordu. Ancak tedavi sürecinde, antidepresan ilaçların ve terapinin kombinasyonuyla ruh hali önemli ölçüde iyileşti. İleriye dönük olarak, danışannın depresyon semptomlarının azalması ve hayat kalitesinin artması için umutluyuz.",
    "Danışannın şizofreni tedavisi oldukça karmaşıktı, ancak önemli bir ilerleme kaydetti. İlaçlarla desteklenen psikoterapi ve destek programları, danışannın psikotik semptomlarını kontrol etmesine yardımcı oldu. İlerleme, sosyal izolasyonun azaltılması ve yaşam becerilerinin geliştirilmesi yoluyla daha da arttı. Tedaviye devam ederken danışannın daha da iyileşeceğine inanıyoruz.",
    "Danışannın OKB semptomlarının yönetimi için verilen tedavi olumlu sonuçlar gösterdi. Obsesyonlar ve kompulsiyonlar üzerinde çalışmak için bilişsel davranışçı terapi kullanıldı ve danışannın semptomları azaldı. Terapinin bir parçası olarak öğrenilen beceriler, günlük yaşamda OKB semptomlarını daha iyi kontrol etmesine yardımcı oldu.",
    "Danışannın bipolar bozukluk tedavisi, manik ve depresif dönemlerin daha iyi yönetilmesi için önemli bir ilerleme kaydetti. Duygusal dengeyi sağlamak için uygun ilaç kombinasyonları belirlendi ve danışannın dengesiz ruh hali üzerindeki kontrolü arttı. Tedavi süreci boyunca, danışannın duygu düzenleme becerileri de gelişti.",
    "Danışannın anksiyete bozukluğu tedavisinde önemli bir iyileşme gözlemlendi. İlaçlar ve bilişsel davranışçı terapi, danışannın anksiyete semptomlarını yönetmesine yardımcı oldu. Özellikle, danışannın endişe seviyeleri azaldı ve günlük yaşam aktivitelerine daha rahat bir şekilde katılabildi. Tedavi sürecinin devam etmesiyle daha da fazla ilerleme bekliyoruz."
  ];
  @override
  void initState() {
    super.initState();
    fetchData();
    Random random = Random();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAccAppBar(appbarTitle: 'Randevu Detayları'),
      body: show
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
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
                    padding:
                        const EdgeInsets.only(left: 30.0, right: 30, top: 7),
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Constant.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(81, 217, 217, 217),
                              spreadRadius: 2,
                              blurRadius: 4),
                        ],
                      ),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: const [
                          Text(
                            'Psikiyatrist Yorumu',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(214, 0, 0, 0),
                                fontFamily: 'Proxima Nova',
                                letterSpacing: -0.1),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Danışanmın TSSB semptomlarındaki ilerleme son derece olumlu oldu. İlk değerlendirme sırasında yaşadığı yoğun korku, panik ataklar ve uykusuzluk gibi semptomlarının birçoğu azaldı veya tamamen ortadan kalktı. Terapi sırasında, danışanm duygu düzenleme becerileri konusunda önemli bir ilerleme kaydetti ve bu beceriler, günlük hayatında da uygulayabileceği bir şekilde öğretildi. Tedavi sürecinde, danışanmın kendine güveni de arttı ve daha önce yapamadığı birçok şeyi yapmak için cesaret kazandı. Danışanmın hayat kalitesi ve işlevselliği önemli ölçüde arttı. Kendisiyle yaptığımız son görüşmede, artık TSSB semptomlarının daha az şiddetli ve daha az sıklıkla ortaya çıktığını bildirdi ve yaşam kalitesinin önemli ölçüde arttığını belirtti. Bu sonuçlar beni son derece mutlu ediyor ve danışanmın tedavi sürecindeki başarısı için gurur duyuyorum.',
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
                const SizedBox(
                  height: 70,
                )
              ],
            ),
    );
  }
}
