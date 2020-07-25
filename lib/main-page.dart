import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Age Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Date of birth",
                    style:
                        TextStyle(fontSize: 18.0, fontStyle: FontStyle.normal),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 12.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       Text(
            //         "Date of birth",
            //         style: TextStyle(fontSize: 18.0),
            //       ),
            //       Text(
            //         "Calender",
            //         style: TextStyle(fontSize: 18.0),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              height: 150.0,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.tealAccent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Age",
                        style: TextStyle(fontSize: 32.0),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "9 ",
                            style: TextStyle(
                                fontSize: 52.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "years",
                            style: TextStyle(fontSize: 24.0),
                          )
                        ],
                      ),
                      Text(
                        "11 months & 9 days",
                      ),
                    ],
                  ),
                  Container(
                    width: 1.0,
                    height: double.infinity,
                    color: Colors.teal,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Next Birthday",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Icon(
                        Icons.cake,
                        size: 36.0,
                      ),
                      Text(
                        "Sunday",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text("0 months & 22 days"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
