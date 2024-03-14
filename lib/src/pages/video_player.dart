import 'dart:async';

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
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    initialize(widget.videoUrl);
  }
  initialize(String url){
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(url),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);

  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

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
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Expanded(
              child:
                  GetBuilder<SubMovieController>(builder: (subMovieController) {
                return subMovieController.isLoaded
                    ? ListView.builder(
                        itemCount: subMovieController.movieSeriesList.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
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
                                    borderRadius: BorderRadius.horizontal(left:Radius.circular(10)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '$BASE_URL${subMovieController.movieSeriesList[index].imageUrl!}'),
                                          fit: BoxFit.fill)),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                          '${subMovieController.movieSeriesList[index].movieDescription!}'),
                                      Text('Likes')
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      initialize('$BASE_URL${subMovieController.movieSeriesList[index].videoUrl!}');
                                      if (_controller.value.isPlaying) {
                                        _controller.pause();
                                      } else {
                                        _controller.play();
                                      }
                                    });

                                  },
                                  child: Container(
                                    height: double.infinity,
                                    width: 50,
                                  color: Colors.amber,
                                    child: Icon(
                                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,size: 60,

                                    ),),
                                )
                              ],
                            ),
                          );
                        })
                    : const CircularProgressIndicator(
                        color: Colors.red,
                      );
              }),
            )
          ],
        ),

      ),
    );
  }
}
