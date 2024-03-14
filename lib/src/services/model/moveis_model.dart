// class MovieModelList {
//  late List<MovieModel> _movieModel;
//  List<MovieModel>get movieModel=> _movieModel;
//
//   MovieModelList({required movieModel});
//
//   MovieModelList.fromJson(Map<String, dynamic> json) {
//     if (json['MovieModel'] != null) {
//       _movieModel = <MovieModel>[];
//       json['MovieModel'].forEach((v) {
//         _movieModel.add(new MovieModel.fromJson(v));
//       });
//     }
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   if (this.movieModel != null) {
//   //     data['MovieModel'] = this.movieModel!.map((v) => v.toJson()).toList();
//   //   }
//   //   return data;
//   // }
// }
//
// class MovieModel {
//   int? iD;
//   String? titile;
//   int? viewNumber;
//   int? likesNumber;
//   int? rating;
//   String? imageUrl;
//   String? videoUrl;
//   int? isSeries;
//
//   MovieModel(
//       {this.iD,
//         this.titile,
//         this.viewNumber,
//         this.likesNumber,
//         this.rating,
//         this.imageUrl,
//         this.videoUrl,
//         this.isSeries});
//
//   MovieModel.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     titile = json['titile'];
//     viewNumber = json['view_number'];
//     likesNumber = json['likes_number'];
//     rating = json['rating'];
//     imageUrl = json['image_url'];
//     videoUrl = json['video_url'];
//     isSeries = json['is_series'];
//   }
//
//
// }
