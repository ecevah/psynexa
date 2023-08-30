import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/svg.dart';
// ignore: depend_on_referenced_packages
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
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 28.0, top: 5.0),
                            child: Text(
                              'Şifreniz en az 7 karakter olmalı, harf ve rakam içermelidir.',
                              style: TextStyle(
                                  color: Constant.inputText,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20.0, left: 10.0, top: 30),
                        child: Row(
                          children: [
                            const CheckboxExample(),
                            const SizedBox(
                              width: 280,
                              child: Text(
                                'Kişisel verilerinin işlenmesine yönelik Aydınlatma Metni’ni okudum ve anladım.',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
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
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 23.0),
                        child: Row(
                          children: [
                            Text(
                              'Üye ola basarak Üye Koşullarını kabul ediyorum.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            Spacer()
                          ],
                        ),
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
                        'Hesabınız var mı? ',
                        style: TextStyle(
                            color: Constant.inputText,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                        onPressed: () {
                          Grock.to(const Login());
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
          ),
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
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Constant.purple;
      }
      return isChecked ? Constant.purple : Constant.white;
    }

    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(
          color: Constant.inputText,
          width: 2,
        ),
      ),
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
