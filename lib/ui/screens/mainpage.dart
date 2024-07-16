import 'package:flutter/material.dart';
import 'package:moviesearchapp/ui/specialwidgets/movieinfocard.dart';
import 'package:moviesearchapp/ui/specialwidgets/ratingcard.dart';

class Mainpage extends StatefulWidget {
  Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,60,0,0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //TOP FİVE YAZISI
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: const TextSpan(
                    text: "Top Five",
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
              SizedBox(height: 30,),
              //RATING CARD
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                children: [
                  RatingCard(),
                  SizedBox(width: 20,),
                  RatingCard(),
                ],
                ),
              ),
              SizedBox(height: 30,),
              //LATEST SATIRI
              Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      text: "Latest",
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
                    selectionColor: Colors.white,
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  Text("SEE MORE" , style: TextStyle(color: Colors.amber , fontSize: 16)),
               SizedBox(width: 20,)
                ],
              ),
              SizedBox(height: 30,),
              Movieinfocard(),
              SizedBox(height: 30,),
              Movieinfocard(),
            ],
          ),
        ),
      ),
    );
  }
}
