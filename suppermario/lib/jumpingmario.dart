import 'dart:math';

import 'package:flutter/material.dart';

class jumpingmario extends StatelessWidget {
  final direction;
  final size;
  jumpingmario({this.direction, this.size});

  @override
  Widget build(BuildContext context) {
    if (direction == "left") {
      return Container(
        width: size,
        height: size,
        child: Image.asset('images/mariostanding.png'),
      );
    } else {
      return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: Container(
            width: size,
            height: size,
            child: Image.asset('images/mariostanding.png'),
          ));
    }
  }
}
