import 'package:flutter/material.dart';
import 'package:moviesearchapp/ui/specialwidgets/movieinfocard.dart';
import 'package:moviesearchapp/ui/specialwidgets/ratingcard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Mainpage extends StatefulWidget {
  Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List movies = [];

  @override
  void initState() {
    super.initState();
    fetchLatestMovies();
  }

  Future<void> fetchLatestMovies() async {
    final response = await http.get(
      Uri.parse('http://www.omdbapi.com/?s=movie&apikey=770267f9'),
    );

    if (response.statusCode == 200) {
      List searchResults = json.decode(response.body)['Search'];
      List detailedMovies = [];

      for (var movie in searchResults) {
        final movieDetailsResponse = await http.get(
          Uri.parse('http://www.omdbapi.com/?i=${movie['imdbID']}&apikey=770267f9'),
        );

        if (movieDetailsResponse.statusCode == 200) {
          detailedMovies.add(json.decode(movieDetailsResponse.body));
        }
      }

      setState(() {
        movies = detailedMovies;
      });
    } else {
      throw Exception('Failed to load latest movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 60, 0, 0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //TOP FİVE YAZISI
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: const TextSpan(
                    text: "Top Five",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: ".",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //RATING CARD
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RatingCard(),
                    SizedBox(
                      width: 20,
                    ),
                    RatingCard(),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //LATEST SATIRI
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
                                color: Colors.amber))
                      ],
                    ),
                    selectionColor: Colors.white,
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  Text("SEE MORE",
                      style: TextStyle(color: Colors.amber, fontSize: 16)),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              // En son çıkan filmleri listeleyin
              Column(
                children: movies.map((movie) {
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
