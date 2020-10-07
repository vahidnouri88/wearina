import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wearina/Models/ItemDetails.dart';
import 'package:wearina/Models/onBoard.dart';
import 'package:wearina/main.dart';
import '../About/About.dart';
import '../checkout/Checkout.dart';
import '../Profile/Profile.dart';

class mainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int active = 0;
  GlobalKey<ScaffoldState> state = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => OnBoard())));
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF7c9998),
      key: state,
      endDrawer: Container(
        width: we * .2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[600],
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: Offset(-1, 0))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            navItem(he, Icons.person_outline, 1),
            navItem(he, Icons.shopping_basket, 2),
            navItem(he, Icons.priority_high, 3),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          width: we,
          height: he,
          child: ListView(
            children: <Widget>[
              Container(
                height: he * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: we * .06),
                      child: Text(
                        "Wearina",
                        style: TextStyle(
                          fontSize: we * .08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: we * .06),
                      child: InkWell(
                        onTap: () {
                          if (state.currentState.isEndDrawerOpen) {
                          } else {
                            state.currentState.openEndDrawer();
                          }
                        },
                        child: Icon(
                          Icons.reorder,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(minHeight: he * .07),
                margin: EdgeInsets.symmetric(horizontal: we * .065),
                padding: EdgeInsets.only(
                    left: we * .03, right: we * .03, top: we * .03),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(he * .015),
                    color: Colors.white24),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    maxLength: 30,
                    textDirection: TextDirection.rtl,
                    cursorColor: Colors.blueGrey[800],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      counterStyle:
                          TextStyle(color: Colors.white, fontSize: we * .03),
                      hasFloatingPlaceholder: true,
                      labelText: "Searche",
                      hintText: "Write You Searche Word...",
                      hintStyle: TextStyle(
                        color: Colors.grey[800],
                      ),
                      labelStyle: TextStyle(
                        fontSize: we * .05,
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: he * .05,
                margin: EdgeInsets.only(
                    top: he * .03, left: we * .05, right: we * .05),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (c, i) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          active = i;
                        });
                      },
                      child: Container(
                        //constraints: BoxConstraints(minHeight: we * .25),
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.symmetric(horizontal: we * .02),
                        decoration: BoxDecoration(
                          color:
                              active == i ? Colors.white24 : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            i == 0 ? "All" : "شماره $i ",
                            style: TextStyle(
                                color: active == i
                                    ? Colors.white
                                    : Colors.grey[800]),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 20,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                height: he * .60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView.builder(
                  itemBuilder: (c, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) =>
                                ItemDetail("shirt $i", "Catagory $i", "63\$"),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: we * .07,
                          right: we * .07,
                          top: he * .04,
                        ),
                        width: we * .8,
                        height: he * .27,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: i.isEven
                                ? Colors.pink[300].withOpacity(.3)
                                : Color(0xFF7c9998).withOpacity(.6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.3),
                                blurRadius: 28,
                                spreadRadius: .1,
                                offset: Offset(2, 4),
                              )
                            ]),
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              width: we,
                              height: he,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(23),
                                    bottomLeft: Radius.circular(23),
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  )),
                            ),
                            Container(
                              width: we,
                              height: he,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    constraints:
                                        BoxConstraints(minWidth: we * .25),
                                    //color: Colors.grey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: Text(
                                            "Shirt $i",
                                            style: TextStyle(
                                              fontSize: we * .040,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "Catogory $i",
                                            style: TextStyle(
                                              color: Colors.blueGrey[800],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "65\$",
                                            style: TextStyle(
                                              fontSize: we * .040,
                                              color: i.isEven
                                                  ? Colors.pink[300]
                                                      .withOpacity(.3)
                                                  : Color(0xFF7c9998)
                                                      .withOpacity(.6),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // constraints: BoxConstraints(
                                    //   minWidth: we * .2,
                                    // ),
                                    width: we * .26,
                                    height: he * .20,
                                    margin: EdgeInsets.only(right: 30),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://cdn8.dissolve.com/p/D2115_232_002/D2115_232_002_1200.jpg"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(var he, IconData icon, int id) {
    return InkWell(
      onTap: () {
        if (id == 1) {
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (c) => Profile()));
        } else if (id == 2) {
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (c) => Checkout()));
        } else if (id == 3) {
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (c) => About()));
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: he * .04),
        decoration: BoxDecoration(
          color: Color(0xFF7c9998),
          shape: BoxShape.circle,
        ),
        child: InkWell(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
