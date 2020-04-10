import 'package:animationexample/herowidget/herosecondpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeroFirstPage extends StatefulWidget {
  @override
  _HeroFirstPageState createState() => _HeroFirstPageState();
}

class _HeroFirstPageState extends State<HeroFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Hero First Page"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Text(
                "Tap here to go to next page.",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HeroSecondPage();
                }));
              },
            ),
            SizedBox(height: 20),
            Center(
              child: Hero(
                tag: "herotag1",
                transitionOnUserGestures: true,
//                flightShuttleBuilder: (context, _, __, ___, ____) {
//                  return Icon(FontAwesomeIcons.arrowAltCircleUp);
//                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.indigo,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      FontAwesomeIcons.plusCircle,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
