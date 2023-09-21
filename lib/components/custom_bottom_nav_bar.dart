import 'package:Psynexa/assets.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/riverpod/base_scaffold_riverpod.dart';
import 'package:Psynexa/view/base_scaffold.dart';
import 'package:Psynexa/view/chatbot.dart';
import 'image_button.dart';

class CustomBottomNavBar extends ConsumerWidget {
  CustomBottomNavBar({super.key});
  String uid = "d3nQ9koukoiHfQ4dunj1";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(baseScaffoldRiverpod);
    var read = ref.read(baseScaffoldRiverpod);
    return Container(
      width: Grock.width,
      height: 90,
      padding: const EdgeInsets.only(bottom: 17, top: 10),
      decoration: const BoxDecoration(
        color: Constant.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < read.items.length / 2; i++)
            _navItem(read: read, i: i, watch: watch),
          Padding(
            padding: const EdgeInsets.only(bottom: 7.0, left: 4, right: 4),
            child: Hero(
              tag: 'chatgifhero',
              child: ImageButton(
                onPressed: () {
                  Grock.to(ChatBot());
                },
                imagePath: Assets.images.nexaGIF,
                width: 60,
                height: 60,
              ),
            ),
          ),
          for (int i = read.items.length ~/ 2; i < read.items.length; i++)
            _navItem(read: read, i: i, watch: watch),
        ],
      ),
    );
  }
}

class _navItem extends StatelessWidget {
  const _navItem({
    required this.read,
    required this.i,
    required this.watch,
  });

  final int i;
  final BaseScaffoldRiverpod read;
  final BaseScaffoldRiverpod watch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 18.horizontalP,
      child: InkWell(
        splashColor: const Color.fromARGB(107, 103, 71, 199),
        onTap: () {
          read.setCurrentIndex(i);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                i == watch.currentIndex
                    ? read.items[i].purple
                    : read.items[i].gray,
                color:
                    i == watch.currentIndex ? Constant.purple : Constant.black,
                height: 22,
                width: 22,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Icon(
                  Icons.circle,
                  color: i == watch.currentIndex
                      ? Constant.purple
                      : Colors.transparent,
                  size: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
