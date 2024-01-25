import 'package:Psynexa/view/detay_reservation.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';

class reservationDetayCard extends StatefulWidget {
  String title;
  DateTime date;
  String rol;
  String image;
  String id;
  reservationDetayCard(
      {super.key,
      required this.title,
      required this.date,
      required this.rol,
      required this.image,
      required this.id});

  @override
  State<reservationDetayCard> createState() => _reservationDetayCardState();
}

class _reservationDetayCardState extends State<reservationDetayCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GrockContainer(
        onTap: () {
          Grock.to(DetayReservation(id: widget.id));
        },
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              style: BorderStyle.solid,
              width: 1,
              color: const Color(0xFFEAEAEF)),
          color: Constant.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GrockContainer(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(widget.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontFamily: 'Proxima Nova',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.15,
                        color: Constant.black,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.rol,
                      style: const TextStyle(
                        fontFamily: 'Proxima Nova',
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        height: 1.15,
                        color: Constant.black35,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              height: 15,
              width: 1,
              color: const Color(0xFFEAEAEF),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${DateFormat('HH:mm').format(widget.date)} - ${DateFormat('HH:mm').format(widget.date.add(const Duration(minutes: 45)))}',
                  style: const TextStyle(
                    fontFamily: 'Proxima Nova',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.15,
                    color: Constant.black,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  DateFormat('dd MMMM, EE', 'tr_TR').format(widget.date),
                  style: TextStyle(
                    fontFamily: 'Proxima Nova',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 1.15,
                    color: Constant.black.withOpacity(0.35),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
