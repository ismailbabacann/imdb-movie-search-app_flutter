import 'package:flutter/material.dart';
import 'package:moviesearchapp/ui/screens/moviedetailspage.dart';
import 'package:moviesearchapp/ui/specialwidgets/customchip.dart';
import 'package:moviesearchapp/ui/specialwidgets/movieinfocard.dart';

class Searchpage extends StatefulWidget {

  final List movies;
  const Searchpage({super.key, required this.movies});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    print("Arama terimi: ${_searchController.text}");
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.amber, size: 40),
        title: RichText(
          text: TextSpan(
            text: "Search",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Metin sola hizalama
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: deviceWidth,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF2C2C2C), // Koyu gri arka plan
                  borderRadius: BorderRadius.circular(7), // Yuvarlak köşeler
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    // Beyaz arama ikonu
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white54),
                    // Gri renkte ipucu metni
                    border: InputBorder.none,
                    // Kenar çizgisi yok
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15), // İçerik dolgu alanı
                  ),
                  style: TextStyle(
                      color: Colors.white, fontSize: 18), // Beyaz yazı rengi
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
            //  child: Customchip(),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              // Sol tarafa hizalama için padding ekle
              child: Text(
                "Search Result (3)",
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: widget.movies.map((movie) {
                  return Column(
                    children: [
                      Movieinfocard(
                        title: movie['Title'],
                        rating: movie['imdbRating'],
                        genres: movie['Genre'],
                        plot: movie['Plot'],
                        posterUrl: movie['Poster'],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Moviedetailspage(
                                id: movie['id'],
                                title: movie['Title'],
                                rating: movie['imdbRating'],
                                genres: movie['Genre'],
                                plot: movie['Plot'],
                                posterUrl: movie['Poster'],
                              ),
                            ),
                          );
                        },

                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
