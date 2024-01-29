import 'package:Psynexa/components/exit_alert.dart';
import 'package:Psynexa/models/login/login_request.dart';
import 'package:Psynexa/services/login_service.dart';
import 'package:Psynexa/view/meet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/components/custom_text_input.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/register.dart';
import '../assets.dart';
import '../components/custom_pass_input.dart';
import 'package:dio/dio.dart';

class Login extends ConsumerStatefulWidget {
  bool onBoard;
  Login({super.key, bool? onBoard}) : onBoard = onBoard ?? true;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  late final LoginService loginService;
  final username = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    loginService = LoginService(Dio(BaseOptions(baseUrl: Constant.domain)));
  }

  @override
  void dispose() {
    super.dispose();
    username.dispose();
    password.dispose();
  }

  Future<bool> _onWillPop() async {
    return widget.onBoard == true ? await onWillPop(context) : true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Column(
          children: [
            const Expanded(flex: 4, child: SizedBox()),
            Expanded(
              flex: 14,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 60.0),
                          child: SvgPicture.asset(
                            Assets.images.imXLogoSvgSVG,
                            height: 24,
                            width: 130,
                          ),
                        ),
                        CustomText(
                          text: 'Kullanıcı Adı',
                          controller: username,
                        ),
                        CustomPassword(
                          controller: password,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: TextButton(
                                onPressed: () {
                                  Grock.to(
                                    VideoConferencePage(
                                      conferenceID: "ahmet",
                                      name: "ahmet",
                                      id: 'ahmets',
                                      image: Assets.images.imKariPNG,
                                      title: "ahöet",
                                      rol: "widget.rol",
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Şifremi Unuttum',
                                  style: TextStyle(
                                    color: Constant.inputText,
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: FirstBtn(
                              onTap: () async {
                                if (formKey.currentState?.validate() ?? false) {
                                  final res = await loginService.fetchLogin(
                                      UserRequestModel(
                                          username: username.text,
                                          password: password.text));
                                }
                              },
                              text: 'Giriş Yap'),
                        )
                      ],
                    ),
                  ),
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
                    'Hesabınız yok mu?',
                    style: TextStyle(
                      color: Constant.inputText,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Proxima Nova',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Grock.to(
                        const Register(),
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
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Proxima Nova',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
