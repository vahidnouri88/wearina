import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PageController cont;
  @override
  void initState() {
    super.initState();
    cont = PageController(viewportFraction: .4);
  }

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
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 18),
                  width: we * .25,
                  height: he * .25,
                  decoration: BoxDecoration(
                      //color: Colors.white,
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 2.5, color: Colors.blueGrey[800]),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0XFF7c9998).withOpacity(.6),
                          blurRadius: 15,
                          spreadRadius: 1,
                          offset: Offset(2, 2),
                        )
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("URL"),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: we * .2,
                  padding: EdgeInsets.symmetric(
                    horizontal: we * .025,
                    vertical: we * .015,
                  ),
                  decoration: BoxDecoration(
                      color: Color(0XFF7c9998),
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(top: he * .35),
                  child: Text(
                    "Richel",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: we,
                  height: he * .52,
                  color: Colors.blue,
                  child: PageView.builder(itemBuilder: (c, i) {
                    return Container(
                      width: we * .3,
                      height: he * .3,
                      color: i.isEven ? Colors.red : Colors.yellow,
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
