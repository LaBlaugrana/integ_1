// import 'package:Hush/Journal1/main.dart';
import 'package:Hush/Track/Track_homepage.dart';
import 'package:Hush/journal/screen/home_screen.dart';
import 'package:Hush/profile.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'Journal1/note1.dart';


class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  final screens = [
    // if you want to add your acutal pages you can add as follows:
    Homepage(),
    TrackPage(),
    NoteListScreen(),
    ProfileScreen(),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      // screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF233C67),
        unselectedItemColor: Colors.black26,
        showUnselectedLabels: false,
        iconSize: 29,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            backgroundColor: Color(0xFF233C67),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airline_seat_individual_suite),
            label: 'Track',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Journal',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blueGrey,
          ),
        ],

      ),
    );
  }
}
