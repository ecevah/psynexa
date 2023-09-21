import 'package:Psynexa/view/aktif_reservation.dart';
import 'package:Psynexa/view/meet.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';

class reservationActiveCard extends StatefulWidget {
  String title;
  DateTime date;
  String rol;
  String image;
  double padding;
  reservationActiveCard(
      {super.key,
      required this.title,
      required this.date,
      required this.rol,
      required this.image,
      required this.padding});

  @override
  State<reservationActiveCard> createState() => _reservationActiveCardState();
}

class _reservationActiveCardState extends State<reservationActiveCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.padding),
      child: GrockContainer(
        onTap: () {
          widget.date.isBefore(DateTime.now().add(Duration(minutes: 15)))
              ? Grock.to(VideoConferencePage(
                  conferenceID: 'conferenceID', name: 'name', id: 'id'))
              : Grock.to(AktifReservation());
        },
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              style: BorderStyle.solid, width: 1, color: Color(0xFFEAEAEF)),
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
                      image: AssetImage(widget.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 110,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontFamily: 'Proxima Nova',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.15,
                          color: Constant.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      width: 110,
                      child: Text(
                        widget.rol,
                        style: TextStyle(
                          fontFamily: 'Proxima Nova',
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          height: 1.15,
                          color: Constant.black35,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              height: 15,
              width: 1,
              color: Color(0xFFEAEAEF),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${DateFormat('HH:mm').format(widget.date)} - ${DateFormat('HH:mm').format(widget.date.add(Duration(minutes: 45)))}',
                  style: TextStyle(
                    fontFamily: 'Proxima Nova',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.15,
                    color: Constant.black,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '${DateFormat('dd MMMM, EE', 'tr_TR').format(widget.date)}',
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
            GrockContainer(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: widget.date
                        .isBefore(DateTime.now().add(Duration(minutes: 15)))
                    ? Constant.purple.withOpacity(0.15)
                    : Color(0xFFF5F5F5),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 15),
                child: SvgPicture.asset(
                  Assets.icons.icCameraSVG,
                  width: 16,
                  height: 10,
                  color: widget.date
                          .isBefore(DateTime.now().add(Duration(minutes: 15)))
                      ? Constant.purple
                      : Constant.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
