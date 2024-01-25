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
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
    _loadPrefsAndNavigate();
  }

  void _loadPrefsAndNavigate() async {
    await Future.delayed(const Duration(seconds: 2));
    Grock.toRemove(const FirstPage());
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
              SvgPicture.asset(
                Assets.images.imLogoSvgSVG,
                height: 28.54,
                width: 150,
              ),
              const SizedBox(
                height: 14,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: SizedBox(
                        height: 7.56,
                        width: 7.56,
                        child: SvgPicture.asset(
                          Assets.icons.icCircle1SVG,
                        ),
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: Tween(begin: 1.0, end: 0.0).animate(_controller),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 7, top: 1),
                        child: SizedBox(
                          height: 9,
                          width: 17.64,
                          child: SvgPicture.asset(
                            Assets.icons.icCircle2SVG,
                          ),
                        ),
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          height: 15,
                          width: 25,
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
