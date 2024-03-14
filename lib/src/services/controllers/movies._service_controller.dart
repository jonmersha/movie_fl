import 'package:get/get.dart';
import 'package:movie_flutter/src/services/model/movie_model_list.dart';
import 'package:movie_flutter/src/services/repositories/movies_repository.dart';

class MovieServiceController extends GetxController {
  final MovieRepo movieRepo;
  MovieServiceController({required this.movieRepo});
  List<dynamic> _movieList = [];
  List<dynamic> get movieList => _movieList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getMovieList() async {
    //  print("Movie Sections ");
    Response response = await movieRepo.getMovies();

    var rsp = {"Data": response.body};

    if (response.statusCode == 200) {
      //print("got Products====================================");
      _movieList = [];
      _movieList.addAll(MovieModel.fromJson(rsp).data!);
      // movieList=response.body;
      _isLoaded = true;
      //print(response.body);
      update();
      _isLoaded = true;
    } else {
      print(response.statusText);
    }
  }
}
