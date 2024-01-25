import 'package:Psynexa/riverpod/home_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homePageRiverpod = ChangeNotifierProvider((ref) => HomePageRiverpod());

class Profile extends ConsumerStatefulWidget {
  final ad = 'Ayşe';
  final soyad = 'Yılmaz';
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
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
    List<String> _cinsiyet = ["Kadın", "Erkek", "Belirtmek İstemiyorum"];
    String _secilenCinsiyet = "Erkek";

    void _cinsiyetDegistir(String? yeniSecilen) {
      if (yeniSecilen != null) {
        setState(() {
          _secilenCinsiyet = yeniSecilen;
        });
      }
    }

    String _dogumTarihi = ''; // Initialize with an empty string

    void _setDogumTarihi(String yeniTarih) {
      setState(() {
        _dogumTarihi = yeniTarih;
      });
    }

    String _telefon = '';

    void _setTelefon(String yeniTelefon) {
      setState(() {
        _telefon = yeniTelefon;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAccAppBar(appbarTitle: 'Profilim'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Ad',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Constant.black,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '*',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Constant.red,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          cursorColor: Constant.purple,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Constant.inputText, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Constant.inputText, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: prefs.getString('name') ?? 'N/A',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Constant.inputText,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Soyad',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Constant.black,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '*',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Constant.red,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          cursorColor: Constant.purple,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Constant.inputText, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Constant.inputText, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: prefs.getString('surname') ?? 'N/A',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Constant.inputText,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Cinsiyet',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Constant.black,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '*',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Constant.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Constant.inputText,
                            width: 1,
                          ),
                        ),
                        child: DropdownButton(
                          value: _secilenCinsiyet,
                          onChanged: _cinsiyetDegistir,
                          items: [
                            for (int i = 0; i < _cinsiyet.length; i++)
                              DropdownMenuItem<String>(
                                value: _cinsiyet[i],
                                child: Text(_cinsiyet[i]),
                              )
                          ],
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
                          isExpanded: true,
                          selectedItemBuilder: (BuildContext context) {
                            return _cinsiyet.map<Widget>((String item) {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        Assets.icons.icCinsiyetSVG),
                                    const SizedBox(width: 5),
                                    Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Constant.inputText,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Doğum Tarihi',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Constant.black,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '*',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Constant.red,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          cursorColor: Constant.purple,
                          onChanged: _setDogumTarihi,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Constant.inputText, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Constant.inputText, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: '02/08/2000',
                            suffixIcon: const Icon(
                              Icons.calendar_today_outlined,
                              size: 20,
                              color: Constant.inputText,
                            ),
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Constant.inputText,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Telefon',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Constant.black,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '*',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Constant.red,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          cursorColor: Constant.purple,
                          onChanged: _setTelefon,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Constant.inputText, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Constant.inputText, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: '05** *** ** **',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Constant.inputText,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: FirstBtn(onTap: () {}, text: 'Değişiklikleri Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
