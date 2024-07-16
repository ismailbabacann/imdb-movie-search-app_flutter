import 'package:flutter/material.dart';

class Movieinfocard extends StatefulWidget {
  const Movieinfocard({Key? key}) : super(key: key);

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
              ),
              child: Placeholder(), // Buraya istediğiniz film posterini ekleyebilirsiniz
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
                  Icons.bookmark,
                  color: isBookmarked ? Colors.amber : Colors.black,
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
              Text(
                "Hitman's Wife's Bodyguard",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '3.5',
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
              SizedBox(
                height: 10,
              ),
              Text(
                "Action, Comedy, Crime",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        )
      ],
    );
  }
}
