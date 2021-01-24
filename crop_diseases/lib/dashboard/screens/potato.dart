import 'package:carousel_pro/carousel_pro.dart';
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(
                'POTATO',
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
              Text('Aster yellows'),
              Text(
                  '''Aster leafhopper (Macrosteles fascifrons) and other leafhoppers,
              and the phytoplasma can be carried in infected tubers. Over 300 kinds of plants, 
              including a wide variety of vegetables. Broccoli, cabbage, carrot, onion, potato, 
              pumpkin, radish, shallot, spinach, squash, tomato, and more.'''),
            ],
          ),
        ),
      ),
    );
  }
}