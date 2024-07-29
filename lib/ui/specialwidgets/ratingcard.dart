import 'package:flutter/material.dart';

class RatingCard extends StatefulWidget {
  final String title;
  final String rating;
  final String posterUrl;
  final VoidCallback onTap;

  RatingCard({
    Key? key,
    required this.title,
    required this.rating,
    required this.posterUrl,
    required this.onTap,

  }) : super(key: key);

  @override
  _RatingCardState createState() => _RatingCardState();
}

class _RatingCardState extends State<RatingCard> {

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: widget.onTap,
              child: Container(
                width: deviceWidth / 1.18,
                height: deviceHeight / 3.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.posterUrl),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4), // Resim ve rating arasında boşluk
        Column(
          children: [
            SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
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
      ],
    );
  }
}
