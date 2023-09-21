import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/gorusme_sonlandı.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VideoConferencePage extends StatefulWidget {
  final String conferenceID;
  final String name;
  final String id;
  const VideoConferencePage(
      {Key? key,
      required this.conferenceID,
      required this.name,
      required this.id})
      : super(key: key);

  @override
  State<VideoConferencePage> createState() => _VideoConferencePageState();
}

class _VideoConferencePageState extends State<VideoConferencePage> {
  @override
  void initState() {
    super.initState();
    _initSpeech();
    _startListening();
  }

  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();

    setState(() {});
    _speechEnabled ? _startListening() : null;
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      _startListening();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ZegoUIKitPrebuiltVideoConference(
            appID: Constant.appID,
            appSign: Constant.appSing,
            userID: widget.id,
            userName: widget.name,
            conferenceID: widget.conferenceID,
            config: ZegoUIKitPrebuiltVideoConferenceConfig(
              topMenuBarConfig: ZegoTopMenuBarConfig(title: ''),
              onLeave: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GorusmeSonu(),
                  ),
                );
              },
            ),
            controller: ZegoUIKitPrebuiltVideoConferenceController(),
          ),
        ],
      ),
    );
  }
}
