import 'package:flutter/material.dart';

class PotatoScreen extends StatefulWidget {
  PotatoScreen({Key key}) : super(key: key);

  @override
  _PotatoScreenState createState() => _PotatoScreenState();
}

class _PotatoScreenState extends State<PotatoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
         child: Column(
           children: [
             Text('Potato')
           ],

         ),
      ),
    );
  }
}