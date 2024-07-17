import 'dart:convert';
import 'package:http/http.dart' as http;

class Apiconnection {
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
