import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: deviceWidth/(1.18),
                  height: deviceHeight/4,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                  // Buraya image ekleyebilirsiniz
                ),
                SizedBox(height: 8),
                Text(
                  "Hitman's Wife's Bodyguard",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '3.5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.star, color: Colors.amber, size: 24),
                    Icon(Icons.star, color: Colors.amber, size: 24),
                    Icon(Icons.star, color: Colors.amber, size: 24),
                    Icon(Icons.star_half, color: Colors.amber, size: 24),
                    Icon(Icons.star_border, color: Colors.amber, size: 24),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
