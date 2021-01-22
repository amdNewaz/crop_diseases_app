import 'package:crop_diseases/widget/background_painter.dart';
import 'package:crop_diseases/widget/google_signup_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          buildSignUp(),
        ],
      );

  Widget buildSignUp() => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              child: Container(
                color: CupertinoColors.activeOrange,
                height: 4.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
          title: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,

                        // fontFamily:
                      ),
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Icon(Icons.account_tree_sharp),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Card(
                child: Container(),
              ),
              Spacer(),

              /* Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: 175,
                child: Text(
                  'Welcome Back To MyApp==',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            */
              Spacer(),
              GoogleSignupButtonWidget(),
              SizedBox(height: 12),
              Text(
                'Login to continue',
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
            ],
          ),
        ),
      );
}
