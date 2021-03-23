
import 'package:crop_diseases/dashboard/profile/user_profile.dart';
import 'package:crop_diseases/dashboard/screens/camera.dart';
import 'package:crop_diseases/dashboard/screens/potato.dart';
import 'package:crop_diseases/dashboard/screens/tomato.dart';
import 'package:crop_diseases/model/user_details.dart';
import 'package:flutter/material.dart';

class MainBottomDashboard extends StatefulWidget {
  final UserDetails details;
  MainBottomDashboard({Key key, @required this.details}) : super(key: key);

  @override
  _MainBottomDashboardState createState() => _MainBottomDashboardState(details);
}

class _MainBottomDashboardState extends State<MainBottomDashboard> {
  final UserDetails details;
  _MainBottomDashboardState(this.details);

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
            Text(
              details.userName,
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            Row(
              children: [
                InkWell(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(details.photoUrl),
                    radius: 15.0,
                  ),
                  onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(detailsUser: details),
                      ),
                    );
                    print('profile');
                  },
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black87),
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
