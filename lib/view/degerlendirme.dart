import 'package:Psynexa/view/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

class Degerlendirme extends ConsumerStatefulWidget {
  String image;
  String title;
  String rol;
  Degerlendirme(
      {super.key, required this.title, required this.image, required this.rol});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DegerlendirmeState();
}

class _DegerlendirmeState extends ConsumerState<Degerlendirme> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAccAppBar(appbarTitle: 'Değerlendirme'),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 37.0, right: 37, top: 15, bottom: 43),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      ClipOval(
                        child: Image.network(
                          widget.image,
                          width: 133,
                          height: 133,
                          scale: 0.3,
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: Constant.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        widget.rol,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              RatingStars(
                value: value,
                onValueChanged: (v) {
                  setState(() {
                    value = v;
                    print(value);
                  });
                },
                starBuilder: (index, color) => Icon(
                  Icons.star,
                  color: color,
                ),
                starCount: 5,
                starSize: 20,
                maxValue: 5,
                starSpacing: 2,
                maxValueVisibility: true,
                valueLabelVisibility: false,
                animationDuration: const Duration(milliseconds: 1000),
                valueLabelPadding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                valueLabelMargin: const EdgeInsets.only(right: 8),
                starOffColor: const Color(0xffe7e8ea),
                starColor: Colors.yellow,
              ),
              const SizedBox(
                height: 27,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Yorum Ekle',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Constant.black),
                  ),
                  Text(
                    'Maks. 250 harf',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Constant.purple),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Constant.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Constant.gray, width: 1),
                ),
                child: TextFormField(
                  maxLines: 13,
                  cursorColor: Constant.purple,
                  maxLength: 250,
                  decoration: const InputDecoration(
                    hintText: 'Yorumunuzu yazın...',
                    hintStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(110, 51, 51, 51)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    border: InputBorder.none,
                    counterText: '',
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              FirstBtn(
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
                                      "assets/checkout/done.svg",
                                      height: 55,
                                      color: Constant.purple,
                                    ),
                                    Text(
                                      "Değerlendirmeniz başarılı bir\n iptal eklendi.",
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.65),
                                        fontSize: 16,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Proxima Nova',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Grock.to(BaseScaffold());
                                      },
                                      child: Container(
                                        height: 45,
                                        width:
                                            (MediaQuery.sizeOf(context).width -
                                                    126) *
                                                0.75,
                                        decoration: BoxDecoration(
                                          color: Constant.purple,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Randevularım",
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
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  text: 'Değerlendirmeyi Ekle')
            ],
          ),
        ),
      ),
    );
  }
}
