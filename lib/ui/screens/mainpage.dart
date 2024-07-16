import 'package:flutter/material.dart';
import 'package:moviesearchapp/ui/screens/discover.dart';
import 'package:moviesearchapp/ui/specialwidgets/movieinfocard.dart';
import 'package:moviesearchapp/ui/specialwidgets/ratingcard.dart';
import 'package:moviesearchapp/ui/screens/bookmarkspage.dart';
import 'package:moviesearchapp/ui/screens/searchpage.dart';

class Mainpage extends StatefulWidget {
  Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 40, 0, 0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP FİVE YAZISI
              RichText(
                text: const TextSpan(
                  text: "Top Five",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: ".",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // RATING CARD
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RatingCard(),
                    SizedBox(width: 20),
                    RatingCard(),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // LATEST SATIRI
              Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      text: "Latest",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: ".",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Discover()),
                      );
                    },
                    child: Text(
                      "SEE MORE",
                      style: TextStyle(color: Colors.amber, fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 30),
              Movieinfocard(),
              SizedBox(height: 30),
              Movieinfocard(),
            ],
          ),
        ),
      ),
    );
  }
}
