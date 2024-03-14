class MovieModel {
  int? iD;
  String? title;
  String? movieDescription;
  int? viewNumber;
  int? likesNumber;
  int? rating;
  String? imageUrl;
  String? videoUrl;
  int? isSeries;

  MovieModel(
      {this.iD,
        this.title,
        this.movieDescription,
        this.viewNumber,
        this.likesNumber,
        this.rating,
        this.imageUrl,
        this.videoUrl,
        this.isSeries});

  MovieModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    title = json['titile'];
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
    data['titile'] = this.title;
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
