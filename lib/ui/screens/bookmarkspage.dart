import 'package:flutter/material.dart';
import 'package:moviesearchapp/ui/specialwidgets/movieinfocard.dart';

class Bookmarkspage extends StatefulWidget {
  final List bookmarkedMovies;

  const Bookmarkspage({super.key, required this.bookmarkedMovies});

  @override
  State<Bookmarkspage> createState() => _BookmarkspageState();
}

class _BookmarkspageState extends State<Bookmarkspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Icon(Icons.bookmark,),
        ),
        iconTheme: IconThemeData(color: Colors.amber , size: 40),
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
                      color: Colors.amber))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            children: widget.bookmarkedMovies.map((movie) {
              return Column(
                children: [
                  Movieinfocard(
                    title: movie['Title'],
                    rating: movie['imdbRating'],
                    genres: movie['Genre'],
                    plot: movie['Plot'],
                    posterUrl: movie['Poster'],
                    icon: Icons.bookmark, // Directly set the bookmark icon
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
