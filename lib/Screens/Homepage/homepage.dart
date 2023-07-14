import 'package:ecogram/Screens/activity_feed.dart';
import 'package:ecogram/Screens/profile.dart';
import 'package:ecogram/Screens/search.dart';
import 'package:ecogram/Screens/timeline.dart';
import 'package:ecogram/Screens/upload.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecogram/constants.dart';

class HomePage extends StatefulWidget {

@override _HomePageState createState() =>
_HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final screens = [
    Timeline(),
    Search(),
    Upload(),
    ActivityFeed(),
    Profile()
  ];

@override
Widget build(BuildContext context) => Scaffold(
  body: screens[index],
  bottomNavigationBar: NavigationBarTheme(
    data: const NavigationBarThemeData(
      indicatorColor: kPrimaryColor,
      labelTextStyle: MaterialStatePropertyAll(TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
    ),
    child: NavigationBar(
      height: 60,
      backgroundColor: kPrimaryLightColor,
      selectedIndex: index,
      onDestinationSelected: (value) => setState(() {
        index = value;
      }),
    destinations: const [
      NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home',),
      NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
      NavigationDestination(icon: Icon(Icons.upload_file_outlined), selectedIcon: Icon(Icons.upload_file), label: 'Upload'),
      NavigationDestination(icon: Icon(Icons.notifications_outlined), selectedIcon: Icon(Icons.notifications), label: 'Notification'),
      NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
    ],
  ),) 
);
}