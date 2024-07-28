import 'dart:convert';
import 'package:http/http.dart' as http;

class Apicategories {
  final String baseUrl = 'http://www.omdbapi.com/';
  final String apiKey = '770267f9';

  Future<List<Movie>> fetchLatestMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl?s=latest&apikey=$apiKey'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['Response'] == 'True') {
        List searchResults = jsonResponse['Search'];
        List<Movie> detailedMovies = [];

        for (var movie in searchResults) {
          final movieDetailsResponse = await http.get(
            Uri.parse('$baseUrl?i=${movie['imdbID']}&apikey=$apiKey'),
          );
          if (movieDetailsResponse.statusCode == 200) {
            detailedMovies.add(Movie.fromJson(json.decode(movieDetailsResponse.body)));
          }
        }
        return detailedMovies;
      } else {
        throw Exception('No movies found');
      }
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> fetchMovies(String category) async {
    final response = await http.get(
      Uri.parse('$baseUrl?s=$category&apikey=$apiKey'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['Response'] == 'True') {
        List searchResults = jsonResponse['Search'];
        List<Movie> detailedMovies = [];

        for (var movie in searchResults) {
          final movieDetailsResponse = await http.get(
            Uri.parse('$baseUrl?i=${movie['imdbID']}&apikey=$apiKey'),
          );
          if (movieDetailsResponse.statusCode == 200) {
            detailedMovies.add(Movie.fromJson(json.decode(movieDetailsResponse.body)));
          }
        }
        return detailedMovies;
      } else {
        throw Exception('No movies found');
      }
    } else {
      throw Exception('Failed to load movies');
    }
  }
}

class Movie {
  final String id;
  final String title;
  final String poster;
  final String year;
  final String rating;
  final String genres;
  final String plot;

  Movie({
    required this.id,
    required this.title,
    required this.poster,
    required this.year,
    required this.rating,
    required this.genres,
    required this.plot,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['imdbID'] ?? '',
      title: json['Title'] ?? '',
      poster: json['Poster'] ?? '',
      year: json['Year'] ?? '',
      rating: json['imdbRating'] ?? '0',
      genres: json['Genre'] ?? 'Unknown',
      plot: json['Plot'] ?? 'No plot available',
    );
  }
}
