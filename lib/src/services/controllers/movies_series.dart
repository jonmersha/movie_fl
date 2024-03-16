import 'package:get/get.dart';
import 'package:movie_flutter/src/services/model/sub_model.dart';
import 'package:movie_flutter/src/services/repositories/movies_repository.dart';

class SubMovieController extends GetxController {
  final MovieRepo movieRepo;

  SubMovieController({required this.movieRepo});
  List<dynamic> _movieSeriesList = [];
  List<dynamic> get movieSeriesList => _movieSeriesList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getMovieList(id) async {
    //  print("Movie Sections ");
    Response response = await movieRepo.getSubMovies(id);
    var rsp = {"Sub": response.body};
print(rsp);
    if (response.statusCode == 200) {
      //print("got Products====================================");
      _movieSeriesList = [];
      _movieSeriesList.addAll(SubModel.fromJson(rsp).sub!);
      _isLoaded = true;
      update();

    } else {
      print(response.statusText);
    }
  }
}
