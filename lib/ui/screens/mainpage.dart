import 'package:flutter/material.dart';
import 'package:moviesearchapp/ui/screens/discover.dart';
import 'package:moviesearchapp/ui/specialwidgets/movieinfocard.dart';
import 'package:moviesearchapp/ui/specialwidgets/ratingcard.dart';

class Mainpage extends StatefulWidget {
  final List movies;

  Mainpage({super.key, required this.movies});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    //double deviceHeight = MediaQuery.of(context).size.height;
    //double deviceWidth = MediaQuery.of(context).size.width;

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
                  children: widget.movies.map((mov) {
                    if ((double.tryParse(mov["imdbRating"]) ?? 0.0) > 6.9) {
                      return Row(
                        children: [
                          RatingCard(
                            title: mov["Title"],
                            rating: mov["imdbRating"],
                            posterUrl: mov["Poster"],
                          ),
                          SizedBox(width: 20),
                        ],
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }).toList(),
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
              Column(
                children: widget.movies.map((movie) {
                  return Column(
                    children: [
                      Movieinfocard(
                        title: movie['Title'],
                        rating: movie['imdbRating'],
                        genres: movie['Genre'],
                        plot: movie['Plot'],
                        posterUrl: movie['Poster'],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
