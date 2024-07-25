import 'package:flutter/material.dart';
import 'package:moviesearchapp/data/apiconnection.dart';
import 'package:moviesearchapp/ui/specialwidgets/customchip.dart';
import 'package:moviesearchapp/ui/specialwidgets/movieinfocard.dart';
import 'package:moviesearchapp/ui/specialwidgets/movieinfocard.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Apicategories apiService;
  List<Movie> searchResults = [];
  TextEditingController searchController = TextEditingController();
  String selectedCategory = 'ALL';

  @override
  void initState() {
    super.initState();
    apiService = Apicategories();
  }

  void _searchMovies(String query) async {
    if (query.isNotEmpty) {
      try {
        var results = await apiService.fetchMovies(query);
        setState(() {
          searchResults = results;
        });
      } catch (e) {
        setState(() {
          searchResults = [];
        });
      }
    } else {
      setState(() {
        searchResults = [];
      });
    }
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
      _searchMovies(category == 'ALL' ? 'movie' : category.toLowerCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Icon(Icons.search_sharp),
        ),
        iconTheme: IconThemeData(color: Colors.amber, size: 40),
        backgroundColor: Colors.black,
        title: RichText(
          text: const TextSpan(
            text: "Search",
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onSubmitted: (query) => _searchMovies(query),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[850],
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomChip(
                    categories: ['ALL', 'ACTION', 'DRAMA', 'COMEDY', 'ADVENTURE', 'ANIMATION', 'HISTORY', 'HORROR', 'WESTERN', 'ROMANCE'],
                    onCategorySelected: _onCategorySelected,
                    selectedCategory: selectedCategory,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Search results '
                  //${searchResults.length}
                  ,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (BuildContext context, int index) {
                  var movie = searchResults[index];
                  return Movieinfocard(
                    title: movie.title,
                    rating: "3.5",
                    // Placeholder for rating, replace with actual rating if available
                    genres: "Action, Comedy, Crime",
                    // Placeholder for genres, replace with actual genres if available// Placeholder for plot, replace with actual plot if available
                    plot: "",
                    posterUrl: movie.poster,
                    onTap: () {
                      // Define what happens when a movie card is tapped
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
