import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/dashboard_page1.dart';
import 'package:flutter_theme/dashboard_page2.dart';
import 'package:flutter_theme/dashboard_page3.dart';
import 'package:flutter_theme/dashboard_page4.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {

  int _currentIndex = 0;

  final List<Widget> _children = [
    DashboardPage1(),
    DashboardPage2(),
    DashboardPage3(),
    DashboardPage4()
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'title',
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('Menu button');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.dashboard),
            title: new Text('Colors')
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.format_list_bulleted),
            title: new Text('Text')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.hdr_strong),
              title: Text('Wigets')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              title: Text('Other')
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
