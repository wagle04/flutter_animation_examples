import 'package:animationexample/loginpage.dart';
import 'package:animationexample/radialmenu.dart';
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
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RadialMenuBody();
                  }));
                },
                child: Text('Radial Menu'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: Text('Login Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
