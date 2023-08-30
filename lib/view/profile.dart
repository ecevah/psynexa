import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatefulWidget {
  final ad = 'Ayşe';
  final soyad = 'Yılmaz';
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    List<String> _cinsiyet = ["Kadın", "Erkek", "Belirtmek İstemiyorum"];
    String _secilenCinsiyet = "Kadın";

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

    String _telefon = ''; // Initialize with an empty string

    void _setTelefon(String yeniTelefon) {
      setState(() {
        _telefon = yeniTelefon;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAccAppBar(appbarTitle: 'Profilim'),
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
                      Row(
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
                      SizedBox(
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
                            hintText: widget.ad,
                            hintStyle: TextStyle(
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
                      Row(
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
                      SizedBox(
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
                            hintText: widget.soyad,
                            hintStyle: TextStyle(
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
                      Row(
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
                      SizedBox(
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
                                    SizedBox(width: 5),
                                    Text(
                                      item,
                                      style: TextStyle(
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
                      Row(
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
                      SizedBox(
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
                            hintText: '28/11/1999',
                            suffixIcon: Icon(
                              Icons.calendar_today_outlined,
                              size: 20,
                              color: Constant.inputText,
                            ),
                            hintStyle: TextStyle(
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
                      Row(
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
                      SizedBox(
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
                            hintStyle: TextStyle(
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
