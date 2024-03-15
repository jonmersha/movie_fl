import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UTB extends StatefulWidget {
  final String videoUrl;

  const UTB({super.key, required this.videoUrl});

  @override
  State<UTB> createState() => _UTBState();
}

class _UTBState extends State<UTB> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    // TODO: implement initState
    print(' Video ID: ${widget.videoUrl}');
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '${widget.videoUrl}',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        //mute: true,
      ),
    );
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      progressColors: const ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
      onReady: () {
        _controller.addListener(listener);
      },
    );
  }
}
