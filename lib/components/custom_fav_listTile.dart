import 'package:Psynexa/components/fav_alert.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class listOge extends StatelessWidget {
  String title;
  String rol;
  int number;
  String imagePath;
  double float;
  String onTap;
  listOge(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.number,
      required this.rol,
      required this.float,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop(String id) async {
      return await onFavPop(context, id);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 19),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              style: BorderStyle.solid,
              width: 1,
              color: const Color(0xFFEAEAEF)),
          color: Constant.white,
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Constant.black75,
              fontFamily: 'Proxima Nova',
              letterSpacing: -0.2,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 3,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RatingStars(
                    valueLabelVisibility: false,
                    value: float,
                    starBuilder: (index, color) => Icon(
                      Icons.star,
                      color: color,
                      size: 9,
                    ),
                    starCount: 5,
                    starSize: 12,
                    maxValue: 5,
                    starSpacing: 0,
                    maxValueVisibility: true,
                    starOffColor: const Color.fromARGB(70, 255, 235, 59),
                    starColor: Colors.yellow,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 1),
                    child: Text(
                      '$float ($number Oylama)',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.5),
                        fontFamily: 'Proxima Nova',
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                rol,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.35),
                  fontFamily: 'Proxima Nova',
                ),
              ),
            ],
          ),
          trailing: GrockContainer(
            onTap: () {
              onWillPop(onTap);
            },
            child: SvgPicture.asset(
              Assets.icons.icHeartSVG,
              width: 16,
              height: 15,
              color: const Color(0xFFD63928),
            ),
          ),
          leading: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
