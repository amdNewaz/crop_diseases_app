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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Icon(Icons.ac_unit),
            ],
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
