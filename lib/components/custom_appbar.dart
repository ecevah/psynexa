import 'package:Psynexa/constant/constant.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appbarTitle;

  const CustomAppBar({Key? key, required this.appbarTitle})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        appbarTitle,
        style: const TextStyle(
            color: Constant.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
            fontFamily: 'Proxima Nova',
            letterSpacing: -0.3),
      ),
      leading: const SizedBox(),
      backgroundColor: Constant.white,
    );
  }
}
