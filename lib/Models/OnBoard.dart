import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:wearina/Pages/mainScreen/mainscreen.dart';
import 'package:wearina/main.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SafeArea(
        child: Container(
          width: we,
          height: he,
          color: Colors.purple,
          child: IntroViewsFlutter(
            [
              PageViewModel(
                body: Container(
                  height: he,
                  width: we,
                ),
                title: Text("Page1"),
                pageColor: Colors.brown[400],
                mainImage: Icon(
                  Icons.gps_fixed,
                  size: 150,
                  color: Colors.white,
                ),
              ),
              PageViewModel(
                body: Container(
                  height: he,
                  width: we,
                ),
                title: Text("Page1"),
                pageColor: Colors.pink[400],
                mainImage: Icon(
                  Icons.card_giftcard,
                  size: 150,
                  color: Colors.white,
                ),
              ),
              PageViewModel(
                body: Container(
                  height: he,
                  width: we,
                ),
                title: Text("Page1"),
                pageColor: Colors.green[400],
                mainImage: Icon(
                  Icons.android,
                  size: 150,
                  color: Colors.white,
                ),
              ),
            ],
            doneText: Text("فهمیدم"),
            onTapDoneButton: () {
              //Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (c) => mainScreen()));
            },
          ),
        ),
      ),
    );
  }
}
