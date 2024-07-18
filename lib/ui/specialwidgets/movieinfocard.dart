import 'package:flutter/material.dart';

class Movieinfocard extends StatefulWidget {
  const Movieinfocard({Key? key, required this.title, required this.rating, required this.genres, required this.plot, required this.posterUrl, required this.icon}) : super(key: key);

  final String title;
  final String rating;
  final String genres;
  final String plot;
  final String posterUrl;
  final IconData icon;

  @override
  State<Movieinfocard> createState() => _MovieinfocardState();
}

class _MovieinfocardState extends State<Movieinfocard> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: deviceWidth / 2.2,
              height: deviceHeight / 2.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(widget.posterUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isBookmarked = !isBookmarked;
                  });
                },
                child: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_outline_rounded,
                  color: isBookmarked ? Colors.amber : Colors.white,
                  size: 45,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    widget.rating,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  ...List.generate(5, (index) {
                    double starRating = double.tryParse(widget.rating) ?? 0.0;
                    return Icon(
                      index < starRating / 2 ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 24,
                    );
                  }),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(widget.genres,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.plot,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),

            ],
          ),
        )
      ],
    );
  }
}
