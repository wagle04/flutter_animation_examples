import 'package:animationexample/herowidget/herofirstpage.dart';
import 'package:animationexample/loginpage/loginpage.dart';
import 'package:animationexample/radialmenu/radialmenu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation Practise',
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.indigo,
        textTheme: TextTheme(
          title: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
          body1: GoogleFonts.cairo(),
          body2: GoogleFonts.cairo(),
          button: GoogleFonts.cairo(),
          overline: GoogleFonts.cairo(),
          subtitle: GoogleFonts.cairo(),
          subhead: GoogleFonts.cairo(),
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Animation Example"),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              SingleRaisedButton(
                  text: 'Hero Widget', navigateTo: HeroFirstPage()),
              SingleRaisedButton(text: 'Login Page', navigateTo: LoginPage()),
              SingleRaisedButton(
                  text: 'Radial Menu', navigateTo: RadialMenuBody()),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SingleRaisedButton extends StatelessWidget {
  String text;
  var navigateTo;

  SingleRaisedButton({this.text, this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return navigateTo;
        }));
      },
      child: Text(text),
    );
  }
}
