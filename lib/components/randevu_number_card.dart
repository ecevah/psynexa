import 'package:flutter/material.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';

class numberCard extends StatelessWidget {
  String svgPath;
  String number;
  String title;
  numberCard(
      {super.key,
      required this.number,
      required this.svgPath,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          color: Constant.purple,
          height: 25,
          width: 23,
        ),
        const SizedBox(
          width: 4,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(80, 0, 0, 0),
                  fontFamily: 'Proxima Nova',
                  letterSpacing: -0.1),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              number,
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Constant.darkpurple,
                  fontFamily: 'Proxima Nova',
                  letterSpacing: -0.3),
            ),
          ],
        )
      ],
    );
  }
}
