import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constant/constant.dart';

class CustomPassword extends ConsumerStatefulWidget {
  TextEditingController? controller;

  CustomPassword({Key? key, required this.controller}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomPasswordState();
}

class _CustomPasswordState extends ConsumerState<CustomPassword> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 66,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: TextField(
          controller: widget.controller,
          cursorColor: Constant.purple,
          obscureText: _isObscure,
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
              ),
              focusColor: Constant.inputText,
              filled: true,
              fillColor: Constant.darkwhite,
              labelText: 'Şifre',
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  size: 20,
                ),
                color: Constant.inputText,
                onPressed: () {
                  setState(
                    () {
                      _isObscure = !_isObscure;
                    },
                  );
                },
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
        ),
      ),
    );
  }
}
