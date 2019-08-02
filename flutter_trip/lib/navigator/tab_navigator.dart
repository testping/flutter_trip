import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/travel_page.dart';
import 'package:flutter_trip/pages/my_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  var _currentIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
            HomePage(),
            SearchPage(),
            TravelPage(),
            MyPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
          },
          items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color: _defaultColor,),
          activeIcon: Icon(Icons.home,color: _activeColor),
          title: Text('首页',style: TextStyle(
            color: _currentIndex!=0?_defaultColor:_activeColor
          ),)
        ),BottomNavigationBarItem(
            icon: Icon(Icons.gavel,color: _defaultColor,),
            activeIcon: Icon(Icons.gavel,color: _activeColor),
            title: Text('还款',style: TextStyle(
                color: _currentIndex!=1?_defaultColor:_activeColor
            ),)
        ),BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up,color: _defaultColor,),
            activeIcon: Icon(Icons.thumb_up,color: _activeColor),
            title: Text('推荐',style: TextStyle(
                color: _currentIndex!=2?_defaultColor:_activeColor
            ),)
        ),BottomNavigationBarItem(
            icon: Icon(Icons.person,color: _defaultColor,),
            activeIcon: Icon(Icons.person,color: _activeColor),
            title: Text('我的',style: TextStyle(
                color: _currentIndex!=3?_defaultColor:_activeColor
            ),)
        )
      ]),
    );
  }
}
