import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flutter/src/components/movie_card.dart';
import 'package:movie_flutter/src/pages/video_player.dart';
import 'package:movie_flutter/src/services/controllers/movies._service_controller.dart';
import 'package:movie_flutter/src/services/controllers/movies_series.dart';
import 'package:movie_flutter/src/utility/app_constants.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieServiceController>(builder: (movieController) {
      //print(movieController.movieList);
      return movieController.isLoaded
          ? ListView.builder(
              itemCount: movieController.movieList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.find<SubMovieController>()
                        .getMovieList(movieController.movieList[index].iD!);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerScreen(
                            videoUrl:
                                '$BASE_URL${movieController.movieList[index].videoUrl}'),
                      ),
                    );
                  },
                  child: MovieCard(
                    title: movieController.movieList[index].titile!,
                    rating: movieController.movieList[index].rating!.toDouble(),
                    likes: movieController.movieList[index].likesNumber!,
                    views: movieController.movieList[index].viewNumber!,
                    subtitle:
                        movieController.movieList[index].movieDescription!,
                    imageUrl:
                        '$BASE_URL${movieController.movieList[index].imageUrl}',
                  ),
                );
              })
          : const CircularProgressIndicator(
              color: Colors.red,
            );
    });
  }
}
