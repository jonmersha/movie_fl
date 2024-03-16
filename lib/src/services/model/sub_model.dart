class SubModel {
  List<Sub>? sub;

  SubModel({this.sub});

  SubModel.fromJson(Map<String, dynamic> json) {
    if (json['Sub'] != null) {
      sub = <Sub>[];
      json['Sub'].forEach((v) {
        sub!.add(Sub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sub != null) {
      data['Sub'] = sub!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sub {
  int? iD;
  int? parentID;
  String? titile;
  String? movieDescription;
  String? imageUrl;
  String? videoUrl;
  int? epsode;
  int? season;

  Sub(
      {this.iD,
      this.parentID,
      this.titile,
      this.movieDescription,
      this.imageUrl,
      this.videoUrl,
      this.epsode,
      this.season});

  Sub.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    parentID = json['Parent_ID'];
    titile = json['titile'];
    movieDescription = json['movie_description'];
    imageUrl = json['image_url'];
    videoUrl = json['video_url'];
    epsode = json['epsode_'];
    season = json['season_'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Parent_ID'] = parentID;
    data['titile'] = titile;
    data['movie_description'] = movieDescription;
    data['image_url'] = imageUrl;
    data['video_url'] = videoUrl;
    data['epsode_'] = epsode;
    data['season_'] = season;
    return data;
  }
}
