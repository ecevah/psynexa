import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:grock/grock.dart';
import '../constant/constant.dart';

// ignore: must_be_immutable
class FirstBtn extends StatelessWidget {
  Function onTap;
  String text;

  FirstBtn({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 340,
      child: ElevatedButton(
        onPressed: () => onTap(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Constant.purple.withOpacity(0.17),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: 12.allBR)),
        child: Text(
          text,
          style: const TextStyle(
              color: Constant.purple,
              fontWeight: FontWeight.w700,
              fontSize: 13),
        ),
      ),
    );
  }
}
