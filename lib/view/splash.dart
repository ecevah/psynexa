import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/svg.dart';
// ignore: depend_on_referenced_packages
import 'package:grock/grock.dart';
import 'package:Psynexa/view/onboard.dart';
import '../assets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Grock.toRemove(const FirstPage());
    });
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: 12.allP,
                child: SvgPicture.asset(
                  Assets.images.imLogoSvgSVG,
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                    child: SizedBox(
                      height: 43.2,
                      width: 43.2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 12.0, left: 14, right: 14),
                        child: SvgPicture.asset(
                          Assets.icons.icCircle1SVG,
                        ),
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: Tween(begin: 1.0, end: 0.0).animate(_controller),
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: SvgPicture.asset(
                          Assets.icons.icCircle2SVG,
                        ),
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                    child: SizedBox(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 19.0, left: 2, right: 1),
                        child: SizedBox(
                          height: 43.2,
                          width: 43.2,
                          child: SvgPicture.asset(
                            Assets.icons.icCircle3SVG,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
