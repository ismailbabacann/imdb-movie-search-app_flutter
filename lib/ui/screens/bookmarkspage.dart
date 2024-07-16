import 'package:flutter/material.dart';
import 'package:moviesearchapp/ui/specialwidgets/movieinfocard.dart';

class Bookmarkspage extends StatefulWidget {
  const Bookmarkspage({super.key});

  @override
  State<Bookmarkspage> createState() => _BookmarkspageState();
}

class _BookmarkspageState extends State<Bookmarkspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back , ),
        iconTheme: IconThemeData(color: Colors.amber , size: 40),
        backgroundColor: Colors.black,
        title: RichText(
          text: const TextSpan(
            text: "Bookmarks",
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
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Movieinfocard(),
              SizedBox(height: 20,),
              Movieinfocard(),
              SizedBox(height: 20,),
              Movieinfocard(),
              SizedBox(height: 20,),
              Movieinfocard(),
            ],
          ),
        ),
      ),
    );
  }
}
