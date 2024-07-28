import 'package:flutter/material.dart';
import 'package:moviesearchapp/data/apiconnection.dart';
import 'package:moviesearchapp/ui/screens/moviedetailspage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Movie> _searchResults = [];
  bool _isLoading = false;
  TextEditingController _searchController = TextEditingController();

  void _searchMovies() async {
    setState(() {
      _isLoading = true;
    });

    Apicategories apiCategories = Apicategories();
    List<Movie> results = await apiCategories.fetchMovies(_searchController.text);

    setState(() {
      _searchResults = results;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search movies...',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: _searchMovies,
            ),
          ),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          Movie movie = _searchResults[index];
          return ListTile(
            leading: Image.network(movie.poster),
            title: Text(movie.title),
            subtitle: Text(movie.year),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Moviedetailspage(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
