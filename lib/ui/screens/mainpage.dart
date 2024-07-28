import 'package:flutter/material.dart';
import 'package:moviesearchapp/data/apiconnection.dart';
import 'package:moviesearchapp/ui/screens/discover.dart';
import 'package:moviesearchapp/ui/specialwidgets/movieinfocard.dart';
import 'package:moviesearchapp/ui/specialwidgets/ratingcard.dart';
import 'package:moviesearchapp/ui/screens/moviedetailspage.dart';
import 'package:moviesearchapp/ui/screens/moviedetailspage.dart';

class Mainpage extends StatefulWidget {
  final List<Movie> movies;

  Mainpage({Key? key, required this.movies}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List<Movie> bestMovies = [];
  List<Movie> newestMovies = [];

  @override
  void initState() {
    super.initState();
    _fetchBestMovies();
    _fetchNewestMovies();
  }

  void _fetchBestMovies() {
    widget.movies.sort((a, b) {
      double ratingA = double.tryParse(a.rating) ?? 0.0;
      double ratingB = double.tryParse(b.rating) ?? 0.0;
      return ratingB.compareTo(ratingA);
    });

    bestMovies = widget.movies.take(5).toList();
  }

  void _fetchNewestMovies() {
    widget.movies.sort((a, b) {
      int yearA = int.tryParse(a.year) ?? 0;
      int yearB = int.tryParse(b.year) ?? 0;
      return yearB.compareTo(yearA);
    });
    newestMovies = widget.movies.take(20).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 40, 0, 0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: bestMovies.map((mov) {
                    return Row(
                      children: [
                        RatingCard(
                          title: mov.title,
                          rating: mov.rating,
                          posterUrl: mov.poster,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Moviedetailspage(movie: mov),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 20),
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 30),
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
                children: newestMovies.map((movie) {
                  return Column(
                    children: [
                      Movieinfocard(
                        title: movie.title,
                        rating: movie.rating,
                        genres: movie.genres,
                        plot: movie.plot,
                        posterUrl: movie.poster,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Moviedetailspage(movie: movie),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 30),
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
