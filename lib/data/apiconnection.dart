import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchLatestMovies() async {
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
    return detailedMovies;
  } else {
    throw Exception('Failed to load latest movies');
  }

}

class Apicategories {
  final String baseUrl = 'http://www.omdbapi.com/';
  final String apiKey = '770267f9';

  Future<List<Movie>> fetchMovies(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl?s=$query&apikey=$apiKey'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['Response'] == 'True') {
        List movies = jsonResponse['Search'];
        return movies.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('No movies found');
      }
    } else {
      throw Exception('Failed to load movies');
    }
  }
}

class Movie {
  final String title;
  final String poster;
  final String year;

  Movie({required this.title, required this.poster, required this.year});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      poster: json['Poster'],
      year: json['Year'],
    );
  }
}

