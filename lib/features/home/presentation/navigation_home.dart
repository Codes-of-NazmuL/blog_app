import 'package:blog_app/features/bookmarks/presentation/bookmarks_screen.dart';
import 'package:blog_app/features/home/presentation/home_screen.dart';
import 'package:blog_app/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';

class NavigationHome extends StatefulWidget {
  const NavigationHome({super.key});

  @override
  State<NavigationHome> createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    List<Widget> ScreenList = [
      HomeScreen(),
      BookmarksScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      body: ScreenList[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff1C1F26),
        unselectedItemColor: Colors.white60,
        currentIndex: currentindex,
        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outlined),
            label: "Bookmarks",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.man_2), label: "profile"),
        ],
      ),
    );
  }
}
