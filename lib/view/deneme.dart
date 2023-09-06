import 'package:flutter/material.dart';
import 'package:microphone/microphone.dart';
import 'package:audioplayers/audioplayers.dart';

class Deneme extends StatefulWidget {
  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  bool _isRecording = false;
  bool _isPlaying = false;
  late String _recordedAudio;
  @override
  void initState() {
    super.initState();
    MicrophoneRecorder().start().then((value) {
      setState(() {
        _isRecording = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Audio Recorder'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Record button.
              TextButton(
                onPressed: () {
                  // Start recording the audio.
                  MicrophoneRecorder().start().then((value) {
                    setState(() {
                      _isRecording = true;
                    });
                  });
                },
                child: Text("Kayıt"),
                style: TextButton.styleFrom(
                  backgroundColor: _isRecording ? Colors.red : Colors.green,
                ),
              ),
              // Stop button.
              TextButton(
                onPressed: () {
                  // Stop recording the audio.
                  MicrophoneRecorder().stop().then((value) {
                    setState(() {
                      _isRecording = false;
                    });
                  });
                },
                child: Text("Durdur"),
                style: TextButton.styleFrom(
                  backgroundColor: _isRecording ? Colors.red : Colors.green,
                ),
              ),
              // Play button.
              TextButton(
                onPressed: () {
                  print(_isPlaying);
                },
                child: Text("Oynat"),
                style: TextButton.styleFrom(
                  backgroundColor: _isPlaying ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
