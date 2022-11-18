import 'dart:math';

import 'package:flutter/material.dart';

class mymario extends StatelessWidget {
  final direction;
  final midrun;

  final size;

  mymario({this.direction, this.midrun, this.size});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        width: size,
        height: size,
        child: midrun
            ? Image.asset('images/mariostanding.png')
            : Image.asset('images/marioruning.png'),
      );
    } else {
      return Transform(
        transform: Matrix4.rotationY(pi),
        alignment: Alignment.center,
        child: Container(
          width: size,
          height: size,
          child: midrun
              ? Image.asset('images/mariostanding.png')
              : Image.asset('images/marioruning.png'),
        ),
      );
    } /*  else {
      return Container(
          width: size,
          height: size,
          child: Image.asset('images/mariostanding.png'));
    } */
  }
}
