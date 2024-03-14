import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class MovieCard extends StatelessWidget {
  final String title;
  final double rating;
  final int likes;
  final int views;
  final String subtitle;
  final String imageUrl;

  MovieCard({
    required this.title,
    required this.rating,
    required this.likes,
    required this.views,
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          //set border radius more than 50% of height and width to make circle
        ),
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 400,
            //color: Colors.yellow,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(5),bottom: Radius.circular(5)),
              image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.fill )
            ),
          ),

          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingBar(
                  initialRating: rating,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20.0,
                  ratingWidget: RatingWidget(
                    full: Icon(Icons.star, color: Colors.amber),
                    half: Icon(Icons.star_half, color: Colors.amber),
                    empty: Icon(Icons.star_border, color: Colors.amber),
                  ),
                  onRatingUpdate: (value) {
                    // You can handle the rating update here if needed
                  },
                ),
                Row(
                  children: [
                    Icon(Icons.thumb_up),
                    SizedBox(width: 4.0),
                    Text('$likes'),
                    SizedBox(width: 16.0),
                    Icon(Icons.remove_red_eye),
                    SizedBox(width: 4.0),
                    Text('$views'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}