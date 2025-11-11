import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/features/bookmarks/presentation/bookmarks_screen.dart';
import 'package:blog_app/features/home/presentation/home_screen.dart';
import 'package:blog_app/features/profile/presentation/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      bottomNavigationBar: SizedBox(
        height: 90.h,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          child: BottomNavigationBar(
            backgroundColor: Color(0xff1C1F26),
            unselectedItemColor: Colors.white60,
            currentIndex: currentindex,
            selectedItemColor: buttonColor,
            onTap: (value) {
              setState(() {
                currentindex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.house),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bookmark),
                label: "Bookmarks",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: "profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
