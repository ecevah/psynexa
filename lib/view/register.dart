import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/components/custom_text_input.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/login.dart';
import '../assets.dart';
import '../components/custom_pass_input.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final conferanceId = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    conferanceId.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const Expanded(flex: 3, child: SizedBox()),
            Expanded(
              flex: 14,
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
                  CustomPassword(
                    controller: conferanceId,
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25.0,
                        ),
                        child: Text(
                          'Şifreniz en az 7 karakter olmalı, harf ve rakam içermelidir.',
                          style: TextStyle(
                            color: Constant.inputText,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Proxima Nova',
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20.0, left: 25.0, top: 30),
                    child: Row(
                      children: [
                        const CheckboxExample(),
                        const SizedBox(
                          width: 6.85,
                        ),
                        SizedBox(
                          width: 280,
                          child: RichText(
                            text: const TextSpan(
                              text: 'Kişisel verilerinin işlenmesine yönelik ',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Proxima Nova',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF909090),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Aydınlatma Metni',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF909090),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: "'ni okudum anladım.",
                                ),
                              ],
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.icons.icQuestionCircleSVG,
                          height: 25,
                          width: 25,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: FirstBtn(onTap: () {}, text: 'Üye Ol'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 23.0),
                    child: Row(
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: 'Üye ola basarak ',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Proxima Nova',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF909090),
                            ),
                            children: [
                              TextSpan(
                                text: 'Üyelik Koşulları',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Proxima Nova',
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF909090),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: "'nı kabul ediyorum.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hesabınız var mı? ',
                      style: TextStyle(
                          color: Constant.inputText,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () {
                        Grock.to(Login());
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                      ),
                      child: const Text(
                        'Giriş yap',
                        style: TextStyle(
                            color: Constant.inputText,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                )),
          ],
        ));
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 23.0,
        height: 23.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: isChecked ? Constant.purple : const Color(0xFFDADADA),
            width: 1.96,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(5),
          color: isChecked ? Constant.purple : Colors.white,
        ),
        child: isChecked
            ? const Icon(
                Icons.check,
                size: 18.0,
                color: Colors.white,
              )
            : const SizedBox(),
      ),
    );
  }
}
