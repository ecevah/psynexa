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
  Function onTap;
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Constant.gray, width: 0.7),
        ),
        color: Constant.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w500,
              color: Constant.black,
              fontFamily: 'Proxima Nova',
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: RatingStars(
                      valueLabelVisibility: false,
                      value: 3.6,
                      starBuilder: (index, color) => Icon(
                        Icons.star,
                        color: color,
                        size: 11,
                      ),
                      starCount: 5,
                      starSize: 15,
                      maxValue: 5,
                      starSpacing: 0,
                      maxValueVisibility: true,
                      starOffColor: Color.fromARGB(50, 255, 235, 59),
                      starColor: Colors.yellow,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 1, bottom: 2),
                    child: Text(
                      '$float ($number Oylama)',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(145, 51, 51, 51),
                        fontFamily: 'Proxima Nova',
                      ),
                    ),
                  )
                ],
              ),
              Text(
                rol,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(103, 51, 51, 51),
                  fontFamily: 'Proxima Nova',
                ),
              )
            ],
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
          trailing: GrockContainer(
            padding: EdgeInsets.only(top: 1),
            onTap: onTap(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(39, 240, 115, 90),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: SvgPicture.asset(Assets.icons.icHeartSVG,
                          width: 11, height: 11, color: Constant.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  'Kaldır',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: Constant.red,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
