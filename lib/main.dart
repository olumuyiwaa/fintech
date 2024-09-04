// ignore_for_file: prefer_const_constructors

//import 'package:fintech/pages/addon_page.dart';
import 'pages/home_page.dart';
import 'pages/settings_page.dart';
import 'pages/transaction_log.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Fintech());
}

class Fintech extends StatefulWidget {
  const Fintech({super.key});

  @override
  State<Fintech> createState() => _FintechState();
}

class _FintechState extends State<Fintech> {
  int _pageIndex = 0;
  void _bottomNavTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  final page = [
    HomePage(),
    TransactionLog(),
    //  AddonPage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: page[_pageIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          //get button page index
          onTap: _bottomNavTapped,
          // current page index to display on buttom nav bar
          currentIndex: _pageIndex,
          selectedItemColor: Colors.green,
          //get button page index
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'History',
            ),
            //BottomNavigationBarItem(
            //  icon: Icon(Icons.widgets_rounded),
            //  label: 'Add Ons',
            //),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
