import 'package:flutter/material.dart';

class Customchip extends StatelessWidget {
  const Customchip({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Chip(label: Text("ALL" , style: TextStyle(color: Colors.white),)
            , backgroundColor: Colors.black87, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), side: BorderSide(color: Colors.black),),
          SizedBox(width: 10,),
          Chip(label: Text("ANIMATION" , style: TextStyle(color: Colors.white),)
            , backgroundColor: Colors.black87, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), side: BorderSide(color: Colors.black),),
          SizedBox(width: 10,),
          Chip(label: Text("ACTION" , style: TextStyle(color: Colors.white),)
            , backgroundColor: Colors.black87, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), side: BorderSide(color: Colors.black),),
          SizedBox(width: 10,),
          Chip(label: Text("COMEDY" , style: TextStyle(color: Colors.white),)
            , backgroundColor: Colors.black87, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), side: BorderSide(color: Colors.black),),
          SizedBox(width: 10,),
          Chip(label: Text("DRAMA" , style: TextStyle(color: Colors.white),)
            , backgroundColor: Colors.black87, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), side: BorderSide(color: Colors.black),),
          SizedBox(width: 10,),
          ],
      ),
    );
  }
}
