import 'package:flutter/material.dart';
import 'package:moviesearchapp/ui/screens/discover.dart';
import 'package:moviesearchapp/ui/specialwidgets/movieinfocard.dart';
import 'package:moviesearchapp/ui/specialwidgets/ratingcard.dart';

class Mainpage extends StatefulWidget {
  final List movies;
  final List bookmarkedMovies;

  Mainpage({Key? key, required this.movies, required this.bookmarkedMovies}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List bestMovies = [];
  List newestMovies = [];

  @override
  void initState() {
    super.initState();
    _fetchBestMovies();
    _fetchNewestMovies();
  }

  void _fetchBestMovies() {
    // Sort movies by imdbRating in descending order
    widget.movies.sort((a, b) {
      double ratingA = double.tryParse(a["imdbRating"]) ?? 0.0;
      double ratingB = double.tryParse(b["imdbRating"]) ?? 0.0;
      return ratingB.compareTo(ratingA); // Descending order
    });

    // Take the top 5 movies
    bestMovies = widget.movies.take(5).toList();
  }

  void _fetchNewestMovies() {
    // Sort movies by year in descending order
    widget.movies.sort((a, b) {
      int yearA = int.tryParse(a["Year"]) ?? 0;
      int yearB = int.tryParse(b["Year"]) ?? 0;
      return yearB.compareTo(yearA); // Descending order by year
    });
    newestMovies = widget.movies.take(20).toList();
  }

  void _toggleBookmark(Map movie) {
    setState(() {
      if (widget.bookmarkedMovies.contains(movie)) {
        widget.bookmarkedMovies.remove(movie);
      } else {
        widget.bookmarkedMovies.add(movie);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _fetchBestMovies(); // Ensure best movies are fetched
    _fetchNewestMovies(); // Ensure newest movies are fetched

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
                  children: bestMovies.map((mov) {
                    bool isBookmarked = widget.bookmarkedMovies.contains(mov);
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => _toggleBookmark(mov),
                          child: RatingCard(
                            title: mov["Title"],
                            rating: mov["imdbRating"],
                            posterUrl: mov["Poster"],
                            icon: isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    );
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
                children: newestMovies.map((movie) {
                  bool isBookmarked = widget.bookmarkedMovies.contains(movie);
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () => _toggleBookmark(movie),
                        child: Movieinfocard(
                          title: movie['Title'],
                          rating: movie['imdbRating'],
                          genres: movie['Genre'],
                          plot: movie['Plot'],
                          posterUrl: movie['Poster'],
                          icon: isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                        ),
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
