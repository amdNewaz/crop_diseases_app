import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';





class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     title: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text('Crop'),
    //         Row(
    //           children: [
    //             IconButton(icon: Icon(Icons.person), onPressed: () {})
    //           ],
    //         ),
    //       ],
    //     ),
    //     actions: [
    //       IconButton(
    //           icon: Icon(Icons.search),
    //           onPressed: () {
    //             //showSearch(context: context, delegate: DataSearch(listWords));
    //           })
    //     ],
    //   ),
    //   body: Container(
    //     child: Column(
          
    //     ),
    //   ),
     
    // );
    return Scaffold(
      appBar: AppBar(title: Text('Hello ConvexAppBar')),
      body: Center(
          child: FlatButton(
        child: Text('Click to show usage'),
        onPressed: () => Navigator.of(context).pushNamed('/'),
      )),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.list),
          TabItem(icon: Icons.photo_camera_outlined),
          
          TabItem(icon: Icons.assessment),
        ],
        initialActiveIndex: 1 /*optional*/,
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}
