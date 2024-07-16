import 'package:flutter/material.dart';
import 'package:moviesearchapp/ui/screens/mainpage.dart';
import 'package:moviesearchapp/ui/screens/bookmarkspage.dart';
import 'package:moviesearchapp/ui/screens/searchpage.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Mainpage(),
      Searchpage(),
      Bookmarkspage(),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: selectedIndex == 0 ? Colors.amber : Colors.white,
              size: selectedIndex == 0 ? 35 : 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: selectedIndex == 1 ? Colors.amber : Colors.white,
              size: selectedIndex == 1 ? 35 : 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
              color: selectedIndex == 2 ? Colors.amber : Colors.white,
              size: selectedIndex == 2 ? 35 : 30,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
