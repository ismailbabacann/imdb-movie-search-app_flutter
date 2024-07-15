import 'package:flutter/material.dart';

class Movieinfocard extends StatelessWidget {
  final String title;
  final String rating;
  final String genres;
  final String plot;
  final String posterUrl;

  const Movieinfocard(
      {super.key,
        required this.title,
        required this.rating,
        required this.genres,
        required this.plot,
        required this.posterUrl});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: deviceWidth / 2.2,
          height: deviceHeight / 2.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
            image: DecorationImage(
              image: NetworkImage(posterUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text(genres,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                plot,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    rating,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  ...List.generate(5, (index) {
                    double starRating = double.tryParse(rating) ?? 0.0;
                    return Icon(
                      index < starRating / 2 ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 24,
                    );
                  }),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
