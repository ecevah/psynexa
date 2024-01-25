import 'package:Psynexa/constant/constant.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { always, often, rarely, never }

class CustomTestCard extends StatefulWidget {
  String question;
  int number;
  CustomTestCard({super.key, required this.number, required this.question});

  @override
  State<CustomTestCard> createState() => _CustomTestCardState();
}

class _CustomTestCardState extends State<CustomTestCard> {
  SingingCharacter? _character;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding: const EdgeInsets.all(25),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            width: 1,
            color: const Color(0xFFEAEAEF),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "${widget.number + 1}.",
              style: const TextStyle(
                fontFamily: 'Proxima Nova',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Constant.black,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 7.0,
                  ),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width - 116,
                    child: Text(
                      widget.question,
                      style: const TextStyle(
                        fontFamily: 'Proxima Nova',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Constant.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _character == SingingCharacter.always,
                              onChanged: (bool? value) {
                                if (value != null && value) {
                                  setState(() {
                                    _character = SingingCharacter.always;
                                  });
                                }
                              },
                              side: const BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.black,
                                  width: 0.85),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              tristate: true,
                              visualDensity: const VisualDensity(
                                horizontal: -4,
                                vertical: -4,
                              ),
                              activeColor: Colors.black,
                            ),
                            const Text(
                              'Her Zaman',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Constant.black,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _character == SingingCharacter.often,
                              onChanged: (bool? value) {
                                if (value != null && value) {
                                  setState(() {
                                    _character = SingingCharacter.often;
                                  });
                                }
                              },
                              side: const BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.black,
                                  width: 0.85),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              tristate: true,
                              visualDensity: const VisualDensity(
                                horizontal: -4,
                                vertical: -4,
                              ),
                              activeColor: Colors.black,
                            ),
                            const Text(
                              'Sık Sık',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Constant.black,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _character == SingingCharacter.rarely,
                              onChanged: (bool? value) {
                                if (value != null && value) {
                                  setState(() {
                                    _character = SingingCharacter.rarely;
                                  });
                                }
                              },
                              side: const BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.black,
                                  width: 0.85),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              tristate: true,
                              visualDensity: const VisualDensity(
                                horizontal: -4,
                                vertical: -4,
                              ),
                              activeColor: Colors.black,
                            ),
                            const Text(
                              'Nadiren',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Constant.black,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _character == SingingCharacter.never,
                              onChanged: (bool? value) {
                                if (value != null && value) {
                                  setState(() {
                                    _character = SingingCharacter.never;
                                  });
                                }
                              },
                              side: const BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.black,
                                  width: 0.85),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              tristate: true,
                              visualDensity: const VisualDensity(
                                horizontal: -4,
                                vertical: -4,
                              ),
                              activeColor: Colors.black,
                            ),
                            const Text(
                              'Hiçbir Zaman',
                              style: TextStyle(
                                fontFamily: 'Proxima Nova',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Constant.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
