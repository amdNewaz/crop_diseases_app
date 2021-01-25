import 'dart:io';
import 'package:crop_diseases/model/user_details.dart';
import 'package:flutter/material.dart';
import 'package:crop_diseases/dashboard/maindashboard.dart';

class DashBoard extends StatefulWidget {
  final UserDetails detailsUser;
  DashBoard({Key key, @required this.detailsUser}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState(detailsUser);
}

class _DashBoardState extends State<DashBoard> {
  final UserDetails detailsUser;
  _DashBoardState(this.detailsUser);

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit from App'),
            actions: <Widget>[
              FlatButton(
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
        body: MainBottomDashboard(details: detailsUser),
      ),
    );
  }
}
