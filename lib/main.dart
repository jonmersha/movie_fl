import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flutter/src/pages/movie_list._page.dart';
import 'package:movie_flutter/src/services/api_client.dart';
import 'package:movie_flutter/src/services/controllers/movies._service_controller.dart';
import 'package:movie_flutter/src/services/controllers/movies_series.dart';
import 'package:movie_flutter/src/services/repositories/movies_repository.dart';
import 'package:movie_flutter/src/utility/app_constants.dart';

void main() {
  Get.lazyPut(() => ApIClient(appBaseUrl: BASE_URL));
  Get.lazyPut(() => MovieServiceController(movieRepo: Get.find()));
  Get.lazyPut(() => SubMovieController(movieRepo: Get.find()));
  Get.lazyPut(() => MovieRepo(apIClient: Get.find()));

  Get.find<MovieServiceController>().getMovieList();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(body: MovieListView()),
      ),
    );
  }
}
