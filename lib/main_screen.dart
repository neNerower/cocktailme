import 'package:flutter/material.dart';

import 'pages/minibar_page.dart';
import 'pages/random_page.dart';
import 'pages/search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;

  late List<Widget> _pages;
  late PageController _pageController;


  @override
  void initState() {
    super.initState();

    _pages = [
      MinibarPage(),
      SearchPage(),
      RandomPage()
    ];

    _currentIndex = 1;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  void _onItemTaped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cocktail Me"),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            // Minibar
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            // Search
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            // Random
            icon: Icon(Icons.autorenew_rounded),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTaped,
      ),
    );
  }
}
