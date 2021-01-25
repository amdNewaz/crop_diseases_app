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
          child: SizedBox(
            height: 450,
            width: 390,
            child: Card(
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              shadowColor: Colors.grey,
              child: Column(
                children: [
                  Text(
                    'TOMATO',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
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
                        Image.asset('assets/images/image3.png'),
                      ],
                    ),
                  ),
                  Text(
                    'Plants infected with powdery mildew look as if they have been dusted with flour. Powdery mildew usually starts off as circular, powdery white spots, which can appear on leaves, stems, and sometimes fruit. Powdery mildew usually covers the upper part of the leaves, but may grow on the undersides as well.',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
