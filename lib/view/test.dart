import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/components/customtestcard.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/testson.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class TestView extends StatefulWidget {
  String title;
  String image;
  TestView({super.key, required this.title, required this.image});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  List<String> question = [
    "Bu günlerde genellikle kendimi neşeli hissediyorum.",
    "Uyumakla ilgili sorunlarım var.",
    "Kendimi değersiz hissettiğim zamanlar oluyor",
    "Yakın zamanda ilgi duyduğum aktivitelerden zevk alamıyorum"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAccAppBar(appbarTitle: '${widget.title} Değerlendirme Testi'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 19, right: 19, bottom: 40),
              itemCount: question.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < question.length) {
                  return CustomTestCard(
                      number: index, question: question[index]);
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      height: 52,
                      width: 340,
                      child: ElevatedButton(
                        onPressed: () => {
                          Grock.to(
                            TestSon(
                              title: '${widget.title}',
                              image: '${widget.image}',
                            ),
                          ),
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Constant.purple.withOpacity(0.15),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: Text(
                          'Testi Tamamla',
                          style: const TextStyle(
                            color: Constant.purple,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.6,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
