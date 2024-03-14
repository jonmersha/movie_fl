import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flutter/src/components/movie_card.dart';
import 'package:movie_flutter/src/pages/video_player.dart';
import 'package:movie_flutter/src/services/controllers/movies._service_controller.dart';
import 'package:movie_flutter/src/utility/app_constants.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({super.key});

  @override
  Widget build(BuildContext context) {



    return GetBuilder<MovieServiceController>(builder: (movieController){

      print(movieController.movieList);
      return movieController.isLoaded?
      ListView.builder(itemCount: movieController.movieList.length,
        itemBuilder: (BuildContext context, int index)  {
        return
          InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  VideoPlayerScreen(videoUrl: '$BASE_URL${movieController.movieList[index]["video_url"]}'),
                ),
              );
            },
            child: MovieCard(
              title: movieController.movieList[index]['titile'],
              rating: movieController.movieList[index]["rating"].toDouble(),
              likes: movieController.movieList[index]["likes_number"],
              views: movieController.movieList[index]["view_number"],
              subtitle: movieController.movieList[index]["movie_description"],
              imageUrl: '$BASE_URL${movieController.movieList[index]['image_url']}',
            ),
          );
  } ):const CircularProgressIndicator(
        color: Colors.red,
      );
    });
  }
}
