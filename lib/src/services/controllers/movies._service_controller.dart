import 'package:get/get.dart';
import 'package:movie_flutter/src/services/repositories/movies_repository.dart';

class MovieServiceController extends GetxController{
  final MovieRepo movieRepo;
  MovieServiceController({required this.movieRepo});
  var movieList = [];
  //List<dynamic> get movieList=>_movieList;


  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getMovieList() async {
  //  print("Movie Sections ");
    Response response = await movieRepo.getMovies();

    if (response.statusCode == 200) {
      //print("got Products====================================");
      //movieList = [];
      //movieList.addAll(MovieModelList.fromJson(response.body[0]).movieModel);
      movieList=response.body;
      _isLoaded = true;
      print(response.body);
      update();
      _isLoaded=true;
    } else {
      print(response.statusText);
    }
  }

}