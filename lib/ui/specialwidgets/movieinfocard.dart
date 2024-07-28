import 'package:flutter/material.dart';
import 'package:moviesearchapp/data/apiconnection.dart';

class Movieinfocard extends StatelessWidget {
  final String title;
  final String rating;
  final String genres;
  final String plot;
  final String posterUrl;
  final VoidCallback onTap;

  Movieinfocard({
    required this.title,
    required this.rating,
    required this.genres,
    required this.plot,
    required this.posterUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      child: ListTile(
        onTap: onTap,
        leading: Image.network(posterUrl),
        title: Text(title, style: TextStyle(color: Colors.white)),
        subtitle: Text(
          '$genres\nRating: $rating\nPlot: $plot',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
