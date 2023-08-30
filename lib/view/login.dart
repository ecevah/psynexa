import 'package:Psynexa/components/exit_alert.dart';
import 'package:Psynexa/components/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/components/custom_text_input.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/base_scaffold.dart';
import 'package:Psynexa/view/meet.dart';
import 'package:Psynexa/view/register.dart';
import '../assets.dart';
import '../components/custom_pass_input.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final conferanceId = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    conferanceId.dispose();
  }

  Future<bool> _onWillPop() async {
    return await onWillPop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            const Expanded(flex: 2, child: SizedBox()),
            Expanded(
              flex: 14,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60.0),
                      child: SvgPicture.asset(
                        Assets.images.imXLogoSvgSVG,
                        height: 40,
                        width: 220,
                      ),
                    ),
                    CustomText(
                      text: 'Mail Adresi',
                      controller: conferanceId,
                    ),
                    const CustomPassword(),
                    Row(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: TextButton(
                            onPressed: () {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     behavior: SnackBarBehavior.floating,
                              //     backgroundColor: Colors.transparent,
                              //     elevation: 0,
                              //     content: ErrorSnackbar(context),
                              //   ),
                              // );

                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Align(
                                    alignment: Alignment.bottomCenter,
                                    child: IntrinsicHeight(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 30.0),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 32, vertical: 36),
                                          width:
                                              MediaQuery.sizeOf(context).width -
                                                  48,
                                          height: 260,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/checkout/Unionalert.svg",
                                                height: 70,
                                                color: Constant.purple,
                                              ),
                                              Text(
                                                "Hesaptan çıkış yapmak\n istediğinize emin misiniz?",
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.65),
                                                  fontSize: 15,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Proxima Nova',
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Grock.toRemove(Login());
                                                    },
                                                    child: Container(
                                                      height: 45,
                                                      width: (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width -
                                                              126) /
                                                          2,
                                                      decoration: BoxDecoration(
                                                        color: Constant.purple
                                                            .withOpacity(0.10),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Çıkış Yap",
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            color:
                                                                Constant.purple,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'Proxima Nova',
                                                            letterSpacing: -0.1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
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
                                                              126) /
                                                          2,
                                                      decoration: BoxDecoration(
                                                        color: Constant.purple,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "İptal Et",
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'Proxima Nova',
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
                            child: const Text(
                              'Şifremi Unuttum',
                              style: TextStyle(
                                color: Constant.inputText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: FirstBtn(
                          onTap: () {
                            Grock.toRemove(BaseScaffold());
                          },
                          text: 'Giriş Yap'),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hesabınız yok mu?',
                    style: TextStyle(
                        color: Constant.inputText,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {
                      Grock.to(
                        Register(),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                    ),
                    child: const Text(
                      'Üye ol',
                      style: TextStyle(
                          color: Constant.inputText,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
