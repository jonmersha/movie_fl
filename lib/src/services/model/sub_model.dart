class SubModel {
  List<Sub>? sub;

  SubModel({this.sub});

  SubModel.fromJson(Map<String, dynamic> json) {
    if (json['Sub'] != null) {
      sub = <Sub>[];
      json['Sub'].forEach((v) {
        sub!.add(new Sub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sub != null) {
      data['Sub'] = this.sub!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Parent_ID'] = this.parentID;
    data['titile'] = this.titile;
    data['movie_description'] = this.movieDescription;
    data['image_url'] = this.imageUrl;
    data['video_url'] = this.videoUrl;
    data['epsode_'] = this.epsode;
    data['season_'] = this.season;
    return data;
  }
}
