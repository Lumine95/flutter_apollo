import 'package:flutter/material.dart';
import 'package:flutter_apollo/navigator/pages/homePage.dart';
import 'package:flutter_apollo/navigator/pages/minePage.dart';
import 'package:flutter_apollo/navigator/pages/searchPage.dart';
import 'package:flutter_apollo/navigator/pages/travelPage.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final _defaultColor = Colors.grey;
    final _activeColor = Colors.black;
    final _controller = PageController(initialPage: 0);
    return Scaffold(
        body: PageView(
          controller: _controller,
          children: <Widget>[HomePage(), SearchPage(), TravelPage(), MinePage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            _currentIndex = index;
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _defaultColor),
                activeIcon: Icon(Icons.home, color: _activeColor),
                title: Text(
                  '首页',
                  style: TextStyle(
                    color: _currentIndex == 1 ? _activeColor : _defaultColor,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: _defaultColor),
                activeIcon: Icon(Icons.search, color: _activeColor),
                title: Text(
                  '搜索',
                  style: TextStyle(
                    color: _currentIndex == 2 ? _activeColor : _defaultColor,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on, color: _defaultColor),
                activeIcon: Icon(Icons.location_on, color: _activeColor),
                title: Text(
                  '旅拍',
                  style: TextStyle(
                    color: _currentIndex == 3 ? _activeColor : _defaultColor,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, color: _defaultColor),
                activeIcon: Icon(Icons.account_circle, color: _activeColor),
                title: Text(
                  '我的',
                  style: TextStyle(
                    color: _currentIndex == 4 ? _activeColor : _defaultColor,
                  ),
                ))
          ],
        ));
  }
}
