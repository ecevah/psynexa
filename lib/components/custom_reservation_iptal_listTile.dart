import 'package:flutter/material.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:intl/intl.dart';
import 'package:Psynexa/view/aktif_reservation.dart';

class CustomReservationIptalListTile extends StatefulWidget {
  String title;
  DateTime date;
  String rol;
  String image;
  int star;
  CustomReservationIptalListTile(
      {super.key,
      required this.title,
      required this.date,
      required this.rol,
      required this.image,
      required this.star});

  @override
  State<CustomReservationIptalListTile> createState() =>
      _CustomReservationIptalListTileState();
}

class _CustomReservationIptalListTileState
    extends State<CustomReservationIptalListTile> {
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
          title: GrockContainer(
            onTap: () {
              Grock.to(AktifReservation(
                title: widget.title,
                rol: widget.rol,
                date: widget.date,
                conferenceID: 'asdasd',
                image: widget.image,
                star: widget.star,
              ));
            },
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(184, 0, 0, 0),
                fontFamily: 'Proxima Nova',
                letterSpacing: -0.3,
              ),
            ),
          ),
          subtitle: GrockContainer(
            onTap: () {
              Grock.to(AktifReservation(
                title: widget.title,
                rol: widget.rol,
                date: widget.date,
                conferenceID: 'asdasd',
                image: widget.image,
                star: widget.star,
              ));
            },
            child: Column(
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
                      padding: const EdgeInsets.only(top: 2.0),
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
          ),
          leading: GrockContainer(
            onTap: () {
              Grock.to(AktifReservation(
                title: widget.title,
                rol: widget.rol,
                date: widget.date,
                conferenceID: 'asdasd',
                image: widget.image,
                star: widget.star,
              ));
            },
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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 36),
                          width: MediaQuery.sizeOf(context).width - 48,
                          height: 260,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/checkout/Unionalert.svg",
                                height: 55,
                                color: Constant.purple,
                              ),
                              Text(
                                "Randevuyu iptal etmek\n istediğinize emin misiniz?",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.65),
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Proxima Nova',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      height: 45,
                                      width: (MediaQuery.sizeOf(context).width -
                                              126) /
                                          2,
                                      decoration: BoxDecoration(
                                        color:
                                            Constant.purple.withOpacity(0.10),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Vazgeçtim",
                                          style: TextStyle(
                                            decoration: TextDecoration.none,
                                            color: Constant.purple,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Proxima Nova',
                                            letterSpacing: -0.1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Align(
                                            alignment: Alignment.bottomCenter,
                                            child: IntrinsicHeight(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 30.0),
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 32,
                                                      vertical: 36),
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width -
                                                          48,
                                                  height: 260,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SvgPicture.asset(
                                                        "assets/checkout/done.svg",
                                                        height: 70,
                                                        color: Constant.purple,
                                                      ),
                                                      Text(
                                                        "Randevunuz başarılı bir şekilde\n iptal edildi.",
                                                        style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.65),
                                                          fontSize: 16,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              'Proxima Nova',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Container(
                                                          height: 45,
                                                          width: (MediaQuery.sizeOf(
                                                                          context)
                                                                      .width -
                                                                  126) *
                                                              0.75,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Constant.purple,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              "Ana Sayfa",
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Proxima Nova',
                                                                letterSpacing:
                                                                    -0.1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 45,
                                      width: (MediaQuery.sizeOf(context).width -
                                              126) /
                                          2,
                                      decoration: BoxDecoration(
                                        color: Constant.purple,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "İptal Et",
                                          style: TextStyle(
                                            decoration: TextDecoration.none,
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Proxima Nova',
                                            letterSpacing: -0.1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(30, 240, 115, 90),
                  ),
                  child: Center(
                    child: SvgPicture.asset(Assets.icons.icIptaletSVG,
                        width: 14, height: 14, color: Constant.red),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                const Text(
                  'İptal Et',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: Constant.red,
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
