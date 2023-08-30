import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/image_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/riverpod/home_riverpod.dart';
import 'package:Psynexa/view/calendar.dart';
import 'package:Psynexa/view/degerlendirme.dart';
import 'package:Psynexa/view/detay_reservation.dart';
import 'package:Psynexa/view/gorusme_sonland%C4%B1.dart';
import 'package:Psynexa/view/notification.dart';
import 'package:Psynexa/view/psikiyatri_detay.dart';
import 'package:Psynexa/view/seach_doctor.dart';

final homePageRiverpod = ChangeNotifierProvider((ref) => HomePageRiverpod());

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int notification = 3;
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(homePageRiverpod);
    var read = ref.read(homePageRiverpod);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 105,
          backgroundColor: Constant.white,
          elevation: 0.2,
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 18, right: 18, bottom: 15, top: 10),
                    child: _appBarHome(notification: notification),
                  ),
                  SizedBox(
                    height: 31,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      scrollDirection: Axis.horizontal,
                      itemCount: read.psycCategory.category.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _appbarCard(
                          text: read.psycCategory.category[index].text,
                          isSelected: read.psycCategory.category[index].select,
                          onTap: () {
                            setState(() {
                              for (int i = 0;
                                  i < read.psycCategory.category.length;
                                  i++) {
                                read.psycCategory.category[i].select =
                                    (i == index);
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFFF5F5F5),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _homeCardRandevuAl(),
          ],
        ));
  }
}

class _appBarHome extends StatelessWidget {
  const _appBarHome({
    super.key,
    required this.notification,
  });

  final int notification;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 26,
          child: SizedBox(
            height: 37,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelStyle: const TextStyle(color: Constant.inputText),
                focusColor: Constant.inputText,
                filled: true,
                fillColor: Constant.darkwhite,
                hintText: 'Psikolog veya alan ara',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Constant.inputText,
                  letterSpacing: 0,
                  fontFamily: 'Proxima Nova',
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Constant.purple,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 3,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              GrockContainer(
                onTap: () {
                  Grock.to(NotificationPage());
                },
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                    color: Constant.purple, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 6.5, bottom: 6, left: 8, right: 8),
                  child: SvgPicture.asset(
                    Assets.icons.icNotificationSVG,
                    width: 15,
                    height: 17,
                    color: Constant.white,
                  ),
                ),
              ),
              if (notification != 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0, left: 5),
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Constant.white,
                    ),
                    child: Center(
                        child: Text(
                      notification.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Constant.purple),
                    )),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AppbarCard {
  final String text;
  bool isSelected;

  _AppbarCard({required this.text, required this.isSelected});
}

class _appbarCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _appbarCard({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        backgroundColor: isSelected ? Constant.purple : Constant.white,
        label: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            fontFamily: 'Proxima Nova',
            height: 0.4,
            color: isSelected ? Colors.white : Constant.black,
          ),
        ),
        shape: StadiumBorder(
          side: BorderSide(color: isSelected ? Constant.purple : Constant.gray),
        ),
      ),
    );
  }
}

class _homeCardRandevuAl extends StatelessWidget {
  const _homeCardRandevuAl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 28.0, left: 20, right: 20),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Constant.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 37,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 29.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 190,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Psikolojik Destek Alarak Yaşamınızı İyileştirin',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Constant.black,
                                letterSpacing: -0.3,
                                fontFamily: 'Proxima Nova',
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Şimdi randevu alın ve özel indirimlerden faydalanın.',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0,
                                fontFamily: 'Proxima Nova',
                                color: const Color.fromARGB(109, 51, 51, 51),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 120,
                              height: 30,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Constant.darkwhite,
                                      shadowColor: Colors.transparent,
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    Grock.to(SearchDoctor());
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Randevu Al',
                                        style: TextStyle(
                                            color: Constant.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 9,
                                        color: Constant.black,
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          Assets.images.imHomeKariPNG,
          width: 155,
          height: 182,
        )
      ],
    );
  }
}
