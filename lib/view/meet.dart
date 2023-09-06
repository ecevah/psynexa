import 'package:flutter/material.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/gorusme_sonlandı.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

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
              onLeave: () {
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
