// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:supermari/jumpingmario.dart';
import 'package:supermari/mario.dart';
import 'package:supermari/mashrooms.dart';
import 'package:supermari/mybutoon.dart';
import 'dart:async';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  static double mariox = 0;
  static double marioy = 1;

  double mariosize = 50;
  double shroomx = 0.5;
  double shroomy = 1;

  double time = 0;
  double height = 0;
  double initialheight = marioy;

  String direction = "right";

  bool midrun = false;

  bool midjump = false;

  void ateshroom() {
    if ((mariox - shroomx).abs() < 0.05 && (marioy - shroomy).abs() < 0.05) {
      setState(() {
        shroomx = 2;
        mariosize == 70;
      });
    }
  }

  void prejump() {
    time = 0;
    initialheight = marioy;
  }

  void jump() {
    if (midjump == false) {
      midjump = true;
      prejump();

      Timer.periodic(Duration(milliseconds: 50), (timer) {
        time += 0.05;
        height = -4.9 * time * time + 5 * time;

        if (initialheight - height > 1) {
          midjump = false;
          setState(() {
            marioy = 1;
          });
          timer.cancel();
        } else {
          setState(() {
            marioy = initialheight - height;
          });
        }
      });
    }
  }

  void moveright() {
    direction = "right";
    ateshroom();

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      ateshroom();
      if (mybutton().userholding() == true && (mariox + 0.02) < 1) {
        setState(() {
          mariox += 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void moveleft() {
    direction = "left";
    ateshroom();

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      ateshroom();
      if (mybutton().userholding() == true && (mariox - 0.02) > -1) {
        setState(() {
          mariox -= 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                      child: AnimatedContainer(
                        alignment: Alignment(mariox, marioy),
                        duration: Duration(milliseconds: 0),
                        child: midjump
                            ? jumpingmario(
                                direction: direction, size: mariosize)
                            : mymario(
                                direction: direction,
                                midrun: midrun,
                                size: mariosize,
                              ),
                      ),
                      color: Colors.lightBlue[200]),
                  Container(
                      alignment: Alignment(shroomx, shroomy),
                      child: mymashroom()),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text('MARIO',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 10),
                            Text('0000',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ],
                        ),
                        Column(
                          children: [
                            Text('WORLD',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 10),
                            Text('1-1',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ],
                        ),
                        Column(
                          children: [
                            Text('TIMER',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 10),
                            Text('999',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown[500],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  mybutton(
                    child: Icon(
                      Icons.arrow_back,
                    ),
                    function: moveleft,
                  ),
                  mybutton(
                    child: Icon(
                      Icons.arrow_upward,
                    ),
                    function: jump,
                  ),
                  mybutton(
                    child: Icon(
                      Icons.arrow_forward,
                    ),
                    function: moveright,
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
