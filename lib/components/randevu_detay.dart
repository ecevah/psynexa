import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/randevu_number_card.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';

class RandevuDetayCard extends StatelessWidget {
  String title;
  String rol;
  String imagePath;
  DateTime time;
  int star;
  RandevuDetayCard(
      {super.key,
      required this.rol,
      required this.time,
      required this.title,
      required this.imagePath,
      required this.star});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 43.0),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  imagePath,
                  width: 88,
                  height: 88,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Constant.black75,
                          letterSpacing: -0.25,
                          fontFamily: 'Proxima Nova'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0, bottom: 1),
                      child: Text(
                        rol,
                        style: const TextStyle(
                            fontSize: 9.69,
                            fontWeight: FontWeight.w400,
                            color: Constant.black35,
                            fontFamily: 'Proxima Nova'),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.icCalendarSVG,
                          width: 10,
                          height: 10,
                          color: Constant.purple,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 1.0),
                          child: Text(
                            DateFormat('dd MMMM y - HH:mm', 'tr_TR')
                                .format(time),
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Constant.black35,
                                fontFamily: 'Proxima Nova'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              numberCard(
                svgPath: Assets.icons.icUserCaroSVG,
                number: "2.6K",
                title: 'Danışan',
              ),
              numberCard(
                svgPath: Assets.icons.icStarSVG,
                number: '$star',
                title: 'İnceleme',
              ),
              numberCard(
                svgPath: Assets.icons.icDoubleCalendarSVG,
                number: "8 Sene",
                title: 'Tecrübe',
              ),
            ],
          ),
        )
      ],
    );
  }
}
