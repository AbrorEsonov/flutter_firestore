import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mywords/models/page_names.dart';
import 'package:mywords/pages/list_of_words/lists_page.dart';
import 'package:mywords/pages/my_words_page.dart';
import 'package:mywords/pages/settings_page.dart';
import 'package:mywords/pages/study_page.dart';
import 'package:mywords/services/word_service.dart';
import 'package:provider/provider.dart';

import '../services/provider/words_provider.dart';

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
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        controller: _pageController,
        children: [
          // Lists page
          ChangeNotifierProvider(
            create: (context) => WordModelsProvider(),
            child: ListsPage(),
          ),

          // MyWords page
          MyWordsPage(),

          // Study Page
          StudyPage(),

          SettingsPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // backgroundColor: Colors.teal,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.list_bullet,
                color: _selectedIndex == 0 ? Colors.teal : Colors.grey.shade700,
              ),
              label: 'Lists'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.bubble_left_bubble_right,
                color: _selectedIndex == 1 ? Colors.teal : Colors.grey.shade700,
              ),
              label: 'Words'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.psychology_outlined,
                color: _selectedIndex == 2 ? Colors.teal : Colors.grey.shade700,
              ),
              label: 'Study'),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.settings,
                color: _selectedIndex == 3 ? Colors.teal : Colors.grey.shade700,
              ),
              label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        // fixedColor: Colors.teal,
        selectedItemColor: Colors.teal,
        onTap: (int index) {
          setState(() {
            titleName = PageNames().listNames[index];
            _selectedIndex = index;
            _pageController?.animateToPage(index,
                duration: Duration(microseconds: 10), curve: Curves.easeInCirc);
          });
        },
      ),
    );
  }
}
