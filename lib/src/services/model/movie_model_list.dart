class MovieModel {
  List<Data>? data;

  MovieModel({this.data});

  MovieModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['titile'] = this.titile;
    data['movie_description'] = this.movieDescription;
    data['view_number'] = this.viewNumber;
    data['likes_number'] = this.likesNumber;
    data['rating'] = this.rating;
    data['image_url'] = this.imageUrl;
    data['video_url'] = this.videoUrl;
    data['is_series'] = this.isSeries;
    return data;
  }
}
