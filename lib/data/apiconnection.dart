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
