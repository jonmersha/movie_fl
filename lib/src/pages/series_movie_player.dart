import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flutter/src/services/controllers/movies_series.dart';
import 'package:movie_flutter/src/utility/app_constants.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
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
        body: Column(
          children: [
            FutureBuilder(
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

            Expanded(
              child: GetBuilder<SubMovieController>(builder: (subMovieController) {
                  return subMovieController.isLoaded
                ? ListView.builder(
                    itemCount: subMovieController.movieSeriesList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        height: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 130,
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(10)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '$BASE_URL${subMovieController.movieSeriesList[index].imageUrl!}'),
                                      fit: BoxFit.fill)),
                            ),
                            Expanded(
                              //flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${subMovieController.movieSeriesList[index].movieDescription!}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'Season${subMovieController.movieSeriesList[index].season!}: Episode${subMovieController.movieSeriesList[index].epsode!}'),
                                    //Text('${_controller.value.position}'),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (index != playIndex) {
                                    initialize(
                                        '$BASE_URL${subMovieController.movieSeriesList[index].videoUrl!}');
                                  }
                                  if (_controller.value.isPlaying) {
                                    _controller.pause();
                                  } else {
                                    _controller.play();
                                  }
                                  playIndex = index;
                                });
                              },
                              child: Container(
                                height: double.infinity,
                                width: 50,
                                color: (index != playIndex)
                                    ? Colors.grey.shade200
                                    : Colors.green,
                                child: Icon(
                                  (index == playIndex) &&
                                          _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    })
                : Center(
                  child: const CircularProgressIndicator(
                      color: Colors.red,
                    ),
                );
                }),
            )
          ],
        ),
      ),
    );
  }

}
