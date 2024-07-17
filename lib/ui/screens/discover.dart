import 'package:flutter/material.dart';
import 'package:moviesearchapp/ui/specialwidgets/customchip.dart';
import 'package:moviesearchapp/data/apiconnection.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  late Apiconnection apiService;
  List<Movie> movies = [];
  String selectedCategory = 'ALL';

  @override
  void initState() {
    super.initState();
    apiService = Apiconnection();
    _fetchMovies(selectedCategory);
  }

  void _fetchMovies(String category) async {
    try {
      var fetchedMovies = await apiService.fetchMovies(category == 'ALL' ? 'movie' : category.toLowerCase());
      setState(() {
        movies = fetchedMovies;
      });
    } catch (e) {
      setState(() {
        movies = [];
      });
    }
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
      _fetchMovies(selectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.amber, size: 40),
        backgroundColor: Colors.black,
        title: RichText(
          text: const TextSpan(
            text: "Discover",
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomChip(
              categories: ['ALL', 'ACTION', 'DRAMA', 'COMEDY'],
              onCategorySelected: _onCategorySelected,
              selectedCategory: selectedCategory,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(20),
                  height: deviceHeight / 3,
                  width: deviceWidth / 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        movies[index].poster,
                        height: 150,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        movies[index].title,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        movies[index].year,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
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
