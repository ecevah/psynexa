import 'package:Psynexa/view/test.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';
import 'package:Psynexa/view/aktif_reservation.dart';
import 'package:Psynexa/view/detay_reservation.dart';

class CustomNatiListTile extends StatefulWidget {
  DateTime date;
  String title;
  bool tur;

  CustomNatiListTile(
      {super.key, required this.date, required this.title, required this.tur});

  @override
  State<CustomNatiListTile> createState() => _CustomNatiListTileState();
}

class _CustomNatiListTileState extends State<CustomNatiListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 5),
      child: GrockContainer(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 32,
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
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: widget.tur
                    ? Constant.error.withOpacity(0.1)
                    : Constant.purple.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12.0, bottom: 15, left: 12, right: 12),
                child: SvgPicture.asset(
                  widget.tur
                      ? Assets.icons.icErrorSVG
                      : Assets.icons.icDefterSVG,
                  color: widget.tur ? Constant.error : Constant.purple,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: widget.tur
                  ? RichText(
                      text: TextSpan(
                        text: 'Bugün saat ',
                        style: const TextStyle(
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          height: 1.2,
                          color: Constant.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: DateFormat('HH:mm').format(widget.date),
                            style: const TextStyle(
                              fontFamily: 'Proxima Nova',
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              height: 1.2,
                              color: Constant.black,
                            ),
                          ),
                          const TextSpan(
                            text: "'te ",
                            style: TextStyle(
                              fontFamily: 'Proxima Nova',
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              height: 1.2,
                              color: Constant.black,
                            ),
                          ),
                          TextSpan(
                            text: widget.title,
                            style: const TextStyle(
                              fontFamily: 'Proxima Nova',
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              height: 1.2,
                              color: Constant.black,
                            ),
                          ),
                          const TextSpan(
                            text: " ile randevunuz bulunmakta.",
                            style: TextStyle(
                              fontFamily: 'Proxima Nova',
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              height: 1.2,
                              color: Constant.black,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '${widget.title},',
                            style: const TextStyle(
                              fontFamily: 'Proxima Nova',
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              height: 1.2,
                              color: Constant.black,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                text:
                                    ' sizin için bir psikolojik test gönderdi.',
                                style: TextStyle(
                                  fontFamily: 'Proxima Nova',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  height: 1.2,
                                  color: Constant.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            SizedBox(
                              width: 99,
                              height: 26,
                              child: ElevatedButton(
                                onPressed: () {
                                  Grock.to(
                                    TestView(
                                      title: 'Depresyon',
                                      image: Assets.images.imDepresyonSVG,
                                      type: 'depresyon',
                                    ),
                                  );
                                },
                                child: Text(
                                  'Şimdi Çöz',
                                  style: TextStyle(
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    height: 1.2,
                                    color: Constant.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFF5F5F5),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
