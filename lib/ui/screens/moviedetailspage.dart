import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:hive/hive.dart';

class Moviedetailspage extends StatefulWidget {
  final String title;
  final String rating;
  final String genres;
  final String plot;
  final String posterUrl;
  final String id;
  final String runtime;
  final String awards;
  final String actors;
  final String director;
  final String boxOffice;
  final String imdbVotes;
  final String country;
  final String released;

  const Moviedetailspage({
    super.key,
    required this.title,
    required this.rating,
    required this.genres,
    required this.plot,
    required this.posterUrl,
    required this.id,
    required this.runtime,
    required this.awards,
    required this.actors,
    required this.director,
    required this.boxOffice,
    required this.imdbVotes,
    required this.country,
    required this.released,
  });

  @override
  State<Moviedetailspage> createState() => _MoviedetailspageState();
}

class _MoviedetailspageState extends State<Moviedetailspage> {
  var isBookmarked = false;
  final Box bookmarksBox = Hive.box('bookmarks');

  @override
  void initState() {
    super.initState();
    List bookmarkedMovies = bookmarksBox.get('movies', defaultValue: []);
    isBookmarked = bookmarkedMovies.any((movie) => movie['id'] == widget.id);
  }

  void toggleBookmark() {
    List bookmarkedMovies = bookmarksBox.get('movies', defaultValue: []);
    if (isBookmarked) {
      bookmarkedMovies.removeWhere((movie) => movie['id'] == widget.id);
    } else {
      bookmarkedMovies.add({
        'id': widget.id,
        'title': widget.title,
        'rating': widget.rating,
        'genres': widget.genres,
        'plot': widget.plot,
        'posterUrl': widget.posterUrl,
        'Runtime': widget.runtime,
        'Awards': widget.awards,
        'Actors': widget.actors,
        'Director': widget.director,
        'BoxOffice': widget.boxOffice,
        'imdbVotes': widget.imdbVotes,
        'Country': widget.country,
        'Released': widget.released,
      });
    }
    bookmarksBox.put('movies', bookmarkedMovies);
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  void _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrlString(url.toString(), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        actions: [
          IconButton(
            alignment: Alignment.topRight,
            iconSize: 40,
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
              color: isBookmarked ? Colors.amber : Colors.white,
            ),
            onPressed: toggleBookmark,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Image.network(
            widget.posterUrl,
            fit: BoxFit.cover,
            width: deviceWidth,
            height: deviceHeight / 2,
          ),
          Container(
            height: deviceHeight,
            width: deviceWidth,
          ),
          // Black gradient
          Positioned(
            bottom: 0,
            child: Container(
              height: deviceHeight / 2,
              width: deviceWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
          // Content
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              width: deviceWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.rating,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 4),
                      ...List.generate(5, (index) {
                        double starRating = double.tryParse(widget.rating) ?? 0.0;
                        return Icon(
                          index < starRating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 10),
                  ReadMoreText(
                    widget.plot,
                    trimLines: 3,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    colorClickableText: Colors.amber,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: 'Read less',
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Genres: ${widget.genres}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Runtime: ${widget.runtime}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Awards: ${widget.awards}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Actors: ${widget.actors}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Director: ${widget.director}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Box Office: ${widget.boxOffice}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'IMDb Votes: ${widget.imdbVotes}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Country: ${widget.country}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Released: ${widget.released}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _launchURL('https://www.imdb.com/title/${widget.id}/');
                    },
                    child: Text('Open in IMDb'),
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
