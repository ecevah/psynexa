import 'package:flutter/material.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/gorusme_sonland%C4%B1.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class VideoConferencePage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ZegoUIKitPrebuiltVideoConference(
            appID: Constant.appID,
            appSign: Constant.appSing,
            userID: id,
            userName: name,
            conferenceID: conferenceID,
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
