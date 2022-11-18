import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {
  final child;
  final function;

  static bool isholdingdown = false;

  mybutton({this.child, this.function});

  bool userholding() {
    return isholdingdown;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        isholdingdown = true;
        function();
      },
      onTapUp: (details) {
        isholdingdown = false;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.brown[300],
          child: child,
        ),
      ),
    );
  }
}
