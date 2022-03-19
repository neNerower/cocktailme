import 'package:cocktailme/models/cocktail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    //TEST DATA
    List<CocktailModel> cocktailModels = [];
    for(int i = 0; i<10; ++i){
      cocktailModels.add(CocktailModel(1, "Cuba", "Yes", "Shot", "Instructions", "https://picsum.photos/400", ["vodka, lime, sprite, CUM, ${i.toString()}"]));
    }

    _pages = [MinibarPage(), SearchPage(cocktailModels),  RandomPage(cocktailModels)];
    _currentIndex = 1;
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTaped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(_currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SvgPicture.asset("lib/assets/images/HomeScreen.svg", width: MediaQuery.of(context).size.width,),
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
        ],
      ),
       bottomNavigationBar:

      BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            // Minibar
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            // Search
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            // Random
            icon: Icon(Icons.autorenew_rounded),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTaped,
      ),
    );
  }
}
