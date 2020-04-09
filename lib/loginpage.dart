import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show radians;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Login Screen',
          ),
        ),
      ),
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool logging = false;

  void login() {
    setState(() {
      logging = true;
    });
    Future.delayed(
        Duration(
          seconds: 10,
        ), () {
      setState(() {
        logging = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.indigo,
                      ),
                      hintText: "Email",
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.indigo,
                      ),
                      hintText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 100,
                    child: logging
                        ? Center(child: LoadingAnimation())
                        : Center(child: LoginButton(onPressed: login)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  final onPressed;

  const LoginButton({this.onPressed});
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scale;
  Duration duration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);
    scale = Tween<double>(begin: 1.0, end: 0.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.forward();
        Future.delayed(duration, () {
          widget.onPressed();
        });
      },
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, builder) {
          return Opacity(
            opacity: scale.value,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LoadingAnimation extends StatefulWidget {
  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> translation;
  Animation<double> rotation;
  Animation<double> scale;
  Animation<Color> colorBlack, colorRed, colorGreen, colorIndigo, colorBlue;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
    translation = Tween<double>(
      begin: 0.0,
      end: 25.0,
    ).animate(controller);
    rotation = Tween<double>(begin: 0.0, end: 360.0).animate(controller);
    scale = Tween<double>(begin: 10.0, end: 20.0).animate(controller);
    colorBlack = ColorTween(end: Color(0xFF000000), begin: Color(0xFFFFFFFF))
        .animate(controller);
    colorRed = ColorTween(end: Color(0xFFFF0000), begin: Color(0xFFFFFFFF))
        .animate(controller);
    colorBlue = ColorTween(end: Color(0xFF0000FF), begin: Color(0xFFFFFFFF))
        .animate(controller);
    colorIndigo = ColorTween(end: Color(0xFF4B0082), begin: Color(0xFFFFFFFF))
        .animate(controller);
    colorGreen = ColorTween(end: Color(0xFF008000), begin: Color(0xFFFFFFFF))
        .animate(controller);
  }

  _buildSmallDots({double angle, Animation<Color> color}) {
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate(
            (translation.value) * cos(rad), (translation.value) * sin(rad)),
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, builder) {
          return Transform.rotate(
            angle: radians(rotation.value),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                _buildSmallDots(angle: 0, color: colorBlue),
                _buildSmallDots(angle: 90, color: colorGreen),
                _buildSmallDots(angle: 180, color: colorIndigo),
                _buildSmallDots(angle: 270, color: colorRed),
                Container(
                  height: scale.value,
                  width: scale.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorBlack.value,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
