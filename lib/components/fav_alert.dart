import 'package:Psynexa/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<bool> onFavPop(BuildContext context, String id) async {
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
                        "assets/checkout/Unionalert.svg",
                        height: 70,
                        color: Constant.purple.withOpacity(0.65),
                      ),
                      Text(
                        "Favorilerden çıkarmak\n istediğinize emin misiniz?",
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
                            onTap: () {},
                            child: Container(
                              height: 45,
                              width: (MediaQuery.sizeOf(context).width - 126) /
                                  1.6,
                              decoration: BoxDecoration(
                                color: Constant.purple.withOpacity(0.10),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Favorilerimden Çıkar",
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
                            },
                            child: Container(
                              height: 45,
                              width: (MediaQuery.sizeOf(context).width - 126) /
                                  2.6,
                              decoration: BoxDecoration(
                                color: Constant.purple,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Vazgeçtim",
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
      )) ??
      false;
}
