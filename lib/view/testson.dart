import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_appbar.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';

class TestSon extends StatelessWidget {
  String title;
  String image;
  TestSon({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appbarTitle: '${title} Değerlendirme Testi'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 25,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      'Test sonuçlarınıza göre ${title == 'Stres Yönetimi' ? 'stres' : title.toLowerCase()} belirtileri görünmekte,\n',
                  style: const TextStyle(
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.4,
                      color: Constant.black,
                      letterSpacing: -0.35),
                  children: const <TextSpan>[
                    TextSpan(
                      text:
                          'ancak kesin bir teşhis için bir sağlık profesyoneli ile iletişime geçmelisiniz.',
                      style: TextStyle(
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 1.4,
                        color: Constant.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 50,
                width: 220,
                child: ElevatedButton(
                  onPressed: () => {Grock.to(BaseScaffold())},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Constant.purple.withOpacity(0.15),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text(
                    'Ana Sayfa',
                    style: TextStyle(
                      color: Constant.purple,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.6,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
