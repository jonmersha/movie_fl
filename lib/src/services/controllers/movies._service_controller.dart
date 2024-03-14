import 'package:get/get.dart';
import 'package:movie_flutter/src/services/model/moveis_model.dart';
import 'package:movie_flutter/src/services/repositories/movies_repository.dart';

class MovieServiceController extends GetxController{
  final MovieRepo movieRepo;
  MovieServiceController({required this.movieRepo});
  List<MovieModel> _movieList = [];
  List<MovieModel> get movieList=>_movieList;


  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getMovieList() async {
  //  print("Movie Sections ");
    Response response = await movieRepo.getMovies();

    if (response.statusCode == 200) {
      //print("got Products====================================");
      _movieList = [];
      _movieList.addAll(MovieModel.fromJson(response.body) as Iterable<MovieModel>);
     // movieList=response.body;
      _isLoaded = true;
      //print(response.body);
      update();
      _isLoaded=true;
    } else {
      print(response.statusText);
    }
  }

}