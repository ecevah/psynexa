import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';
import 'package:Psynexa/view/detay_reservation.dart';

class CustomReservationDetayListTile extends StatefulWidget {
  String title;
  DateTime date;
  String rol;
  String image;
  CustomReservationDetayListTile(
      {super.key,
      required this.title,
      required this.date,
      required this.rol,
      required this.image});

  @override
  State<CustomReservationDetayListTile> createState() =>
      _CustomReservationDetayListTileState();
}

class _CustomReservationDetayListTileState
    extends State<CustomReservationDetayListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Constant.gray, width: 0.7),
        ),
        color: Constant.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 14),
        child: ListTile(
          title: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(184, 0, 0, 0),
                fontFamily: 'Proxima Nova',
                letterSpacing: -0.3),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 3,
              ),
              Text(
                widget.rol,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(129, 51, 51, 51),
                  fontFamily: 'Proxima Nova',
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: SvgPicture.asset(
                      Assets.icons.icCalendarSVG,
                      width: 10,
                      height: 10,
                      color: Constant.purple,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      DateFormat('dd MMMM y - HH:mm').format(widget.date),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(129, 51, 51, 51),
                        fontFamily: 'Proxima Nova',
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          leading: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          trailing: GrockContainer(
            padding: const EdgeInsets.only(top: 1),
            onTap: () {
              Grock.to(DetayReservation(
                id: "1",
              ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(30, 0, 146, 179),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.icons.icDetaySVG,
                      width: 17,
                      height: 17,
                      color: Constant.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                const Text(
                  'Detay',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: Constant.blue,
                    fontFamily: 'Proxima Nova',
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
