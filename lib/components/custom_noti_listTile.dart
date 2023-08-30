import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/view/aktif_reservation.dart';
import 'package:Psynexa/view/detay_reservation.dart';

class CustomNatiListTile extends StatefulWidget {
  DateTime date;
  String title;
  bool onTab;

  CustomNatiListTile(
      {super.key,
      required this.date,
      required this.title,
      required this.onTab});

  @override
  State<CustomNatiListTile> createState() => _CustomNatiListTileState();
}

class _CustomNatiListTileState extends State<CustomNatiListTile> {
  @override
  Widget build(BuildContext context) {
    return GrockContainer(
      onTap: () {
        widget.onTab
            ? Grock.to(AktifReservation())
            : Grock.to(DetayReservation());
      },
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Constant.gray, width: 1),
        ),
        color: Constant.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 6),
        child: ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bugün saat ${widget.date.hour.toString().padLeft(2, '0')}:${widget.date.minute.toString().padLeft(2, '0')}'da ${widget.title} ile randevun var.",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                child: Text(
                  "Şimdi Katıl",
                  style: TextStyle(
                      color: Constant.purple,
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
          leading: Container(
            width: 60,
            height: 67,
            decoration: BoxDecoration(
              color: Color.fromARGB(76, 103, 71, 199),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                Assets.icons.icCalendarSVG,
                color: Constant.purple,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
