import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moviesearchapp/ui/screens/moviedetailspage.dart';
import 'package:moviesearchapp/ui/specialwidgets/movieinfocard.dart';

class Bookmarkspage extends StatefulWidget {
  const Bookmarkspage({super.key});

  @override
  State<Bookmarkspage> createState() => _BookmarkspageState();
}

class _BookmarkspageState extends State<Bookmarkspage> {
  final Box bookmarksBox = Hive.box('bookmarks');

  @override
  Widget build(BuildContext context) {
    List bookmarkedMovies = bookmarksBox.get('movies', defaultValue: []);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Icon(Icons.bookmark),
        ),
        iconTheme: IconThemeData(color: Colors.amber, size: 40),
        backgroundColor: Colors.black,
        title: RichText(
          text: const TextSpan(
            text: "Bookmarks",
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
      ),
      body: ListView.builder(
        itemCount: bookmarkedMovies.length,
        itemBuilder: (context, index) {
          final movie = bookmarkedMovies[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Movieinfocard(
              title: movie['title'],
              rating: movie['rating'],
              genres: movie['genres'],
              plot: movie['plot'],
              posterUrl: movie['posterUrl'],
              runtime: movie['Runtime'] ?? '',
              awards: movie['Awards'] ?? '',
              actors: movie['Actors'] ?? '',
              director: movie['Director'] ?? '',
              boxOffice: movie['BoxOffice'] ?? '',
              imdbVotes: movie['imdbVotes'] ?? '',
              country: movie['Country'] ?? '',
              released: movie['Released'] ?? '',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Moviedetailspage(
                      title: movie['title'],
                      rating: movie['rating'],
                      genres: movie['genres'],
                      plot: movie['plot'],
                      posterUrl: movie['posterUrl'],
                      id: movie['id'],
                      runtime: movie['Runtime'] ?? '',
                      awards: movie['Awards'] ?? '',
                      actors: movie['Actors'] ?? '',
                      director: movie['Director'] ?? '',
                      boxOffice: movie['BoxOffice'] ?? '',
                      imdbVotes: movie['imdbVotes'] ?? '',
                      country: movie['Country'] ?? '',
                      released: movie['Released'] ?? '',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
