import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MoviePlayer extends StatefulWidget {
  final String videoUrl;

  const MoviePlayer({super.key, required this.videoUrl});

  @override
  State<MoviePlayer> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<MoviePlayer> {
  int playIndex = 0;
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late  ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    initialize(widget.videoUrl);
  }

  initialize(String url) {
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        url));
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
     chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Chewie(
                  controller: chewieController,
                )
              );
            } else {
              return Container(
                color: Colors.black,
                constraints: const BoxConstraints(
                    minHeight: 100,
                    minWidth: double.infinity,
                    maxHeight: 200),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }

}
