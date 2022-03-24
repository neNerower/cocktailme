import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    _pages = [MinibarPage(), SearchPage(),  RandomPage()];
    _currentIndex = 1;
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    Hive.close();
    super.dispose();
  }

  void _onItemTaped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
       SnakeNavigationBar.color(
         backgroundColor: Colors.black,
         unselectedItemColor: Colors.blueGrey,
         height: MediaQuery.of(context).size.height/16,
         snakeShape: SnakeShape.indicator,
         snakeViewColor: Color.fromRGBO(236, 117, 255, 1),
         selectedItemColor: Color.fromRGBO(63, 207, 253, 1),
         currentIndex: _currentIndex,
         onTap: (index){
           _onItemTaped(index);
         },
         items: [
           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Minibar'),
           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
           BottomNavigationBarItem(icon: Icon(Icons.autorenew_rounded), label: 'Random'),

         ],
       ),

    );
  }

}
