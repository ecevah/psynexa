import 'package:Psynexa/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<bool> onPayPop(BuildContext context) async {
  return (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
                  width: MediaQuery.sizeOf(context).width - 48,
                  height: 260,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/ic_tick.svg",
                        height: 70,
                        color: Constant.purple.withOpacity(0.65),
                      ),
                      Text(
                        "Ödeme başarılı bir şekilde\ngerçekleşti.",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Container(
                              height: 45,
                              width: (MediaQuery.sizeOf(context).width - 126),
                              decoration: BoxDecoration(
                                color: Constant.purple.withOpacity(0.17),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Ana Sayfaya Git",
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )) ??
      false;
}
