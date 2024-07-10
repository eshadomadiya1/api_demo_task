import 'package:api_demo_task/music_player/presentation/music_library_screen.dart';
import 'package:api_demo_task/music_player/presentation/music_player_screen.dart';
import 'package:api_demo_task/music_player/presentation/music_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MusicHomeScreen extends StatefulWidget {
  @override
  _MusicHomeScreenState createState() => _MusicHomeScreenState();
}

class _MusicHomeScreenState extends State<MusicHomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    MusicPlayerScreen(),
    MusicSearchScreen(),
    MusicLibraryScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_currentIndex],
      // bottomNavigationBar: BottomNavigationBar(
      // selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.grey,
      //   backgroundColor: Colors.black,
      //   onTap: _onTabTapped,
      //   currentIndex: _currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.library_music_rounded),
      //       label: 'your Library',
      //     ),
      //   ],
      // ),


      bottomNavigationBar: CurvedNavigationBar(
        onTap: _onTabTapped,
        backgroundColor: Colors.black87,
        buttonBackgroundColor: Colors.white,
        // color: const Color.fromARGB(255, 255, 240, 219),
        color: Colors.white,
        height: 65,
        items: const <Widget>[

          Icon(
            Icons.home,
            size: 35,
            color: Colors.red,
          ),
          Icon(
            Icons.search,
            size: 35,
            color: Colors.deepPurpleAccent,
          ),
          Icon(
            Icons.library_music_rounded,
            size: 35,
            color: Colors.green,
          ),
        ],
        // onTap: (index) {
        //   _pageController.animateToPage(index,
        //       duration: const Duration(milliseconds: 300),
        //       curve: Curves.easeOut);
        // },
      ),
    );
  }
}
