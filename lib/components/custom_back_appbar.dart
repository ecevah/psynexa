import 'package:Psynexa/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class CustomAccAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appbarTitle;

  const CustomAccAppBar({Key? key, required this.appbarTitle})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 9.0),
        child: Text(
          appbarTitle,
          style: const TextStyle(
            color: Constant.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
            fontFamily: 'Proxima Nova',
          ),
        ),
      ),
      leading: IconButton(
        padding: const EdgeInsets.all(23.0),
        onPressed: () {
          Grock.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          size: 20,
        ),
        color: Constant.black,
      ),
      backgroundColor: Constant.white,
    );
  }
}
