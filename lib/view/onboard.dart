import 'package:Psynexa/components/exit_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/riverpod/onboard_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

final firstPageRiverpod = ChangeNotifierProvider((ref) => FirstPageRivepod());

class FirstPage extends ConsumerStatefulWidget {
  const FirstPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends ConsumerState<FirstPage> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(firstPageRiverpod);
    var read = ref.read(firstPageRiverpod);

    Future<bool> _onWillPop() async {
      return await onWillPop(context);
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SvgPicture.asset(
                  Assets.images.imLogoSvgSVG,
                  height: 26.64,
                  width: 140,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                child: _firstCardCarousel(read: read, watch: watch),
              ),
              SvgPicture.asset(
                Assets.images.imOnBoardSVG,
                height: 295,
                width: 350,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: SizedBox(
                  width: 320,
                  child: FirstBtn(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isNew', true);
                      Grock.toRemove(Login(
                        onBoard: false,
                      ));
                    },
                    text: 'DEVAM ET',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _firstCardCarousel extends StatelessWidget {
  const _firstCardCarousel({
    required this.read,
    required this.watch,
  });

  final FirstPageRivepod read;
  final FirstPageRivepod watch;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 160,
              child: PageView.builder(
                controller: read.pageController,
                itemCount: read.firstPage.card.length,
                scrollDirection: Axis.horizontal,
                onPageChanged: (newPageValue) =>
                    read.setFirstPageIndex(newPageValue),
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      width: 320,
                      child: Text(
                        watch.firstPage.card[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          height: 1.1,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(192, 0, 0, 0),
                          fontFamily: 'Proxima Nova',
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        width: 302,
                        child: Text(
                          watch.firstPage.card[index].text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            height: 1,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8391A1),
                            fontFamily: 'Proxima Nova',
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < read.firstPage.card.length; i++)
                    Container(
                      width: 8,
                      height: 8,
                      margin: 3.allP,
                      decoration: BoxDecoration(
                        color: watch.firstPageCurrentIndex == i
                            ? Constant.purple
                            : Constant.gray,
                        shape: BoxShape.circle,
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
