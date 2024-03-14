import 'package:get/get.dart';
import 'package:movie_flutter/src/services/api_client.dart';
import 'package:movie_flutter/src/utility/app_constants.dart';

class MovieRepo extends GetxService {
  final ApIClient apIClient;
  MovieRepo({required this.apIClient});
  Future<Response> getMovies() async {
    return await apIClient.getData(movies);
  }

  Future<Response> getSubMovies(id) async {
    return await apIClient.getData('$subMovies/$id');
  }
}
