import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wearina/Models/ItemDetails.dart';
import 'package:wearina/Models/onBoard.dart';
import 'package:wearina/Pages/mainScreen/mainscreen.dart';
import 'Pages/About/About.dart';
import 'Pages/checkout/Checkout.dart';
import 'Pages/Profile/Profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main_screen(),
    );
  }
}

class Main_screen extends StatefulWidget {
  @override
  _Main_screenState createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.of(context)
        .pushReplacement(
            MaterialPageRoute(builder: (context) => mainScreen())));
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          width: we,
          height: he,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: he * .2),
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      "https://cdn8.dissolve.com/p/D2115_232_002/D2115_232_002_1200.jpg"),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text("Weraina"),
              ),
            ],
          )),
    );
  }
}
