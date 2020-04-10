import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeroSecondPage extends StatefulWidget {
  @override
  _HeroSecondPageState createState() => _HeroSecondPageState();
}

class _HeroSecondPageState extends State<HeroSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Hero Second Page"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Text(
                "Tap here to go to previous page.",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Center(
              child: Hero(
                tag: "herotag1",
//                flightShuttleBuilder: (context, _, __, ___, ____) {
//                  return Icon(FontAwesomeIcons.arrowAltCircleDown);
//                },
                transitionOnUserGestures: true,

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
                      size: 50,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
