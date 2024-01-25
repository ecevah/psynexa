import 'package:flutter/material.dart';
import '../constant/constant.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  TextEditingController? controller;

  CustomText({Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 64,
      child: Padding(
        padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
        child: TextField(
          controller: controller,
          cursorColor: Constant.purple,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Constant.gray, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Constant.gray, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: const TextStyle(
              color: Constant.inputText,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              fontFamily: 'Proxima Nova',
            ),
            labelText: text,
            focusColor: Constant.inputText,
            filled: true,
            fillColor: Constant.darkwhite,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
      ),
    );
  }
}
