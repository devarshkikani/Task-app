import 'package:flutter/material.dart';
import 'package:task/triangle.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //I can also use GetX
  String design = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shape Task"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: RawMaterialButton(
              onPressed: () {
                setState(() {
                  design = "triangle";
                });
              },
              child: CustomPaint(
                painter: TrianglePainter(
                  strokeColor: Colors.orange,
                  strokeWidth: 1,
                  paintingStyle: PaintingStyle.stroke,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.height * 0.1,
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                design = "rectangle";
              });
            },
            child: rectangle(0.1, Colors.green),
          ),
          InkWell(
            onTap: () {
              setState(() {
                design = "circle";
              });
            },
            child: circle(0.1, Colors.red),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (design == "circle") circle(0.3, Colors.black),
                  if (design == "rectangle") rectangle(0.3, Colors.black),
                  if (design == "triangle")
                    CustomPaint(
                      painter: TrianglePainter(
                        strokeColor: Colors.black,
                        strokeWidth: 1,
                        paintingStyle: PaintingStyle.stroke,
                      ),
                      child: Container(
                          width: MediaQuery.of(context).size.height * 0.3,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Triangle",
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 20),
                                ),
                              ],
                            ),
                          )),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            design = "";
          });
        },
        child: Icon(Icons.delete),
      ),
    );
  }

  circle(double size, Color color) {
    return Container(
      width: MediaQuery.of(context).size.height * size,
      height: MediaQuery.of(context).size.height * size,
      margin: EdgeInsets.only(top: 20.0),
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (size == 0.3)
              Text(
                "circle",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }

  rectangle(double size, Color color) {
    return Container(
      width: MediaQuery.of(context).size.height * size,
      height: MediaQuery.of(context).size.height * size,
      margin: EdgeInsets.only(top: 20.0),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: color),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (size == 0.3)
              Text(
                "Rectangle",
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}
