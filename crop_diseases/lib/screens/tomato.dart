import 'package:carousel_pro/carousel_pro.dart';
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(
                'TOMATO',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Carousel(
                  images: [
                    Image.asset('assets/images/image1.jpg'),
                    Image.asset('assets/images/image2.jpg'),
                    Image.asset('assets/images/image3.jpg'),
                  ],
                ),
              ),
              Text('Tomato Tomato Tomato'),
            ],
          ),
        ),
      ),
    );
  }
}
