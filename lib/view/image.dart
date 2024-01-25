import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/testson.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';

class ImagePickerView extends StatefulWidget {
  String image;
  String title;
  ImagePickerView({required this.image, required this.title});
  @override
  _ImagePickerViewState createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  final Map<String, double> resultData = {
    "Agorafobi": 0.1,
    "Bipolar": 0.1,
    "Borderline": 0.1,
    "Cinsel İlişkili Bozukluklar": 0.0,
    "DEHB": 90.9,
    "Demans": 8.1,
    "Depresyon": 0.0,
    "Madde ile ilişkili bozukluklar": 0.1,
    "OKB": 0.3,
    "Paranoid": 0.0,
    "Parkinson": 0.1,
    "Sosyal Fobi": 0.1,
    "Yeme Bozuklukları": 0.0,
  };

  File? _image;
  String? _base64Image;

  Future _getImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
        source: ImageSource
            .gallery); // Kameradan almak için ImageSource.camera kullanabilirsiniz.
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _base64Image = base64Encode(_image!.readAsBytesSync());
        _base64Image != null ? postData(_base64Image) : null;
      });
    }
  }

  Future<void> postData(
    String? base64,
  ) async {
    const String apiUrl = '${Constant.domain}/ai/predict_spiral_parkinson';
    final Map<String, dynamic> data = {'image': base64, 'result': resultData};
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Yanıt veri: ${response.body}');
    } else {
      print('HTTP isteği başarısız: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAccAppBar(appbarTitle: 'Demans Değerlendirme Testi'),
      body: Center(
        child: Expanded(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _image == null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GrockContainer(
                              onTap: _getImage,
                              padding:
                                  const EdgeInsets.fromLTRB(25, 50, 25, 15),
                              child:
                                  SvgPicture.asset(Assets.images.imageinputSVG),
                            ),
                            const Text(
                              'Psikoloğun İstediği: Saat Çizimi',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.2,
                                fontWeight: FontWeight.w600,
                                color: Constant.black75,
                                fontFamily: 'Proxima Nova',
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Saat çiziminiz, tedavi ve terapi sürecinizdeki ilerlemeyi izlememize yardımcı olacak önemli bir kaynaktır.',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.2,
                                fontWeight: FontWeight.w500,
                                color: Constant.black.withOpacity(0.5),
                                fontFamily: 'Proxima Nova',
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )
                      : Image.file(_image!),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _image == null
          ? null
          : FloatingActionButton(
              onPressed: () {
                Grock.to(TestSon(title: widget.title, image: widget.image));
              },
              backgroundColor: Constant.purple,
              child: SvgPicture.asset(
                Assets.icons.icSendArrowSVG,
                color: Colors.white,
              ),
            ),
    );
  }
}
