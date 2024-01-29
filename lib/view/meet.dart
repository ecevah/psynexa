import 'dart:async';
import 'dart:io';
import 'package:Psynexa/view/gorusme_sonland%C4%B1.dart';
import 'package:flutter/material.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';
import 'package:camera/camera.dart';
import 'package:video_player/video_player.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:grock/grock.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Psynexa/assets.dart';

class VideoConferencePage extends StatefulWidget {
  final String conferenceID;
  final String name;
  final String id;
  final String image;

  final String title;
  final String rol;
  const VideoConferencePage(
      {Key? key,
      required this.conferenceID,
      required this.name,
      required this.id,
      required this.image,
      required this.title,
      required this.rol})
      : super(key: key);

  @override
  State<VideoConferencePage> createState() => _VideoConferencePageState();
}

class _VideoConferencePageState extends State<VideoConferencePage> {
  late VideoPlayerController _videoPlayerController;
  late CameraController _cameraController;
  XFile? _recordedVideo;
  bool _isRecording = false;
  late ZegoUIKitPrebuiltVideoConferenceController _videoConferenceController;

  @override
  void initState() {
    super.initState();
    initializeCamera();
    _videoConferenceController = ZegoUIKitPrebuiltVideoConferenceController();
    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _videoPlayerController.initialize().then((_) {
      setState(() {});
    });
  }

  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
      await _cameraController.initialize();
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> _recordVideo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_isRecording) {
      XFile? recordedVideo = await _cameraController.stopVideoRecording();
      print('xfile dosya numarası gardaşş ${recordedVideo.path}');
      setState(() {
        _isRecording = false;
        _recordedVideo = recordedVideo;
      });
      if (recordedVideo != null) {
        try {
          String apiUrl = '${Constant.domain}/api/videos/create';
          String reservationId = '65a82fe450e8670e434f1de6';

          final request = http.MultipartRequest('POST', Uri.parse(apiUrl));
          request.headers['Content-Type'] = 'multipart/form-data';
          request.headers['x-access-token'] =
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwc3ljaG9sb2dpc3QiOnsiX2lkIjoiNjVhODI2NGUyMTY0ODg0ZWYyZjc1M2E5IiwibmFtZSI6IlBzeWMgQWhtZXQiLCJzdXJOYW1lIjoiRWNldml0IiwicGFzcyI6IiQyYSQwOCR1bVpYeTU3VXFudnVmdEZ4emZCNW8uSVN1QUFzNHk5b1BBYU1uR1YwWFRzVGdwakRjZVNMUyIsImVNYWlsIjoiZWVjZXZhaEBnbWFpbC5jb20iLCJ0YWciOlsidXptYW4iXSwiaW1hZ2UiOiJpbWFnZS0xNzA1NTE4NjcwODUwLmpwZWciLCJ1bnZhbiI6ImtsaW5payBwc2lrb2xvaCIsInN0YXIiOltdLCJzdGFyQXZnIjpbXSwiYWN0aXZlIjpmYWxzZSwiYWNjQWN0aXZlIjp0cnVlLCJjcmVhdGVBdCI6IjIwMjQtMDEtMTdUMTk6MTE6MTAuODcyWiIsInVwZGF0ZUF0IjoiMjAyNC0wMS0xN1QxOToxMToxMC44NzJaIiwiX192IjowfSwiaWF0IjoxNzA1NTIwMTM1fQ.ad3WLnfmxtpnob3kSqVRZHtUZuOv8nX-CMkQHHdRth4";

          request.fields['reservation_id'] = reservationId;
          request.files.add(
              await http.MultipartFile.fromPath('media', recordedVideo.path));
          final response = await request.send();

          if (response.statusCode == 200) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GorusmeSonu(
                  image: widget.image,
                  title: widget.title,
                  rol: widget.rol,
                ),
              ),
            );
          } else {
            print(
                'Video upload failed with status code: ${response.statusCode}');
          }
        } catch (error) {
          print('Error uploading video: $error');
        }
      }
    } else {
      if (!_cameraController.value.isInitialized) {
        print('CameraController is not initialized');
        return;
      }

      try {
        await _cameraController.prepareForVideoRecording();
        await _cameraController.startVideoRecording();
        setState(() {
          _isRecording = true;
        });
      } catch (e) {
        print('Error starting video recording: $e');
      }
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.white, // Set the background color to white
            child: ZegoUIKitPrebuiltVideoConference(
              appID: Constant.appID,
              appSign: Constant.appSing,
              userID: widget.id,
              userName: widget.name,
              conferenceID: widget.conferenceID,
              config: ZegoUIKitPrebuiltVideoConferenceConfig(
                topMenuBarConfig: ZegoTopMenuBarConfig(title: ''),
                onLeave: () async {
                  _isRecording
                      ? await _recordVideo()
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GorusmeSonu(
                              image: widget.image,
                              title: widget.title,
                              rol: widget.rol,
                            ),
                          ),
                        );
                },
              ),
              controller: _videoConferenceController,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                margin: const EdgeInsets.only(top: 50, left: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: _isRecording
                            ? Colors.greenAccent.withOpacity(1)
                            : Constant.black75.withOpacity(0.17),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: 12.allBR)),
                    onPressed: _isRecording ? null : _recordVideo,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          _isRecording
                              ? Assets.icons.circleSVG
                              : Assets.icons.eyeOffSVG,
                          color: _isRecording ? Colors.green : Colors.red,
                          height: 15,
                          width: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Ai",
                          style: TextStyle(
                              color: _isRecording
                                  ? Colors.greenAccent
                                  : Colors.white),
                        ),
                      ],
                    ))),
          ),
        ],
      ),
    );
  }
}
