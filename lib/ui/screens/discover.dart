import 'package:flutter/material.dart';
import 'package:moviesearchapp/ui/specialwidgets/customchip.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.amber , size: 40),
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
            child: Customchip(),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 32,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(20),
                  height: deviceHeight/3,
                  width: deviceWidth/1,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey,

                  ),
                  child: const Text(
                    "ahmet",
                    style: TextStyle(color: Colors.white),
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
