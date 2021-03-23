import 'package:crop_diseases/dashboard/dashboard.dart';
import 'package:crop_diseases/provider/google_sign_in.dart';
import 'package:crop_diseases/widget/background_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
          backgroundColor: Colors.grey[300],
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Welcome',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Playfair Display',
                      fontSize: 36)),
              Row(
                children: [
                  IconButton(icon: Icon(Icons.person), onPressed: () {})
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Container(
                child: Image(
                  image: AssetImage(
                    'assets/icons/L1.png',
                  ),
                  fit: BoxFit.cover,
                ),
                height: 100,
                width: 100,
              ),
              onPressed: () {
                //showSearch(context: context, delegate: DataSearch(listWords));
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              
            ),
            Spacer(),
            SizedBox(height: 12),
               Center(
              child: Image.asset('assets/icons/L1.png', height: 200, width: 300,),
              ),
           

         


            Text('--------------------------------    With    ----------------------------------'),
            GoogleSignupButtonWidget(),
            Spacer(),
          ],
        ),
      );
}

class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlineButton.icon(
          label: Text(
            ' Google SignUp',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
         // highlightedBorderColor: Colors.black,
          //borderSide: BorderSide(color: Colors.black),
          textColor: Colors.black,
          icon: FaIcon(
            FontAwesomeIcons.google,
            color: Colors.black,
          ),
          onPressed: () {
           
             final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login(); 
          },
        ),
      );
}
