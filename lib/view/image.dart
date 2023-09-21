import 'package:Psynexa/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ImagePickerView extends StatefulWidget {
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
    final String apiUrl = '${Constant.domain}/ai/predict_spiral_parkinson';
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
      appBar: AppBar(
        title: Text('Image Picker Örneği'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null ? Text('Resim Seçilmedi') : Image.file(_image!),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        tooltip: 'Resim Seç',
        child: Icon(Icons.image),
      ),
    );
  }
}
