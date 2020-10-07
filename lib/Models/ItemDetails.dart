import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  String productName;
  String productCat;
  String productPrice;
  ItemDetail(this.productName, this.productCat, this.productPrice);
  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  List image = [
    'https://pngimg.com/uploads/tshirt/tshirt_PNG5449.png',
    'https://www.pngarts.com/files/5/Plain-Yellow-T-Shirt-PNG-Image-Background.png',
    'https://pngimg.com/uploads/tshirt/tshirt_PNG5449.png',
    'https://www.pngarts.com/files/5/Plain-Yellow-T-Shirt-PNG-Image-Background.png',
  ];
  int active = 0;
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
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: he * .02,
                    top: we * .03,
                  ),
                  height: he * .37,
                  width: we,
                  child: Image.network(image[active]),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.only(right: we * .07, top: he * .07),
                  child: Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                    size: we * .06,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: we,
                  height: he * .5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: we * .1, right: we * .1, top: he * .1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Text(widget.productCat),
                            ),
                            Container(
                              child: Text(widget.productName),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: we * .1, right: we * .1, top: he * .006),
                          child: Container(
                            margin: EdgeInsets.only(top: he * .03),
                            child: Text(
                              "Elit amet voluptate sit ad cupidatat. Laboris aliquip ullamco commodo qui in elit ipsum velit ut. Deserunt velit ut sunt laborum labore in incididunt consequat. Consectetur in culpa elit esse tempor ex eu id voluptate elit qui laborum duis. Consequat aliquip ullamco ipsum labore tempor commodo duis minim adipisicing reprehenderit id dolor. Nostrud cupidatat excepteur enim magna elit proident velit deserunt qui pariatur. Sunt sunt consequat id irure laborum laboris tempor labore." +
                                  "Magna aliquip pariatur aute pariatur aliquip do. Officia aliquip enim excepteur proident eu. Aliquip officia sit non dolor. Minim sunt esse occaecat aliqua dolore aute laboris.",
                              textAlign: TextAlign.justify,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          )),
                      InkWell(
                        onTap: () {
                          print("More");
                        },
                        child: Container(
                            height: he * .035,
                            margin: EdgeInsets.symmetric(
                                horizontal: we * .4, vertical: we * .05),
                            decoration: BoxDecoration(
                                color: Color(0xFF7c9998),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[400],
                                      blurRadius: 13,
                                      spreadRadius: 1,
                                      offset: Offset(2, 4))
                                ],
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(child: Text("More"))),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: we,
                    height: he * .1,
                    decoration: BoxDecoration(
                      color: Color(0xFF7c9998),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Container(
                      width: we,
                      height: he,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Text(
                              widget.productPrice,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            height: he * .065,
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Buy",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(bottom: he * .03),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            color: Colors.grey[400],
                            spreadRadius: 1,
                            offset: Offset(2, 2))
                      ]),
                  width: we * .8,
                  height: he * .19,
                  child: ListView.builder(
                    itemBuilder: (c, i) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            active = i;
                          });
                        },
                        child: AnimatedOpacity(
                          opacity: active == i ? 1 : .3,
                          duration: Duration(microseconds: 500),
                          curve: Curves.linear,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: we * .03, vertical: he * .03),
                            width: we * .25,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(image[i]))),
                            //color: i.isEven ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    },
                    itemCount: image.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
