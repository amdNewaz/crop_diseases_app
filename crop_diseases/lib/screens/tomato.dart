import 'package:flutter/material.dart';

class TomatoScreen extends StatefulWidget {
  TomatoScreen({Key key}) : super(key: key);

  @override
  _TomatoScreenState createState() => _TomatoScreenState();
}

class _TomatoScreenState extends State<TomatoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
          body: Container(
         child: Column(
           children: [
             Text('Tomato'),
           ],
           
         ),
      ),
    );
  }
}