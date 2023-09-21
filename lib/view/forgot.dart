import 'package:Psynexa/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
      ),
      body: Container(),
    );
  }
}
