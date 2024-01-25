import 'package:Psynexa/riverpod/home_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Psynexa/view/acc_reservation.dart';
import 'package:Psynexa/view/last_reservation.dart';
import 'package:Psynexa/view/login.dart';
import 'package:Psynexa/view/profile.dart';
import '../components/custom_appbar.dart';
import 'package:grock/grock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final homePageRiverpod = ChangeNotifierProvider((ref) => HomePageRiverpod());

class Account extends ConsumerStatefulWidget {
  const Account({super.key});

  @override
  ConsumerState<Account> createState() => _AccountState();
}

class _AccountState extends ConsumerState<Account> {
  late SharedPreferences prefs;
  bool prefsInitialized = false;

  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  Future<void> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        prefsInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!prefsInitialized) {
      // Return a loading indicator or handle the case where prefs is not initialized
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (!prefs.containsKey('name') || !prefs.containsKey('surname')) {
      // If the required keys are not present in prefs, return an error message or handle it accordingly
      return const Center(
        child: Text('Error: SharedPreferences data not found'),
      );
    }
    return Scaffold(
      backgroundColor: Constant.darkwhite,
      appBar: const CustomAppBar(
        appbarTitle: "Hesabım",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Container(
                  padding: const EdgeInsets.only(left: 28),
                  width: MediaQuery.sizeOf(context).width,
                  height: 190,
                  decoration: BoxDecoration(
                    color: Constant.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(81, 217, 217, 217),
                          spreadRadius: 2,
                          blurRadius: 4),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'İsim',
                                style: TextStyle(
                                    color: Color.fromARGB(181, 51, 51, 51),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                prefs.getString('name') ??
                                    'N/A', // Provide a default value if null
                                style: const TextStyle(
                                    color: Color.fromARGB(181, 51, 51, 51),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Soyisim',
                                style: TextStyle(
                                    color: Color.fromARGB(181, 51, 51, 51),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                prefs.getString('surname') ??
                                    'N/A', // Provide a default value if null
                                style: const TextStyle(
                                    color: Color.fromARGB(181, 51, 51, 51),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'E-mail',
                                style: TextStyle(
                                    color: Color.fromARGB(181, 51, 51, 51),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                '${prefs.getString('name')?.toLowerCase() ?? 'N/A'}${prefs.getString('surname')?.toLowerCase() ?? 'N/A'}@gmail.com',
                                style: const TextStyle(
                                    color: Color.fromARGB(181, 51, 51, 51),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Doğum Yeri',
                                style: TextStyle(
                                    color: Color.fromARGB(181, 51, 51, 51),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                'Konak',
                                style: TextStyle(
                                    color: Color.fromARGB(181, 51, 51, 51),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Telefon',
                                style: TextStyle(
                                    color: Color.fromARGB(181, 51, 51, 51),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                '05** *** ** **',
                                style: TextStyle(
                                    color: Color.fromARGB(181, 51, 51, 51),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ülke',
                                style: TextStyle(
                                    color: Color.fromARGB(181, 51, 51, 51),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                'Türkiye',
                                style: TextStyle(
                                    color: Color.fromARGB(181, 51, 51, 51),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GrockContainer(
                        onTap: () {
                          Grock.to(const Profile());
                        },
                        width: 67,
                        height: 67,
                        decoration: const BoxDecoration(
                          color: Constant.purple,
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(15),
                            topStart: Radius.circular(15),
                            bottomEnd: Radius.circular(15),
                            bottomStart: Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8, left: 9),
                            child: SvgPicture.asset(Assets.icons.icPencilSVG),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Constant.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(81, 217, 217, 217),
                          spreadRadius: 2,
                          blurRadius: 4),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buttonCard(
                        text: 'Randevularım',
                        onTab: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AccReservation()));
                        },
                        icon: Assets.icons.icAccRandevularSVG,
                      ),
                      _buttonCard(
                        text: 'Geçmiş',
                        onTab: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LastReservation()));
                        },
                        icon: Assets.icons.icGecmisSVG,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: FirstBtn(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: IntrinsicHeight(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 36),
                              width: MediaQuery.sizeOf(context).width - 48,
                              height: 260,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    "assets/checkout/Unionalert.svg",
                                    height: 70,
                                    color: Constant.purple,
                                  ),
                                  Text(
                                    "Hesaptan çıkış yapmak\n istediğinize emin misiniz?",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.65),
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Proxima Nova',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Grock.toRemove(Login());
                                        },
                                        child: Container(
                                          height: 45,
                                          width: (MediaQuery.sizeOf(context)
                                                      .width -
                                                  126) /
                                              2,
                                          decoration: BoxDecoration(
                                            color: Constant.purple
                                                .withOpacity(0.10),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Çıkış Yap",
                                              style: TextStyle(
                                                decoration: TextDecoration.none,
                                                color: Constant.purple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Proxima Nova',
                                                letterSpacing: -0.1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          height: 45,
                                          width: (MediaQuery.sizeOf(context)
                                                      .width -
                                                  126) /
                                              2,
                                          decoration: BoxDecoration(
                                            color: Constant.purple,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "İptal Et",
                                              style: TextStyle(
                                                decoration: TextDecoration.none,
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Proxima Nova',
                                                letterSpacing: -0.1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                text: 'Çıkış Yap'),
          )
        ],
      ),
    );
  }
}

class _buttonCard extends StatefulWidget {
  String text;
  String icon;
  Function onTab;

  _buttonCard({required this.icon, required this.onTab, required this.text});

  @override
  State<_buttonCard> createState() => __buttonCardState();
}

class __buttonCardState extends State<_buttonCard> {
  void handleButtonTap() {
    widget.onTab();
  }

  @override
  Widget build(BuildContext context) {
    return GrockContainer(
      onTap: handleButtonTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  widget.icon,
                  color: const Color.fromARGB(181, 51, 51, 51),
                  width: 23,
                  height: 23,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.text,
                  style: const TextStyle(
                      color: Color.fromARGB(181, 51, 51, 51),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Constant.darkwhite,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(36, 51, 51, 51),
                  width: 1,
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 17,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
