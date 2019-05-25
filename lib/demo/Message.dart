import 'package:flutter/material.dart';
import 'dart:math';
import '../constants/colors.dart';
import '../constants/text.dart';

class WidgetCreator extends StatefulWidget {
  BodyRender createState() => BodyRender();
}

class BodyRender extends State {
  ColorList colorList = new ColorList();
  Random random = new Random();
  int index = 0;

  Color getCurrentColor() => colorList.colors[index];

  void changeIndex() =>
      setState(() => index = random.nextInt(colorList.colors.length));

  void reloadIndex() => setState(() => index = 0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changeIndex(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            TextConstants.TITLE_TEXT,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: getCurrentColor(),
        ),
        body: Center(
          child: Text(
            TextConstants.BODY_TEXT,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 48,
            ),
          ),
        ),
        backgroundColor: getCurrentColor(),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.refresh,
            color: Colors.black,
          ),
          backgroundColor: getCurrentColor(),
          onPressed: () => reloadIndex(),
        ),
      ),
    );
  }
}
