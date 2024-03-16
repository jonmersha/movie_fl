class MovieModel {
  List<Data>? data;

  MovieModel({this.data});

  MovieModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? iD;
  String? titile;
  String? movieDescription;
  int? viewNumber;
  int? likesNumber;
  int? rating;
  String? imageUrl;
  String? videoUrl;
  int? isSeries;

  Data(
      {this.iD,
      this.titile,
      this.movieDescription,
      this.viewNumber,
      this.likesNumber,
      this.rating,
      this.imageUrl,
      this.videoUrl,
      this.isSeries});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    titile = json['titile'];
    movieDescription = json['movie_description'];
    viewNumber = json['view_number'];
    likesNumber = json['likes_number'];
    rating = json['rating'];
    imageUrl = json['image_url'];
    videoUrl = json['video_url'];
    isSeries = json['is_series'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['titile'] = titile;
    data['movie_description'] = movieDescription;
    data['view_number'] = viewNumber;
    data['likes_number'] = likesNumber;
    data['rating'] = rating;
    data['image_url'] = imageUrl;
    data['video_url'] = videoUrl;
    data['is_series'] = isSeries;
    return data;
  }
}
