import 'package:flutter/material.dart';

class Moviedetailspage extends StatefulWidget {
  final String title;
  final String rating;
  final String genres;
  final String plot;
  final String posterUrl;

  const Moviedetailspage({
    super.key,
    required this.title,
    required this.rating,
    required this.genres,
    required this.plot,
    required this.posterUrl,
  });

  @override
  State<Moviedetailspage> createState() => _MoviedetailspageState();
}

class _MoviedetailspageState extends State<Moviedetailspage> {
  var isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white , size: 40),
        actions: [
          IconButton(
            alignment: Alignment.topRight,
            iconSize: 40,
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
              color: isBookmarked ? Colors.amber : Colors.white,
            ),
            onPressed: () {
              setState(() {
                isBookmarked = !isBookmarked;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Image(image: NetworkImage(widget.posterUrl), fit: BoxFit.cover,width: deviceWidth,height: deviceHeight/2,),
          Container(
            height: deviceHeight  ,
            width: deviceWidth,
          ),
          // Black gradient
          Positioned(
            bottom: 0,
            child: Container(
              height: deviceHeight / 2,
              width: deviceWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
          // Content
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              width: deviceWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.rating,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 4),
                      ...List.generate(5, (index) {
                        double starRating = double.tryParse(widget.rating) ?? 0.0;
                        return Icon(
                          index < starRating / 2 ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 24,
                        );
                      }),
                    ],
                  ),
                  Text(
                    widget.genres,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.plot,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Read More",
                    style: TextStyle(color: Colors.amber),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: deviceWidth,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.amber),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "WATCH TRAILER",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
