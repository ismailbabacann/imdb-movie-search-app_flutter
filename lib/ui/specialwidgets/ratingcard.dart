import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  final String title;
  final String rating;
  final String posterUrl;

  const RatingCard(
      {super.key,
        required this.title,
        required this.rating,
        required this.posterUrl});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            width: deviceWidth / 1.18,
            height: deviceHeight / 3, // Görselin boyutunu uygun hale getirdim
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(posterUrl),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
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
                      Icon(Icons.star, color: Colors.amber, size: 24),
                      Icon(Icons.star, color: Colors.amber, size: 24),
                      Icon(Icons.star, color: Colors.amber, size: 24),
                      Icon(Icons.star_half, color: Colors.amber, size: 24),
                      Icon(Icons.star_border, color: Colors.amber, size: 24),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
