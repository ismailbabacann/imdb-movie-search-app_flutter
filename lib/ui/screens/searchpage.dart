import 'package:flutter/material.dart';
import 'package:moviesearchapp/data/apiconnection.dart';
import 'package:moviesearchapp/ui/screens/moviedetailspage.dart';
import 'package:moviesearchapp/ui/specialwidgets/customchip.dart';
import 'package:moviesearchapp/ui/specialwidgets/movieinfocard.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Apicategories apiService;
  List<Movie> searchResults = [];
  TextEditingController searchController = TextEditingController();
  String selectedCategory = 'ALL';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    apiService = Apicategories();
  }

  void _searchMovies(String query) async {
    if (query.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      try {
        var results = await apiService.fetchMovies(query);
        setState(() {
          searchResults = results;
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          searchResults = [];
          isLoading = false;
        });
      }
    } else {
      setState(() {
        searchResults = [];
      });
    }
    searchController.clear();
    FocusScope.of(context).unfocus();
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
      _searchMovies(category == 'ALL' ? 'movie' : category.toLowerCase());
    });
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[700]!,
      highlightColor: Colors.grey[500]!,
      child: Column(
        children: List.generate(5, (index) => _buildShimmerItem()),
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 150,
            color: Colors.grey,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: 20,
                color: Colors.grey,
              ),
              const SizedBox(height: 10),
              Container(
                width: 150,
                height: 20,
                color: Colors.grey,
              ),
              const SizedBox(height: 10),
              Container(
                width: 180,
                height: 20,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
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
                    categories: [
                      'ALL',
                      'ACTION',
                      'DRAMA',
                      'COMEDY',
                      'ADVENTURE',
                      'ANIMATION',
                      'HISTORY',
                      'HORROR',
                      'WESTERN',
                      'ROMANCE'
                    ],
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
                  'Search results (${searchResults.length})',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: isLoading
                ? _buildShimmer()
                : ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                var movie = searchResults[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Movieinfocard(
                    title: movie.title,
                    rating: movie.rating,
                    genres: movie.genres,
                    plot: movie.plot,
                    posterUrl: movie.poster,
                    runtime: movie.runtime,
                    awards: movie.awards,
                    actors: movie.actors,
                    director: movie.director,
                    boxOffice: movie.boxOffice,
                    imdbVotes: movie.imdbVotes,
                    country: movie.country,
                    released: movie.released,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Moviedetailspage(
                            id: movie.id,
                            title: movie.title,
                            rating: movie.rating,
                            genres: movie.genres,
                            plot: movie.plot,
                            posterUrl: movie.poster,
                            runtime: movie.runtime,
                            awards: movie.awards,
                            actors: movie.actors,
                            director: movie.director,
                            boxOffice: movie.boxOffice,
                            imdbVotes: movie.imdbVotes,
                            released: movie.released,
                            country: movie.country,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
