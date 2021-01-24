import 'dart:io';
import 'dart:ui';

import 'package:crop_diseases/dashboard/screens/camera.dart';
import 'package:crop_diseases/dashboard/screens/potato.dart';
import 'package:crop_diseases/dashboard/screens/tomato.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit from App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => exit(0),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMaterialApp(),
    );
  }

  WillPopScope _buildMaterialApp() {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: MainBottomDashboard(),
      ),
    );
  }
}

class MainBottomDashboard extends StatefulWidget {
  MainBottomDashboard({Key key}) : super(key: key);

  @override
  _MainBottomDashboardState createState() => _MainBottomDashboardState();
}

class _MainBottomDashboardState extends State<MainBottomDashboard> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    PotatoScreen(),
    CameraScreen(),
    TomatoScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[300],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Crop',
            style: TextStyle(
              color: Colors.black87,
            ),
            ),
            Row(
              children: [IconButton(icon: Icon(Icons.face,
              color: Colors.black87,
              )
              , onPressed: () {})],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search,
            color: Colors.black87),
            onPressed: () {
              //showSearch(context: context, delegate: DataSearch(listWords));
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: onTabTapped,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'POTATO',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment_sharp),
              label: 'TOMATO',
            ),
          ],
        ),
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(
      () {
        this._pageIndex = page;
      },
    );
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}
