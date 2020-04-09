import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math.dart' show radians;

class RadialMenuBody extends StatelessWidget {
  const RadialMenuBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Radial Menu"),
        ),
      ),
      body: SizedBox.expand(
        child: RadialMenu(),
      ),
    );
  }
}

class RadialMenu extends StatefulWidget {
  @override
  _RadialMenuState createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }
}

class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> translation;
  final Animation<double> scale;
  final Animation<double> rotation;

  RadialAnimation({this.controller})
      : scale = Tween<double>(begin: 1.5, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.elasticOut,
          ),
        ),
        rotation = Tween<double>(begin: 0.0, end: 360.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.7,
              curve: Curves.decelerate,
            ),
          ),
        );

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }

  _buildButton(double angle, {Color color, IconData icon, String tag}) {
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate(
            (translation.value) * cos(rad), (translation.value) * sin(rad)),
      child: FloatingActionButton(
        child: Icon(icon),
        backgroundColor: color,
        onPressed: _close,
        heroTag: tag,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, builder) {
        return Transform.rotate(
          angle: radians(rotation.value),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildButton(
                0,
                color: Colors.black,
                icon: FontAwesomeIcons.thumbtack,
                tag: "3",
              ),
              _buildButton(
                45,
                color: Colors.green,
                icon: FontAwesomeIcons.sprayCan,
                tag: "4",
              ),
              _buildButton(
                90,
                color: Colors.orange,
                icon: FontAwesomeIcons.fire,
                tag: "5",
              ),
              _buildButton(
                135,
                color: Colors.blue,
                icon: FontAwesomeIcons.kiwiBird,
                tag: "6",
              ),
              _buildButton(
                180,
                color: Colors.teal,
                icon: FontAwesomeIcons.cat,
                tag: "7",
              ),
              _buildButton(
                225,
                color: Colors.indigo,
                icon: FontAwesomeIcons.paw,
                tag: "8",
              ),
              _buildButton(
                270,
                color: Colors.pink,
                icon: FontAwesomeIcons.bong,
                tag: "9",
              ),
              _buildButton(
                315,
                color: Colors.grey,
                icon: FontAwesomeIcons.bolt,
                tag: "10",
              ),
              Transform.scale(
                scale: scale.value - 1.5,
                child: FloatingActionButton(
                  child: Icon(FontAwesomeIcons.timesCircle),
                  onPressed: _close,
                  backgroundColor: Colors.red,
                  heroTag: "1",
                ),
              ),
              Transform.scale(
                scale: scale.value,
                child: FloatingActionButton(
                  child: Icon(FontAwesomeIcons.solidDotCircle),
                  onPressed: _open,
                  heroTag: "2",
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
