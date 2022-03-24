import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mywords/models/page_names.dart';
import 'package:mywords/pages/lists_page.dart';
import 'package:mywords/pages/mywords_page.dart';
import 'package:mywords/pages/settings_page.dart';
import 'package:mywords/pages/study_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int _selectedIndex = 0;
  String titleName = PageNames().listNames[_selectedIndex];
  PageController? _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(titleName),
      ),
      body: PageView(

        onPageChanged: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
        controller: _pageController,
        children: [
          // Lists page
          ListsPage(),

          // MyWords page
          MyWordsPage(),

          // Study Page
          StudyPage(),

          // Settings Page
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,

        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet,color: Colors.grey.shade700,),label: 'Lists'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bubble_left_bubble_right,color: Colors.grey.shade700,),label: 'Words'),
          BottomNavigationBarItem(
              icon: Icon(Icons.psychology_outlined,color: Colors.grey.shade700,),label: 'Study'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings,color: Colors.grey.shade700,),label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.teal,
        //selectedItemColor: Colors.teal,
        onTap: (int index){
          setState(() {
            titleName = PageNames().listNames[index];
            _selectedIndex = index;
            _pageController?.animateToPage(index,duration: Duration(microseconds: 10), curve: Curves.easeInCirc);
          });
        },
      ),
    );
  }
}
