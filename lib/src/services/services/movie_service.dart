import 'package:get/get.dart';
import 'package:movie_flutter/src/services/api_client.dart';
import 'package:movie_flutter/src/utility/app_constants.dart';

class MovieService extends GetxService{
  final ApIClient apIClient;

  MovieService({required this.apIClient});
  Future<Response> getMovies() async {
    return await apIClient.getData(movies);
  }
  Future<Response> getMovieSeries(int id) async {
    return await apIClient.getData('$subMovies/?id=$id');
  }

}