import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/randevu_number_card.dart';
import 'package:Psynexa/constant/constant.dart';

class RandevuImageCard extends StatelessWidget {
  String title;
  String rol;
  String icon1;
  String icon2;
  String icon3;
  String iconTitle1;
  String iconTitle2;
  String iconTitle3;
  String iconText1;
  String iconText2;
  String iconText3;
  String image;

  RandevuImageCard(
      {super.key,
      required this.iconText1,
      required this.iconText2,
      required this.iconText3,
      required this.iconTitle1,
      required this.iconTitle2,
      required this.iconTitle3,
      required this.icon1,
      required this.icon2,
      required this.icon3,
      required this.title,
      required this.rol,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Column(
              children: [
                ClipOval(
                  child: Image.network(
                    image,
                    width: 120,
                    height: 120,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      color: Color.fromARGB(216, 0, 0, 0),
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.4,
                      fontFamily: 'Proxima Nova'),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  rol,
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Proxima Nova',
                      color: Color.fromARGB(74, 0, 0, 0),
                      letterSpacing: -0.3),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  numberCard(
                    number: iconText1,
                    svgPath: icon1,
                    title: iconTitle1,
                  ),
                  numberCard(
                    number: iconText2,
                    svgPath: icon2,
                    title: iconTitle2,
                  ),
                  numberCard(
                    number: iconText3,
                    svgPath: icon3,
                    title: iconTitle3,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
