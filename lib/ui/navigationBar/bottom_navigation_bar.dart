import 'package:flutter/material.dart';
import 'package:flutter_apollo/ui/navigationBar/pages.dart';

class BottomNavigationBarHome extends StatefulWidget {
  @override
  _BottomNavigationBarHomeState createState() => _BottomNavigationBarHomeState();
}

class _BottomNavigationBarHomeState extends State<BottomNavigationBarHome> {
  int _pageIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [HomePage(), MessagePage(), CartPage(), UserPage()],
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text("消息")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text("购物车")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("个人中心"))
        ],
        onTap: (index) {
//          _pageController.jumpToPage(index);
          _pageController.animateToPage(index, duration: Duration(milliseconds: 250), curve: Curves.linearToEaseOut);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
