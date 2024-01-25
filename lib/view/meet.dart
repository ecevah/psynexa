import 'package:flutter/material.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/gorusme_sonlandı.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

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
                },
              ),
              controller: ZegoUIKitPrebuiltVideoConferenceController(),
            ),
          ),
        ],
      ),
    );
  }
}
